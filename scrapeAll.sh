#!/bin/bash
# a wrapper script over KNBH
# to scrape all stories on all the blocks

outdir=$(date +"%y%m%d_%H%M")
mkdir -p $outdir

run() {
    areal=$1    # A, B, C or D
    bl=$2       # padded to 2 digits
    floor=$3

    outfile=$outdir/$areal$bl/$floor.csv
    mkdir -p $outdir/$areal$bl

    # s/\x1B\[[0-9;]*[JKmsu]//g removes colours
    # s/^| //g removes first vertical line
    # s/[ ]*|$//g removes last line and whitespace
    # s/^/$areal$bl|/ adds areal and block to beginning of every line
    python main.py -b=$areal$bl -f=$fl | sed "s/\x1B\[[0-9;]*[JKmsu]//g" | grep -v "+--------------------------------------+" | sed "s/^| //g" | sed "s/[ ]*|$//g" | sed "s/ | /|/g" | grep -v "              \[" | sed "s/^/$areal$bl|/" |  tee -a $outfile
}



ppv() {
    # Koleje pod Palackého vrchem
    # A

    for block in {02..05}
    do
        for fl in {1..9}
        do
            run "A" $block $fl
        done
    done
}

purkynovy() {
    # Purkyňovy koleje
    # B

    for block in 02 05
    do
        for fl in {2..6}
        do
            run "B" $block $fl
        done
    done
    for block in 04 07
    do
        for fl in {1..13}
        do
            run "B" $block $fl
        done
    done
}

listovy() {
    # Listovy koleje
    # C

    for fl in {1..6}
    do
        run "C" "01" $fl
    done
    for block in {02..03}
    do
        for fl in {2..6}
        do
            run "C" $block $fl
        done
    done
}

manesovy() {
    # Mánesovy koleje
    # D
    for block in {01..02}
    do
        for fl in {1..3}
        do
            run "D" $block $fl
        done
    done
}



ppv
purkynovy
listovy
manesovy

# create one file with all entries
find $outdir -type f -exec cat {} > $outdir.csv \;
mv $outdir.csv $outdir/$outdir.csv

echo scraped $(cat $outdir/$outdir.csv | wc -l ) entries

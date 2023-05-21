# KNBH

<p align="center">
  <img src="/img/orly.png?raw=true">
</p>

## Note: As of 18/05/2023, this script stopped working due to new protection from scraping in KolejNet IS which requires a variable symbol to list room inhabitants. Hence this project becomes archived.

## Description

Define woman as a person with surname ending with `á` or firstname ending with `a` or `e`. The script searches persons on the specified floor and block defined by user via parameters. Women are displayed with red bold color.

## Usage

1. Install Python 3
1. Install Python 3 Packages
1. Run `python3 main.py [OPTIONS]`

### Options

```txt
    Help:
        -h
        --help

    Floor:
        -f=NUMBER
        --floor=NUMBER

    Block:
        -b=BLOCK
        --block=BLOCK

    Specific Room:
        -r=NUMBER
        --room=NUMBER

    Empty Rooms:
        -e
        --empty
```

### Example

* Help:
    * `./main.py -h`
    * `python3 main.py -h`

* Example:
    * `./main.py -b=B05 -f=2`
    * `python3 main.py -b=B05 -f=2`

## ScrapeAll.sh

Script to scrape all stories on all the blocks. It writes to a new folder named with current time/date.

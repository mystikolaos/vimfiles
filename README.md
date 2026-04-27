# Vim files

A set of my configuration files for Vim text editor.
This is a compilation of many different configs I made for myself over the long time since I was introduced to Vim in the year 2002.
All gathered together, cleaned up and updated.
It's my oldest and longest evolving work I've ever published; the history you can see here is only a tip of the iceberg!

## Setup

### Prerequisites

Working Git installation available from command line is necessary.

### Linux

Clone the whole repository into `~/.vim` directory:

    git clone git@github.com:mystikolaos/vimfiles.git ~/.vim

### Windows

Clone the whole repository into `~/vimfiles` directory:

    git clone git@github.com:mystikolaos/vimfiles.git ~/.vimfiles

That's it, done!

## Optional components

There are also a few fully optional configuration files that can be installed using the included Bash scripts.
All of the following scripts must be run from `~/.vim` on Linux or `~/vimfiles` on Windows.
Existing files are overwritten without warning, and no backups are made.

### Polish spellcheck dictionary

To install Polish spellcheck dictionary, run the following script:

    ./bin/polish_spell

This script will download Polish [Hunspell][01] dictionary from the [LibreOffice][02] repository and then convert it into local `./spell/pl.utf-8.spl` file that is suitable for Vim's spellchecker.

### Retrobox color scheme

If you are forced to use older version of Vim that does not contain `retrobox` color scheme, you can install it by running the script:

    ./bin/retrobox_scheme

This will download and locally install `retrobox` color scheme for you.
Keep in mind that in some really ancient Vim versions `retrobox` would not work anyway.

### Shell scripts indentation tuning

To disable indenting of case label in Shell scripts code, run the following script:

    ./bin/shell_indent

This script will create a local copy of the Vim Shell indent file, and modify it so that `case` label in Shell scripts is no longer indented.
Reverting to the original default behavior is as simple as deleting the local `./indent/sh.vim` file.

### Smart tabs

To make Vim use tabs for code indentation and spaces for alignment, run the following script:

    ./bin/smart_tabs

This script downloads and locally installs the [Smart Tabs][00] plugin made by Michael Geddes.
Although this plugin has not been maintained for many years, it still works more or less.
However, be aware that it causes <kbd>Backspace</kbd> key misbehavior when used together with `softtabstop` Vim setting.

## Author

Created and [unlicensed][98] by [Mikołaj Bartnicki][99].

[00]:https://www.vim.org/scripts/script.php?script_id=231
[01]:https://hunspell.github.io
[02]:https://libreoffice.org
[98]:UNLICENSE
[99]:mailto:mikolaj@bartnicki.org

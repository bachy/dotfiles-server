# README

## Goal

Create dotfiles that can be installed on production and staging servers.
Provide a familiar shell which contains commonly used commands as shortcuts.

These dotfiles do not override native commands.

## Features

* Pretty prompt
	* Displays environment
	* Displays git branch (if any)
	* Shorter current working directory (replaces /home/&lt;user&gt; with ~)
* SSH config autocompletion
* Git autocompletion
* Git aliases
* Aliases
* Vim config

## Installation

Run the following command:

	git clone git://g-u-i.me/gogs/bachir/dotfiles-server.git ~/.dotfiles-server && cd ~/.dotfiles-server && ./install.sh && cd -

You'll be prompted for an environment (for example: staging, production, ..). This is to easily spot the server we're on.

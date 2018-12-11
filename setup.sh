#!/bin/bash
# Install this in your home directory (~, $HOME)
ln -s ~/dot/.vim               ~/.vim

while true; do
  read -p "Installing on ssh?" yn
  case $yn in
    [Yy]* ) ln -s ~/dot/.vimrc_ssh ~/.vimrc; ln -s ~/dot/.bashrc ~/.bashrc;
      break;;
    [Nn]* ) ln -s ~/dot/.vimrc ~/.vimrc; ln -s ~/dot/.bashrc ~/.bashrc;
      ln -s ~/dot/.bup ~/.bup; ln -s ~/dot/.bdown ~/.bdown;
      ln -s ~/dot/.currentbrightness ~/.currentbrightness; break;;
    * ) "Answer y or n.";;
  esac
done
# ln -s ~/dot/.vimrc             ~/.vimrc
# ln -s ~/dot/.bashrc            ~/.bashrc
# ln -s ~/dot/config             ~/.i3/config
# ln -s ~/dot/.bup               ~/.bup
# ln -s ~/dot/.bdown             ~/.bdown
# ln -s ~/dot/.currentbrightness ~/.currentbrightness

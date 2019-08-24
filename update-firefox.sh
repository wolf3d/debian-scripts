#!/bin/bash

pushd "/home/wolf/Downloads/"

if [ -d "firefox-download" ]; then
  echo "firefox-download exists, removing it"
  rm -fr "firefox-download"
fi

mkdir "firefox-download"

pushd "firefox-download"

wget --content-disposition "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
firefox=$(ls firefox*)

pushd "/usr/lib/"

if [ -d "firefox-esr.old" ]; then
  echo "firefox-esr.old exists, removing it"
  rm -fr "firefox-esr.old"
fi

if [ -d "firefox-esr" ]; then
  echo "firefox-esr exists, renaming it to firefox-esr.old"
  mv "firefox-esr" "firefox-esr.old"
fi

if [ -d "firefox-esr-latest" ]; then
  echo "firefox-esr-latest exists, renaming it to firefox-esr"
  mv "firefox-esr-latest" "firefox-esr"
fi

if [ ! -d "/usr/lib/firefox-esr-latest" ]; then
  echo "firefox-esr-latest does not exist, creating directory firefox-esr-latest"
  mkdir "/usr/lib/firefox-esr-latest"
fi

popd

pushd "/home/wolf/Downloads/firefox-download/"

if [ -d "/usr/lib/firefox-esr-latest" ]; then
  echo "/usr/lib/firefox-esr-latest exists, extracting contents of tape archive to it"
  tar jxvf "$firefox" -C "/usr/lib/firefox-esr-latest"
fi

popd

#!/usr/bin/env bash

set -e

ROOT_DIR=$PWD

cp ./term-private-build-plans.toml ./iosevka/private-build-plans.toml
cd iosevka
npm install
npm run build -- ttf::iosevka-serif-term
cd $ROOT_DIR

cp ./norm-private-build-plans.toml ./iosevka/private-build-plans.toml
cd iosevka
npm install
npm run build -- ttf::iosevka-serif
cd $ROOT_DIR
rm -rf norm/
mv -f ./iosevka/dist/iosevka-serif/ttf/ norm/

cd ./nerdfonts/src/unpatched-fonts
rm -rf *
cd $ROOT_DIR
mv -f ./iosevka/dist/iosevka-serif-term/ttf/ ./nerdfonts/src/unpatched-fonts/iosevka-serif-term
cd ./nerdfonts/bin/scripts
./gotta-patch-em-all-font-patcher\!.sh
mv ../../patched_fonts/* ../../../

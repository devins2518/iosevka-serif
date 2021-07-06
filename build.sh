#!/usr/bin/env bash

set -e

cp ./term-private-build-plans.toml ./iosevka/private-build-plans.toml
cd iosevka
npm install
npm run build -- ttf::iosevka-serif-term
cd ..
rm -rf term/
mv -f ./iosevka/dist/iosevka-serif-term/ttf/ term/

cp ./norm-private-build-plans.toml ./iosevka/private-build-plans.toml
cd iosevka
npm install
npm run build -- ttf::iosevka-serif
cd ..
rm -rf norm/
mv -f ./iosevka/dist/iosevka-serif/ttf/ norm/

for file in ./term/*; do
    ./nerdfonts/font-patcher -c -out out $file &
done
wait

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

echo "Skipping nerd font patching, as it's broken currently. Possibly too many glyphs for 16bits."
rm -rf out/
mkdir out
mv -f ./term/* out/
# for file in ./term/*; do
#     ./nerdfonts/font-patcher -c -out out $file &
# done
# wait

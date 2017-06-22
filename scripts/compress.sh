#!/bin/bash

cd ../release

if [ ! -d ZIP ]; then
 mkdir ZIP
fi

for file in *;
do
 if [ "$file" != "ZIP" ]; then
  zip -q "${file%.*}.zip" "$file"
 fi
done

mv *.zip ZIP
echo "Done"

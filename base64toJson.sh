#!/usr/bin/env bash
#
# Azer Bulbul
#

filename="your-file-name.txt"
base64 --decode ${filename}  > "${filename}-decompressed.txt"
python -m json.tool "${filename}-decompressed.txt" > "${filename}-linted.txt"

rm "${filename}-decompressed.txt"

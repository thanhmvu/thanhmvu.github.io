#!/bin/bash

## Make executable: chmod +x filename.sh
## Execute: ./filename.sh

filename=$1
outfile="./r/${filename}.html"
url=$2

## check
[ ! -d "./r/" ] && echo "ERROR: Directory ./r/ does not exist." && exit 1
[ -f $outfile ] && echo "ERROR: File ${outfile} already exists." && exit 1

## create
cat << EOF > $outfile
<meta http-equiv="refresh" content="0; url=$url" />
EOF
more $outfile
# cat << EOF > $outfile
# <!DOCTYPE html>
# <html>
# 	<head>
# 		<meta http-equiv="refresh" content="0; url=$url" />
# 	</head>
# </html>
# EOF

## git
git pull
git add $outfile
git commit -m "Add redirect link thanhmvu.com/r/${filename}"
git push

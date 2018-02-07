#!/bin/bash
#
# Azer Bulbul
#
# Download : http://yui.github.io/yuicompressor/
#
# chmod 755 minifier.sh
# Usage:
# ./minifier.sh filename.css
# ./minifier.sh filename.js


minify ()
{
	printf "Minifying $(basename $1)..."
	java -jar ~/Documents/yuicomressor/yuicompressor-2.4.8.jar $1 -o $1 --charset utf-8
	if [[ $1 =~ \.css$ ]]
	then
		#fix for yui incorrectly stripping CSS characters
		sed -i '' 's/ease 0\([,;]\)/ease\1/' $1
		sed -i '' 's/ease 0}/ease}/' $1
	fi
	printf "done\n"
}


package () {
	printf "Compressing $(basename $1)..."
	gzip -9 $1
	mv $1.gz $1
	printf "done\n"
}

minify $1
package $1

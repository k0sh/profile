#!/bin/bash

for page_in in *.html; do
	page_out="$(basename $page_in .html).htm"
	cat $page_in | sed -e's/<a href="\.\.\/index\.html".*$//g' -e's/^<b>Data Structures and Algorithms//g' -e's/^with Object-Oriented Design.*$//g' -e 's/<A NAME="tex2html.*>.*<\/A>//g' -e 's/<a href="\.\.\/copyright\.html">.*$//g' -e 's/<HR>//g' -e 's/<img src="\.\.\/icons\/bruno\.gif".*$//g'> $page_out
	rm -f $page_in
done

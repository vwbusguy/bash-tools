#!/bin/bash

mkdir -p ./docs
for pyf in $(find . -type f -name "*.py" | sed 's,\./,,g;s,\.py,,g');
	do DOCFILE=$(pydoc3 -w $pyf | sed 's,wrote ,,g');
	mv $DOCFILE docs;
done;

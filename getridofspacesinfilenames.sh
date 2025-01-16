#!/bin/bash
for i in *\ * ; do mv "$i" "${i// /}" ; done

# si il ya un ".ps" en trop dans les filenames :
# for i in *\.ps* ; do mv "$i" "${i//.ps/}" ; done

#!/usr/bin/env bash
comm -23 <(cat _site/index.html | aspell list --mode=html | sort --unique) <(sort ignore_dict.txt)

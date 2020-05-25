#!/bin/bash

FILE = $1;

LAST_UPDATE = stat ${FILE} | awk '{print $2}';

while [true]; do
	THIS_UPDATE = stat ${FILE} | awk '{print $2}';
	if [$THIS_UPDATE -neq $LAST_UPDATE] then
		sml $FILE;



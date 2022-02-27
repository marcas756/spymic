#!/bin/bash


if [ -e $SPYMIC_DIR/spymic.pid ]
then
	kill -s 9 `cat $SPYMIC_DIR/spymic.pid`
	rm $SPYMIC_DIR/spymic.pid
fi



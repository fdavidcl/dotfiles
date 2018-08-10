#!/bin/bash
folders=Documents Downloads Music Pictures Videos Sync

for F in $folders
do
    ln -sv /media/datos/$F ~/
done

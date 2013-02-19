#!/bin/bash

# Set colors

case "$1" in
        "start")
                cd
                mkdir briansettings
                mv .vimrc briansettings/.vimbk
                wget 
                ;;
        *)
        echo "Usage: mate-term-solarize [light | dark | unset]"
        exit
        ;;
esac


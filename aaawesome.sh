solarize () {
   case "$derp" in
        "dark")
                THEME_BG="--set /apps/mate-terminal/profiles/Default/use_theme_background --type bool false"
                THEME_COLOR="false"
                PALETTE="#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
                BG_COLOR="#00002B2B3636"
                FG_COLOR="#65657B7B8383"
                BG_DARKN="0.97"
                BG_TYPE="transparent"
                ;;
        "light")
                THEME_BG="--set /apps/mate-terminal/profiles/Default/use_theme_background --type bool false"
                THEME_COLOR="false"
                PALETTE="#EEEEE8E8D5D5:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#070736364242:#FDFDF6F6E3E3:#CBCB4B4B1616:#9393A1A1A1A1:#838394949696:#65657B7B8383:#6C6C7171C4C4:#58586E6E7575:#00002B2B3636"
                BG_COLOR="#FDFDF6F6E3E3"
                FG_COLOR="#838394949696"
                BG_DARKN="0.91"
                BG_TYPE="transparent"
                ;;
        "unset")
                THEME_BG="--unset /apps/mate-terminal/profiles/Default/use_theme_background"
                THEME_COLOR="true"
                PALETTE="#2E2E34343636:#CCCC00000000:#4E4E9A9A0606:#C4C4A0A00000:#34346565A4A4:#757550507B7B:#060698209A9A:#D3D3D7D7CFCF:#555557575353:#EFEF29292929:#8A8AE2E23434:#FCFCE9E94F4F:#72729F9FCFCF:#ADAD7F7FA8A8:#3434E2E2E2E2:#EEEEEEEEECEC"
                BG_COLOR="#FFFFFFFFDDDD"
                FG_COLOR="#000000000000"
                BG_DARKN="0.5"
                BG_TYPE="solid"
                ;;
        *)
        echo "Usage: mate-term-solarize [light | dark | unset]"
        exit
        ;;
   esac

   mateconftool-2 $THEME_BG
   mateconftool-2 --set /apps/mate-terminal/profiles/Default/use_theme_colors   --type   bool $THEME_COLOR
   mateconftool-2 --set /apps/mate-terminal/profiles/Default/palette            --type string $PALETTE
   mateconftool-2 --set /apps/mate-terminal/profiles/Default/background_color   --type string $BG_COLOR
   mateconftool-2 --set /apps/mate-terminal/profiles/Default/foreground_color   --type string $FG_COLOR
   mateconftool-2 --set /apps/mate-terminal/profiles/Default/background_darkness --type float $BG_DARKN
   mateconftool-2 --set /apps/mate-terminal/profiles/Default/background_type    --type string $BG_TYPE
}

brianmode () {
   backup=$PWD
   cd
      if [ -d "briansettings" ]
      then
         cd
         cd briansettings
         mv .vimbk ../.vimrc
         derp=unset
         solarize
         cd ..
         rm -rf briansettings
         cd $backup
         rm cpseclab
   
      elif ! [ -d "briansettings" ]
      then
         export PULSE_SERVER=media
         echo 'sheep'
         # To home we go
         cd
             
         # Temp Brian dir
         mkdir briansettings

         # Backup vimrc
         mv .vimrc briansettings/.vimbk
         wget --no-check-certificate https://raw.github.com/freshvolk/seclab-customized/master/brianrc
         mv brianrc .vimrc
             
         # Dark solarize this shit
         derp=dark
         solarize
            
         # should we run some fishy goodness?
         # wget http://www.scientifichooliganism.com/seclabfish.tar
         # tar -xvf seclabfish.tar
         # ./seclabfish/bin/fish

    else
       echo "WHERE'S RACHEL"
    fi

    cd $backup
    
 }

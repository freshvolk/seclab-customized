brianmode () {
   backup=$PWD
   cd
      if [ -d "briansettings" ]
      then
         cd
         cd briansettings
         mv .vimbk ../.vimrc
         bash solarized.sh unset
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
         cd briansettings
         wget --no-check-certificate https://raw.github.com/freshvolk/seclab-customized/master/solarized.sh
         chmod +x solarized.sh
         bash solarized.sh dark
            
         # should we run some fishy goodness?
         # wget http://www.scientifichooliganism.com/seclabfish.tar
         # tar -xvf seclabfish.tar
         # ./seclabfish/bin/fish

    else
       echo "WHERE'S RACHEL"
    fi

    cd $backup
    
 }

brianmode

#!/usr/bin/env bash

main() {

  if [ -d "/boot/grub" ]
  then
    echo -e "\e[1m\e[32m==> \e[97mCopying files...\e[0m"
    cp -rf blur-grub2-fullhd /boot/grub/themes/
  else
    echo -e "\e[1m\e[32m==> \e[97mCopying files...\e[0m"
    cp -rf blur-grub2-fullhd /boot/grub2/themes/
  fi

  echo -e "\e[1m\e[97m  You must set the theme in your GRUB config file,"
  while : ;do
    if [ "$answer" = "g" ];then
      echo -e "\e[1m\e[97m  You didn't give a valid option, try again."
    else
      read -p "  Would you like to do it now? [y/n] " -t 10 answer
      echo -e "\e[0m"
      if [ "$answer" = "y" ];then
        if [ -d "/boot/grub" ];then
            i=$(sed -n 's,^#\?GRUB_THEME=,&,p' /etc/default/grub)
                if [[ -z $i ]]; then
                    echo -e "\nGRUB_THEME=/boot/grub/themes/blur-grub2-fullhd/theme.txt" >> /etc/default/grub
                else
                    sed "s,^#\?GRUB_THEME=.*,GRUB_THEME=/boot/grub/themes/blur-grub2-fullhd/theme.txt," </etc/default/grub >/etc/default/grub.~
                    mv /etc/default/grub.~ /etc/default/grub
                fi
          echo -e "\e[1m\e[32m==> \e[97mApplying changes...\e[0m"
          grub-mkconfig -o /boot/grub/grub.cfg
          echo -e "\e[1m\e[34m  -> \e[97mTheme successfuly applied!"
          echo -e "\e[1m\e[34m  -> \e[97mRestart your PC to check it out."
          sleep 2
          break
        else
            i=$(sed -n 's,^#\?GRUB_THEME=,&,p' /etc/default/grub)
                if [[ -z $i ]]; then
                    echo -e "\nGRUB_THEME=/boot/grub2/themes/blur-grub2-fullhd/theme.txt" >> /etc/default/grub
                else
                    sed "s,^#\?GRUB_THEME=.*,GRUB_THEME=/boot/grub2/themes/blur-grub2-fullhd/theme.txt," </etc/default/grub >/etc/default/grub.~
                    mv /etc/default/grub.~ /etc/default/grub
                fi
          echo -e "\e[1m\e[32m==> \e[97mApplying changes...\e[0m"
          grub2-mkconfig -o /boot/grub2/grub.cfg
          echo -e "\e[1m\e[34m  -> \e[97mTheme successfuly applied!"
          echo -e "\e[1m\e[34m  -> \e[97mRestart your PC to check it out."
          sleep 2
          break
        fi
      elif [ "$answer" = "n" ];then
        break
      fi
      let answer=g
    fi
  done

}

main "$@"

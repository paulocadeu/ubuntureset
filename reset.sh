#!/bin/bash
#-------------------------------------------------------#
#                       Variaveis                       #
#-------------------------------------------------------#
home=~/
wallpaper="/wallpaper-inf-16x9.png"
wallpaperDir="Imagens/Wallpapers"
#-------------------------------------------------------#
#                       Funcoes                         #
#-------------------------------------------------------#
function preWipe
{
    echo "------------Iniciando o reset deste usuario------------"
    cp -r ./Wallpapers /tmp
}
function posWipe
{
    echo "--------------------Reset concluido--------------------"
    #systemctl reboot
    counter=$((10+0))
    echo "Reiniciando o computador em "$counter
    while [ $counter -gt $((0)) ];
    do 
        counter=$(($counter-1))
        echo $counter
        sleep 1
    done
    systemctl reboot
}
function setWallpaper
{
    echo "Restaurando Wallpaper"
    cp -r /tmp/Wallpapers $home$wallpaperDir
    gsettings set org.gnome.desktop.background picture-uri file://$home$wallpaperDir$wallpaper
}
function setHorizontalLauncher
{
    echo "Ajustando Barra de Tarefas"
    gsettings set com.canonical.Unity.Launcher launcher-position Bottom
}
function wipeUser
{
    echo "Limpando Pastas"
    cd $home
    rm -rf *
    xdg-user-dirs-update
    xdg-user-dirs-update --force
    cp /etc/skel/.bashrc ~/.bashrc
    source ~/.bashrc
}
#-------------------------------------------------------#
#                          Main                         #
#-------------------------------------------------------#
preWipe
wipeUser
setHorizontalLauncher
setWallpaper
posWipe
cd
rm -rf * .*

xdg-user-dirs-update
xdg-user-dirs-update --force

cp /etc/skel/.bashrc ~/.bashrc

source ~/.bashrc

echo "Reset concluido"



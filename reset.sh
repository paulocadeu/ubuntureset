echo "Iniciando o reset deste usuario"

cd
rm -rf * .*
xdg-user-dirs-update
xdg-user-dirs-update --force
cp /etc/skel/.bashrc ~/.bashrc
source ~/.bashrc

gsettings set com.canonical.Unity.Launcher launcher-position Bottom

git clone https://github.com/paulocadeu/vimportable
cd vimportable
./install.sh

echo "Reset concluido"



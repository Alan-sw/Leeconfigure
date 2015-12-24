#!bin/sh

echo "Install will cost a long time, have a coffee..."

#ubuntu or redhat
if  which apt-get > /dev/null ; then
    sudo apt-get install -y vim vim-gnome python-dev git zsh tmux
elif which yum > /dev/null; then
    sudo yum -y install vim git python-devel zsh gcc kernel-devel make ncurses-devel

    #install tmux
    cd ~/Downloads
    curl -OL https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
    tar -xzf libevent-2.0.21-stable.tar.gz
    cd libevent-2.0.21-stable
    ./configure --prefix=/usr/local
    make && sudo make install
    
    cd ~/Downloads
    curl -OL http://downloads/sourceforge.net/tmux/tmux-1.9a.tar.gz
    tar -xzf tmux-1.9a.tar.gz
    cd tmux-1.9a
    LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local
    make && sudo make install
fi

#get Leeconfigure
git clone https://github.com/Alan-sw/Leeconfigure.git ~/.Leeconfigure

#install vi vundle 
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#get oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

#change theme to my af-magic
cp ~/.Leeconfigure/zshConfigure/af-magic.zsh-theme ~/.oh-my-zsh/themes/af-magic.zsh-theme

#add .zshrc
cp ~/.Leeconfigure/zshConfigure/.zshrc ~/.zshrc

#change bash to zsh, will effect after reboot
chsh -s /bin/zsh

#add .tmux.conf
cp ~/.Leeconfigure/tmuxConfigure/.tmux.conf ~/.tmux.conf

#add .vimrc
cp ~/.Leeconfigure/vimConfigure/vimrc_without_ycm ~/.vimrc

#install vi plugins
echo -e "\n\n-----Please click ENTER to ignore errors-----"
echo -e "    -----It will take a long time           -----\n"
vim -c "BundleInstall" -c "q" -c "q"

#remove Leeconfigure
rm -rf ~/.Leeconfigure

echo "Please reboot to run zsh!!!"
echo "Install finished! Have fun"

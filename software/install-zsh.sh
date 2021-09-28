#!/bin/bash

echo
echo "################################################################"
echo "  Installing Z Shell + Oh My Zsh                                "
echo "################################################################"
echo

if ! package=$(dpkg-query --list | grep "fonts-powerline"); then
    wget https://download.jetbrains.com/fonts/JetBrainsMono-2.001.zip
    unzip JetBrainsMono-2.001.zip
    cd JetBrainsMono-2.001/
    cp ./* /usr/local/share/fonts
    fc-cache -f -v
fi

if ! location=$(type -p "zsh"); then
    sudo apt install -y zsh
    chsh -s $(which zsh)
fi


if ! location=$(type -p "terminator"); then
    sudo apt install -y terminator
fi

if ! [ -a "~/.zshrc" ]; then
    echo
    echo "+--------------------------------------------------------------+"
    echo "| Oh My Zsh will be installed, after installation it will      |"
    echo "|     appear inside the new shell.                             |"
    echo "| Type the 'exit' command to exit Z shell and                  |"
    echo "|     continue the installation                                |"
    echo "+--------------------------------------------------------------+"
    echo
    read -p "Press enter to continue"

    SETUP_DIR="$(pwd)"

    cd ~
    sh -c "$(wget -qO - https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    cd ~/.oh-my-zsh/custom/plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-completions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins autoupdate
    git clone https://github.com/romkatv/powerlevel10k.git

    cd ${SETUP_DIR}

    sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g" ~/.zshrc
    sed -i "s/plugins=(git)/plugins=(\n  git\n  zsh-completions\n  zsh-syntax-highlighting\n  autoupdate\n  zsh-autosuggestions\n)/g" ~/.zshrc

#    echo "POWERLEVEL9K_MODE="nerdfont-complete"" >> ~/.zshrc
#    echo "" >> ~/.zshrc
    echo "DEFAULT_USER=\$USER" >> ~/.zshrc
    echo "" >> ~/.zshrc
    echo "alias zshconfig=\"nano ~/.zshrc\"" >> ~/.zshrc
    echo "alias gbg="gb | grep $1"" >> ~/.zshrc
    echo "alias di='docker ps | fzf | awk "{print \$1}" | xargs docker inspect'" >> ~/.zshrc
fi

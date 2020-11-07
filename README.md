# Instalacion de WSL y Actualizacion a WSL 2

1. Primeramente se debe configurar el equipo activando las caracteristica WSL en windows.
2. Seguido instalando la distro deseada, en mi caso Debian.
3. Instalar Windows Terminal (Opcional).
Puede guiarse con el siguiente tutorial: 
		* https://terminaldelinux.com/terminal/wsl/instalacion-configuracion-wsl/

# Configuracion del Distro Debian


Una vez instalado se procede a configurar debian
para ello vamos a editar el archivo de configuracion como
~~~bash
nano ~/.bashrc
~~~

# Alias
Primeramente añadir algunos alias, tambein se pueden añadir al final 
del archivo **~/.bashrc** o crear un archivo especifico para almacenar 
los alias como 
~~~bash
nano ~/.bash_aliases
~~~
y se le agrega
~~~bash
# My Aliases
alias cls=clear
~~~
Se debe guardar cerrar e iniciar de nuevo para que apliquen los cambios

# Instalacion de programas basicos

~~~bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential
sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
sudo apt-get install git
~~~

Install neovim to /usr/local:
~~~bash
sudo apt-get install -y mercurial
cd /tmp/ && git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=Release
sudo make install
~~~

Pip install:
~~~bash
sudo apt-get install -y python3-setuptools
sudo apt-get install -y python3-pip
python3 -m pip install wheel
python3 -m pip install pynvim
python3 -m pip install jedi pylint
python3 -m pip install neovim-remote
sudo apt-get install -y texlive
sudo apt-get install -y latexmk
~~~

Ruby install:
Note: You cannot use gem with hamachi adapter enabled.
~~~bash
sudo apt-get install -y ruby-full
sudo gem install neovim
~~~

Node install:
~~~
sudo apt-get install -y curl
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g neovim
sudo npm install -g wsl-open
sudo update-alternatives --install /usr/bin/xdg-open xdg-open /usr/bin/wsl-open 100
~~~

# Install maven:
~~~
sudo apt-get install -y maven
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.profile
source ~/.profile
~~~

# Node Version Manager

~~~bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
~~~

Add this in .bashrc
~~~bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
~~~

Now install latest version in 
# Configuracion de Neovim

Primeramente debemos crear las carpetas para guardar las configuraciones

~~~bash
mkdir ~/.config
mkdir ~/.config/nvim
cd ~/.config/nvim
nvim init.vim
~~~

Añadir las siguientes lineas
~~~bash
set number
~~~
Se debe guardar cerrar e iniciar de nuevo para que apliquen los cambios

Ahora se instalara el administrador de plugins
~~~bash
cd ~
mkdir .config/nvim/autoload
curl -fLo ~/.config/nvim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
~~~



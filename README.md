# Instalacion de WSL y Actualizacion a WSL 2

1. Primeramente se debe configurar el equipo activando las caracteristica WSL en windows.
2. Seguido instalando la distro deseada, en mi caso Debian.
3. Instalar Windows Terminal (Opcional).
Puede guiarse con el siguiente tutorial: 
		* https://terminaldelinux.com/terminal/wsl/instalacion-configuracion-wsl/  

Nota: Para actualizar a wsl 2 debe instalar el paquete de actualizacion de wsl kernel de linux disponible en  
https://docs.microsoft.com/en-us/windows/wsl/install-win10#step-4---download-the-linux-kernel-update-package  

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
sudo apt-get install python-setuptools
sudo apt-get install -y python-pip
sudo python -m pip install pynvim
sudo apt-get install -y python3-setuptools
sudo apt-get install -y python3-pip
sudo python3 -m pip install wheel
sudo python3 -m pip install pynvim
sudo python3 -m pip install jedi pylint
sudo python3 -m pip install neovim-remote
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

# GOLANG
~~~bash
sudo apt-get install golang
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
mkdir .config/nvim/plugged
mkdir .config/nvim/autoload
curl -fLo ~/.config/nvim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
~~~
Configure el 
## Problemas

* Si windows no encuentra los ejecutables(.exe) o no puede ejecutarlos

Proceda a realizar lo siguiente 
Abrir la configuracion del perfil de usuario
~~~bash
sudo nvim /etc/profile
~~~
Y por favor comente las siguientes lineas como:  
~~~
# if [ "`id -u`" -eq 0 ]; then
#   PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# else
#   PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
# fi
# export PATH
~~~
Probablemente el distro este cambiando el PATH y no permite encontrar ni ejecutar los .exe
Mas información en:
[Click aqui](
https://docs.microsoft.com/en-us/windows/wsl/troubleshooting#command-not-found-when-executing-windows-exe-in-linux)

* Problema de Codificación de algun archivo o E492: Not an editor command: Pluginstall 
No se encuentra el comando PlugInstall, probablemente la codifiación no este en UNIX en todos los archivos
Abra cada archivo con nvim y escriba 
~~~bash
:set ff=unix 
~~~
Para cambiar la codificación a UNIX e intentelo nuevamente

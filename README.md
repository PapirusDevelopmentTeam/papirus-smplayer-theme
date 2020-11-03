<p align="center">
  <img src="https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-smplayer-theme/master/preview.png" alt="Preview Papirus Dark"/>
</p>

## Installation

### Papirus Installer

Use the scripts to install the latest version directly from this repo (independently on your distro):

#### Install / Update

```
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-smplayer-theme/master/install.sh | sh
```

#### Remove

```
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-smplayer-theme/master/install.sh | env uninstall=true sh
```

### Packages

Since SMPlayer version 16.6 and higher, Papirus and Papirus Dark themes were added to the package `smplayer` (`smplayer-themes` on Ubuntu).

If your version lower than 16.6 you can update SMPlayer from the [official site](http://smplayer.sourceforge.net/en/downloads).

###  Manual Install

1. Install dependencies:

    - git
    - make
    - librsvg2-bin
    - qtbase5-dev-tools

2. Run the following commands as normal user:

    ```
    git clone https://github.com/PapirusDevelopmentTeam/papirus-smplayer-theme.git
    cd papirus-smplayer-theme
    make build
    sudo make install
    ```

3. Start SMPlayer and choose a theme.

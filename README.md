```bash
yaourt -S clang libc++ libc++abi nvim mercurial cmake rust-src
```

```bash
cd ~
mv .config/nvim .config/nvim.old > /dev/null 2>&1
git clone https://github.com/mateusmedeiros/nvim.git .config/nvim
nvim +PlugInstall +quit +quit
```

```bash
curl -sf https://raw.githubusercontent.com/brson/multirust/master/blastoff.sh | sh
cargo install racer
cd .config/nvim/plugged/YouCompleteMe
CC=clang CXX=clang++ CXXFLAGS="-std=c++11 -stdlib=libc++" LDFLAGS="-stdlib=libc++ -lc++abi" /usr/bin/python2 install.py --clang-completer --system-libclang --racer-completer
sudo npm install -g eslint eslint_d babel-eslint esling-plugin-react
gem install rubocop
```

See .tmux.conf. https://gist.github.com/mateusmedeiros/e6c7301e9956de123da4.
```bash
set -g update-environment 'DISPLAY SSH_ASKPASS SSH_AGENT_PID SSH_CONNECTION WINDOWID XAUTHORITY TERM'
if "[[ ${TERM} =~ 256color || ${TERM} == fbterm ]]" 'set -g default-terminal screen-256color'
```

See .zshrc. https://github.com/mateusmedeiros/zsh-config/blob/master/.zshrc
```bash
export TERM="screen-256color"
```

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


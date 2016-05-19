```bash
yaourt -S clang libc++ libc++abi mercurial cmake rust-src
```

```bash
cd ~
curl -sf https://raw.githubusercontent.com/brson/multirust/master/blastoff.sh | sh
cargo install racer
mv .config/nvim .config/nvim.old > /dev/null 2>&1
git clone https://github.com/mateusmedeiros/nvim.git .config/nvim
vim +PlugInstall +quit +quit
cd .config/nvim/plugged/YouCompleteMe
CC=clang CXX=clang++ CXXFLAGS="-std=c++11 -stdlib=libc++" LDFLAGS="-stdlib=libc++ -lc++abi" /usr/bin/python2 install.py --clang-completer --system-libclang --racer-completer
```

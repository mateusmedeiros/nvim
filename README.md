```bash
yaourt -S clang libc++ libc++abi mercurial gvim cmake rust-src
```

```bash
cd ~
curl -sf https://raw.githubusercontent.com/brson/multirust/master/blastoff.sh | sh
cargo install racer
mv .vim .vim.old > /dev/null 2>&1
git clone https://github.com/mateusmedeiros/.vim.git
mv .vimrc .vimrc.old > /dev/null 2>&1
ln -s .vim/.vimrc .vimrc
vim +PlugInstall +quit +quit
cd .vim/plugged/YouCompleteMe
CC=clang CXX=clang++ CXXFLAGS="-std=c++11 -stdlib=libc++" LDFLAGS="-stdlib=libc++ -lc++abi" /usr/bin/python2 install.py --clang-completer --system-libclang --racer-completer
```

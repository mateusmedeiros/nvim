```bash
yaourt -S clang libc++ libc++abi mercurial gvim cmake
```

```bash
cd ~
mv .vim .vim.old > /dev/null 2>&1
git clone https://github.com/mateusmedeiros/vim-config.git .vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
mv .vimrc .vimrc.old > /dev/null 2>&1
ln -s .vim/.vimrc .vimrc
vim +qall
cd .vim/bundle/YouCompleteMe
CC=clang CXX=clang++ CXXFLAGS="-std=c++11 -stdlib=libc++" LDFLAGS="-stdlib=libc++ -lc++abi" ./install.sh --clang-completer --system-libclang
```

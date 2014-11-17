```bash
yaourt -S clang
yaourt -S libc++
yaourt -S libc++abi
yaourt -S mercurial
yaourt -S gvim
```

```bash
cd ~
mv .vim .vim.old > /dev/null 2>&1
git clone https://github.com/mateusmedeiros/vim-config.git .vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
vim +qall
cd .vim/bundle/YouCompleteMe
git submodule update --init --recursive
CC=clang CXX=clang++ CXXFLAGS="-std=c++11 -stdlib=libc++" LDFLAGS="-stdlib=libc++ -lc++abi" ./install.sh --clang-completer --system-libclang
cd ~
mv .vimrc .vimrc.old > /dev/null 2>&1
ln -s .vim/.vimrc .vimrc
```

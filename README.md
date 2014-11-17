```bash
yaourt -S clang
yaourt -S libc++
yaourt -S libc++abi
```

```bash
cd ~
mv ~/.vim ~/.vim.old > /dev/null 2>&1
git clone https://github.com/mateusmedeiros/vim-config.git .vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
vim +BundleInstall +qall
CC=clang CXX=clang++ CXXFLAGS="-std=c++11 -stdlib=libc++" LDFLAGS="-stdlib=libc++ -lc++abi" ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer --system-libclang
mv ~/.vimrc ~/.vimrc.old > /dev/null 2>&1
ln -s .vim/.vimrc .vimrc
```

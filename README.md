# What's this?
Hello! This is my neovim configuration.

## Why it's not part of a dotfiles repo?
I'm not too fond of having a "big" dotfiles repository because the two main
things I ever felt the need to manage and version control were my neovim
configuration and my zsh configuration. It seemed to me like it would be a
little overkill.

Sometimes I also like things simple, and to me this is a simple way to keep the
configuration files decoupled.

## How do I use this?
Well, you're supposed to clone it inside your `$HOME/.config`. This repository
is made to be the whole of your `nvim` directory inside `.config`.

```bash
cd ${XDG_CONFIG_HOME:-$HOME}/.config
git clone https://github.com/mateusmedeiros/nvim.git
```

## Do I need to do anything else?
Glad I asked (because I'm the one writing this, get it? hahaha... haha...
:pensive:). I'm always commiting changes to this repository, so stuff isn't
always up-to-date here on the README, but I try to do my best!

Don't worry, though. Since I made the move to neovim and deoplete, stuff got
much easier.  You still need to do some things, though (besides installing
neovim).

### Install ruby bindings

```bash
gem install neovim
```

Make sure your neovim has access to the same ruby installation you used to gem
install, or else it may not find the ruby binary or find a ruby binary for a
version without the gem installed.

### Install python bindings

```bash
pip2 install neovim
pip3 install neovim
```

The important thing is to install the `neovim` package with the python version (2 or
3) you have in your system (or both).

The names of the binaries may vary. If you need to set unconventional paths for
the python installations in which you installed the eggs, take a look at [the
neovim provider docs](https://neovim.io/doc/user/provider.html#provider-python).

### Install racer

This is only needed if you intend to use Rust completion with this
configuration.

```bash
cargo install racer
```

You also need the rust source files. If you used rustup to install rust in your
computer, you can do that with the following command:

```bash
rustup component add rust-src
```

### Install eslint (and friends)

This is only needed if you intend to use neomake lint within javascript files.

```bash
npm install -g eslint eslint_d babel-eslint eslint-plugin-react
```

 * `eslint_d` keeps an instance of eslint runnning on the background, which gives
an increase in speed of like, a hundrillion times.
 * `babel-eslint` and `eslint-plugin-react` are more specific to my use cases,
   so you may leave them out if you don't intend to use babel and/or jsx.

### Install rubocop

This is only needed if you intend to use neomake lint within ruby files.

```bash
gem install rubocop
```

Make sure neovim has access to that ruby installation.
See [Install ruby bindings](#install-ruby-bindings)

### Install Dogma and Credo

If you intend to use elixir linting, a few things must be set up.

Dogma:

```bash
git clone https://github.com/lpil/dogma
cd dogma
mix deps.get
mix archive.build
mix archive.install
```

Bunt:

```bash
git clone https://github.com/rrrene/bunt
cd bunt
mix archive.build
mix archive.install
```

Credo:

```bash
git clone https://github.com/rrrene/credo
cd credo
mix deps.get
mix archive.build
mix archive.install
```

### And last, but not least: PlugInstall

```bash
nvim +PlugInstall
```

# Contributing

These files are very personal, so I'm guessing you'll probably take a look at it
as a reference to copy some parts or see how I organized stuff. Maybe even fork
and modify, but probably not contribute back to the repo itself because it's all
very subjective and stuff.

That's ok! But if you find a typo, or some other error, feel free to open an
issue, a Pull Request, anything.

# License

I'm not sure if licensing even applies to configuration files, but if it does,
consider this MIT.

## general
`sudo apt install git gcc g++ cmake make gdb htop curl wget stow`

## nvim 0.12
(from source - nighlty branch)
`git clone --branch=nightly --depth=1 https://github.com/neovim/neovim.git`
`make CMAKE_BUILD_TYPE=RelWithDebInfo`
`sudo make install`

## starship
`curl -sS https://starship.rs/install.sh | sh`
in bashrc: `eval "$(starship init bash)"`

## uv (python)
`curl -LsSf https://astral.sh/uv/install.sh | sh`
in bashrc: `eval "$(uv generate-shell-completion bash)"`

## OCaml / OxCaml
opam:
+ `bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"`
+ `opam init`
`opam install ocaml-lsp-server ocamlformat utop`

## fzf 
+ `wget https://github.com/junegunn/fzf/releases/download/v0.70.0/fzf-0.70.0-linux_amd64.tar.gz`
+ `tar -xzf fzf-0.70.0-linux_amd64.tar.gz`
+ `sudo mv fzf /usr/local/bin`
in bashrc: `eval "$(fzf --bash)"`

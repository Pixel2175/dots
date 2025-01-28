# First, get all Neovim server addresses
for server in $(nvr --serverlist); do
  xdotool Escape
  NVIM_LISTEN_ADDRESS=$server nvr --remote-send ':colorscheme pywal<CR>'
done

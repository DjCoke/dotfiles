nisshfs() {
  local server=""
  local remote_dir="/"
  local mount_base="$HOME/.sshfs"

  while getopts "hs:d:" opt; do
    case $opt in
      h)
        echo "Usage: nisshfs -s <server> [-d remote_dir]"
        return 0
        ;;
      s) server="$OPTARG" ;;
      d) remote_dir="$OPTARG" ;;
      *) return 1 ;;
    esac
  done

  [[ -z "$server" ]] && { echo "Missing -s <server>"; return 1 }

  local mount="$mount_base/$server"
  mkdir -p "$mount"

  if ! mount | grep -q "$mount"; then
    sshfs \
      -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 \
      "$server:$remote_dir" "$mount" || return 1
  fi

  nvim "$mount"
}

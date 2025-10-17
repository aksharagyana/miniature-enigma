sudo apt-get update
sudo apt-get download podman uidmap slirp4netns fuse-overlayfs catatonit conmon crun
sudo apt-get download buildah
sudo apt-get install --download-only --reinstall -y \
  podman uidmap slirp4netns fuse-overlayfs catatonit conmon crun

cp /var/cache/apt/archives/*.deb ~/output/

# Fix 4: Configure Podman for rootless
print_status "Fix 4: Configuring Podman for rootless mode..."

# Create Podman configuration directory
mkdir -p ~/.local/share/containers/storage
mkdir -p ~/.config/containers
mkdir -p /run/user/$(id -u)/containers

# Create containers.conf for rootless
cat > ~/.config/containers/containers.conf << 'EOF'
[containers]
netns="private"
utsns="private"
ipcns="private"
cgroupns="private"
cgroups="enabled"
log_driver="k8s-file"
events_logger="file"

[engine]
events_logger="file"
image_default_transport="docker://"
runtime="crun"
stop_timeout=10

[network]
default_rootless_network_cmd="slirp4netns"
EOF

# Create storage.conf for rootless
cat > ~/.config/containers/storage.conf << 'EOF'
[storage]
driver = "overlay"
runroot = "/run/user/1000/containers"
graphroot = "/home/$USER/.local/share/containers/storage"

[storage.options]
additionalimagestores = []
size = ""
override_kernel_check = "true"

[storage.options.overlay]
mount_program = "/usr/bin/fuse-overlayfs"
mountopt = "nodev,fsync=0"
EOF

export CONTAINERS_CONF="$HOME/.config/containers/containers.conf"
export CONTAINERS_STORAGE_CONF="$HOME/.config/containers/storage.conf"
export PODMAN_SYSTEMD_UNIT=""
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export TMPDIR="/tmp"

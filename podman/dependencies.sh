sudo apt-get update
sudo apt-get download podman uidmap slirp4netns fuse-overlayfs catatonit conmon crun
sudo apt-get download buildah
sudo apt-get install --download-only --reinstall -y \
  podman uidmap slirp4netns fuse-overlayfs catatonit conmon crun

cp /var/cache/apt/archives/*.deb ~/output/

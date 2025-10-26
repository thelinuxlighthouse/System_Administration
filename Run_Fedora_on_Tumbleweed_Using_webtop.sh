# 1. Install Podman and dependencies on host (openSUSE Tumbleweed)
sudo zypper install -y podman slirp4netns fuse-overlayfs

# Pull an image (e.g., Fedora KDE)
podman pull lscr.io/linuxserver/webtop:fedora-kde

# Create
mkdir -p $HOME/webtop/config

# Run it (official pattern)
podman run -d \
  --name=webtop \
  -e PUID=$(id -u) \
  -e PGID=$(id -g) \
  -e TZ="Europe/Berlin" \
  -p 3000:3000 \
  -p 3001:3001 \
  -v $HOME/webtop/config:/config \
  -v /dev/dri:/dev/dri \
  --device /dev/snd \
  --shm-size="2gb" \
  --group-add keep-groups \
  --restart unless-stopped \
  lscr.io/linuxserver/webtop:fedora-kde

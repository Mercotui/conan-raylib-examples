FROM docker.io/library/ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt-get install -y \
    vim x11vnc xvfb pipx build-essential cmake pkg-config \
    \
    libgl1-mesa-dev libosmesa6-dev mesa-utils xorg \
    \
    libx11-dev libx11-xcb-dev libfontenc-dev libice-dev libsm-dev libxau-dev libxaw7-dev \
    libxcb-composite0 libxcb-composite0-dev libxcb-cursor-dev libxcb-cursor0 libxcb-dri2-0-dev libxcb-dri3-dev \
    libxcb-ewmh-dev libxcb-ewmh2 libxcb-glx0-dev libxcb-icccm4 libxcb-icccm4-dev libxcb-image0 libxcb-image0-dev \
    libxcb-keysyms1 libxcb-keysyms1-dev libxcb-present-dev libxcb-randr0-dev libxcb-render-util0 \
    libxcb-render-util0-dev libxcb-render0-dev libxcb-res0 libxcb-res0-dev libxcb-shape0-dev libxcb-shm0-dev \
    libxcb-sync-dev libxcb-xfixes0-dev libxcb-xinerama0 libxcb-xinerama0-dev libxcb-xkb-dev libxcomposite-dev \
    libxcursor-dev libxdamage-dev libxfixes-dev libxi-dev libxinerama-dev libxkbfile-dev libxmuu-dev libxrandr-dev \
    libxrender-dev libxres-dev libxres1 libxss-dev libxtst-dev libxv-dev libxxf86vm-dev uuid-dev libxcb-util-dev

RUN pipx install conan

COPY x11-vnc-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

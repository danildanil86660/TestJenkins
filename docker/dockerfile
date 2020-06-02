FROM ubuntu:16.04

RUN apt-get update -qq

RUN env DEBIAN_FRONTEND=noninteractive apt-get -qq install -y  ffmpeg ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal --no-install-recommends curl gconf-service lib32gcc1 lib32stdc++6 libasound2 libc6 libc6-i386 libcairo2 libcap2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libfreetype6 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libgl1-mesa-glx libglib2.0-0 libglu1-mesa libgtk2.0-0 libnspr4 libnss3 libpango1.0-0 libstdc++6 libx11-6 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxtst6 zlib1g debconf npm xdg-utils lsb-release libpq5 xvfb git vim xrdp tightvncserver \
    && rm -rf /var/lib/apt/lists/* && apt-get purge

RUN echo "Downloading Unity3D installer...." \
    && mkdir /app \
    && curl -o /app/unity_editor.deb "http://beta.unity3d.com/download/6a86e542cf5c/unity-editor_amd64-5.6.1xf1Linux.deb" \
    && echo "Unity3D installer downloaded." \
    # To make a "min" version of this image build, omit this dpkg line. It saves a lot of space, but you'll need to dpkg it yourself when you use the image.
    && dpkg -i /app/unity_editor.deb && ln -s /opt/Unity/Editor/Unity /usr/local/bin/unity && rm -rf /app


RUN mkdir -p .vnc .cache/unity3d .local/share/unity3d

ENV USER root

ADD xstartup /root/.vnc/xstartup
COPY runUnity.sh /root

RUN chmod 755 /root/.vnc/xstartup && chmod 755 /root/runUnity.sh && sed -i -e 's/\r//g' /root/.vnc/xstartup && sed -i -e 's/\r//g' /root/runUnity.sh

# VNC
EXPOSE 5901

ENTRYPOINT ["bash"]
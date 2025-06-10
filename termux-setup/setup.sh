pkg update
pkg upgrade
pkg install git nodejs-lts termux-services openssh
passwd
git clone https://github.com/rajbhx/cloudflared-termux
cd cloudflared-termux
chmod +x Cloudflared-termux_@rajbhx.sh
bash Cloudflared-termux_@rajbhx.sh


# create cloudflared service
mkdir -p $PREFIX/var/service/cloudflared-service/log
ln -sf $PREFIX/share/termux-services/svlogger $PREFIX/var/service/cloudflared-service/log/run
cat << 'EOF' > $PREFIX/var/service/cloudflared-service/run
#!/data/data/com.termux/files/usr/bin/sh
exec cloudflared tunnel run --token eyJhIjoiYzBkZTYzYTQ3ZWJlZDVmODU1MmIwMDViZmQ4ZDNiYTUiLCJ0IjoiNjBmZmMxNzgtMDhhZi00ZTQ0LWIxMzktYTdiNzJjNzFlYjlhIiwicyI6Ik9EUTRNekU1T0RBdFkyRmlOaTAwWTJSbExXSTVOVEl0TnpFeFpqY3pNREkyTTJReSJ9
EOF
chmod +x $PREFIX/var/service/cloudflared-service/run
sv-enable cloudflared-service
sv up cloudflared-service


# create discord-bot service
git clone https://github.com/NgoMinhToan/discord-bot.git
mkdir -p $PREFIX/var/service/discord-bot/log
ln -sf $PREFIX/share/termux-services/svlogger $PREFIX/var/service/discord-bot/log/run
cat << 'EOF' > $PREFIX/var/service/discord-bot/run
#!/data/data/com.termux/files/usr/bin/sh
cd ~/discord-bot
git pull
npm start
EOF
chmod +x $PREFIX/var/service/discord-bot/run
sv-enable discord-bot
sv up discord-bot


# Enable sshd
sv-enable sshd
sv up sshd



# starting with boot
mkdir -p ~/.termux/boot/
cat << 'EOF' > ~/.termux/boot/start-cloudflared
#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
sv up cloudflared-service
EOF
chmod +x ~/.termux/boot/start-cloudflared


cat << 'EOF' > ~/.termux/boot/start-sshd
#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
sshd
EOF
chmod +x ~/.termux/boot/start-sshd


cat << 'EOF' > ~/.termux/boot/start-discord-bot
#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
sv up discord-bot
EOF
chmod +x ~/.termux/boot/start-discord-bot


#!/bin/sh

# Khởi động tailscaled
tailscaled &

# Đợi tailscaled khởi động
sleep 5

# Đăng nhập vào Tailscale
tailscale up --accept-dns=true

# Thiết lập DNS và routes
tailscale set --advertise-routes=192.168.0.0/24 --dns=192.168.0.2

# Giữ container chạy
tail -f /dev/null

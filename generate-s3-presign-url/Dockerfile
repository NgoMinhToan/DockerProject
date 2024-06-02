# Sử dụng image node chính thức
FROM node:14

# Tạo thư mục làm việc và sao chép file
WORKDIR /app
COPY package.json /app
COPY index.js /app

# Cài đặt dependencies
RUN npm install

# Expose port và khởi chạy ứng dụng
EXPOSE 3000
CMD ["npm", "start"]

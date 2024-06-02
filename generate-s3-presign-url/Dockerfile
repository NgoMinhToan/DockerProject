# Sử dụng image node chính thức
FROM node:14

# Tạo thư mục làm việc và sao chép file
WORKDIR /app
COPY package.json /app
COPY index.js /app

# Cài đặt dependencies
RUN npm install

# Thiết lập biến môi trường
ENV S3_ACCESS_KEY=your-default-access-key
ENV S3_SECRET_KEY=your-default-secret-key

# Expose port và khởi chạy ứng dụng
EXPOSE 3000
CMD ["npm", "start"]

# Sử dụng base image Python
FROM python:3.9-slim

# Cài đặt các gói cần thiết
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean

# Clone repository
RUN git clone https://github.com/danielgross/localpilot.git

# Thiết lập thư mục làm việc
WORKDIR /localpilot

# Cài đặt virtualenv
RUN pip install virtualenv

# Tạo và kích hoạt virtual environment, sau đó cài đặt các dependencies
RUN virtualenv venv
RUN /bin/bash -c "source venv/bin/activate && pip install -r requirements.txt"

# Thiết lập các biến môi trường cần thiết cho setup
ENV PYTHONPATH=/localpilot
ENV PATH="/localpilot/venv/bin:$PATH"

# Chạy lệnh setup để tải các models cần thiết
RUN /bin/bash -c "source venv/bin/activate && python app.py --setup"

# Expose port 5001
EXPOSE 5001

# Chạy ứng dụng
CMD ["/bin/bash", "-c", "source venv/bin/activate && python app.py"]

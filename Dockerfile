FROM python:3.13-slim
WORKDIR /usr/local/app

COPY requirement.txt ./
RUN pip install --no-cache-dir -r requirement.txt

COPY app.py ./
EXPOSE 5000

RUN useradd ubuntu
USER ubuntu

CMD ["python3", "app.py"]




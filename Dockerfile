FROM python3.13
WORKDIR /usr/local/app

COPY requirement.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py ./
EXPOSE 5000

RUN useradd ubuntu
USER ubuntu

CMD ["python3", "app.py"]




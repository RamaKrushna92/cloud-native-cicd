FROM python3.13
WORKDIR /usr/local/app

COPY hello.py ./

RUN useradd krushna
USER krushna

CMD ["python3", "hello.py"]




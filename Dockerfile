FROM python:3.10.13-slim

RUN mkdir -p /app
COPY . requirements.txt main.py  /app/
RUN pip install -r /app/requirements.txt
RUN python -m textblob.download_corpora
EXPOSE 8080
CMD [ "main.py" ]
ENTRYPOINT [ "python" ]

# FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime
FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime
# 1.6.0-cuda10.1-cudnn7-runtime
# docker pull pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime

LABEL maintainer="Teng Fu <teng.fu@teleware.com>"

LABEL maintainer="Sebastian Ramirez <tiangolo@gmail.com>"

RUN pip install --no-cache-dir "uvicorn[standard]" gunicorn

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY ./gunicorn_conf.py /gunicorn_conf.py

COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

COPY ./app /app
WORKDIR /app/

ENV PYTHONPATH=/app

EXPOSE 80


RUN pip install --no-cache-dir fastapi

RUN pip install --no-cache-dir transformers

# Run the start script, it will check for an /app/prestart.sh script (e.g. for migrations)
# And then will start Gunicorn with Uvicorn
CMD ["/start.sh"]



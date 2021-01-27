# Huggineface BERT-QA API base Image #

Author: __Teng Fu__


## AIM ##

It is for Bert-QA development purpose, it consists following feature:

- fastAPI, gunicorn and uvicorn for API development

- PyTorch 1.6.0

- Cuda 10.1 and cuDNN 7

- Huggingface Transformer library

This allows huggingface BERT models able to:

- execute with GPU-enabled

- provide REST API service through fastAPI

## Base Images ##

This image is based on:

- [tiangolo/uvicorn-gunicorn:python3.8](https://github.com/tiangolo/uvicorn-gunicorn-docker/blob/master/docker-images/python3.8.dockerfile)

- [uvicorn-gunicorn-fastapi-docker](https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker/blob/master/docker-images/python3.8.dockerfile)

- [pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime](https://hub.docker.com/layers/pytorch/pytorch/1.6.0-cuda10.1-cudnn7-runtime/images/sha256-9c3aa4653f6fb6590acf7f49115735be3c3272f4fa79e5da7c96a2c901631352?context=explore)

pytorch-cuda image is the __main base image__. In this main base image, the Python version is __3.8.5__.


## Usage ##

Make sure the nvidia driver is >=R418

```
sudo docker run -it --runtime=nvidia huggingface-torch-gpu-fastapi:0.1 sh
```
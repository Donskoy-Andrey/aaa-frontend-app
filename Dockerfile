FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1

# RUN python -m pip install --upgrade pip
RUN mkdir /app

COPY ./requirements.txt ./requirements-dev.txt /app/

WORKDIR /app

RUN python -m pip install -r requirements.txt -r requirements-dev.txt

# pre download model
RUN python -c "import easyocr; easyocr.Reader(['en'])"

COPY . /app

EXPOSE 8080
CMD ["python", "run.py"]

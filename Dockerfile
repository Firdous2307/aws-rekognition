FROM python:3.8-slim-buster

RUN pip3 install Flask boto3 pillow

WORKDIR /app

COPY template /app/template

COPY requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=80"]

#testing if my ecr docker build and push will work on this branch
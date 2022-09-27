#Grab the latest alpine image
FROM python:3.10.5-slim-bullseye

# Install python and pip

COPY ./requirements.txt .

# Install dependencies
RUN pip3 install --no-cache-dir -q -r requirements.txt

# Add our code
COPY ./app /app
WORKDIR /app

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
CMD gunicorn --bind 0.0.0.0:$PORT wsgi 


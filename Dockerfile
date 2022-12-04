FROM ubuntu:22.04


RUN apt-get update && apt-get install -y python3 python3-pip python3-venv
RUN python3 -m venv chat_env

WORKDIR /code

# install dependencies
COPY requirements.txt /code/
RUN /book_env/bin/pip install -r requirements.txt

# Copy project
COPY . /code/

# Expose ports
EXPOSE 6378 
EXPOSE 6379
EXPOSE 8000 

RUN chmod +x /code/start.sh
ENTRYPOINT ["./start.sh"]
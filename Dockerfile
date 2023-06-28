FROM python:3.11-slim
ENV TZ=Europe/Moscow
RUN apt-get update > /dev/null
RUN useradd --user-group --create-home --shell /bin/false app
ENV HOME /home/app
ENV PATH="/home/app/.local/bin:${PATH}"
ENV CODE /home/app/code
WORKDIR $CODE
COPY ./requirements.txt $CODE/requirements.txt
USER app
RUN pip install --no-cache-dir --upgrade -r $CODE/requirements.txt
COPY ./ $CODE
CMD ["/bin/bash", "/home/app/code/run_docker.sh"]

FROM ubuntu
RUN apt-get update
RUN apt-get install --yes curl sudo

RUN adduser --disabled-password --gecos=',,,,' user
RUN adduser user sudo
RUN echo 'user ALL=(root) NOPASSWD:ALL' > /etc/sudoers.d/user
RUN chmod 0440 /etc/sudoers.d/user

ADD bootstrap /home/user/bootstrap

RUN su - user -c 'bash bootstrap'

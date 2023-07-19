FROM robang74/sailfishos-platform-sdk:4.5.0.16

ADD build.sh /home/mersdk/

ENV HOME=/home/mersdk

RUN set -ex ;\
  mkdir -p /home/mersdk/build ;\
  sudo chmod +x /home/mersdk/build.sh

ENTRYPOINT ["/home/mersdk/build.sh"]

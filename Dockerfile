FROM alpine:latest
#ARG WAKATIME_API_KEY=$WAKATIME_API_KEY
#ARG MY_SECRET=$MY_SECRET
#ENV ENV="/root/.ashrc"
#RUN echo "export $PATH=$PATH:.local/bin" > "/root/.ashrc"
## add ~/.local/bin to PATH
ENV PATH=/root/.local/bin:$PATH

## install dependencies
RUN apk add --update \
  bash \
  jq
## symlink bash
RUN ln -sf /bin/bash /usr/bin/bash
## create dir
RUN mkdir -p /root/.local/bin
## symlink script
#RUN ln -sf /root/readme-scraper /root/.local/bin/readme-scraper
## maybe needs arguments to be passed in via github action and then here
#CMD [ "readme-scraper /root/templates/preTemplateReadme.md.tpl /root/templates/README.md.tpl ]

## fetch script
RUN wget https://raw.githubusercontent.com/SimonWoodtli/readme-scraper/main/readme-scraper -P /root/.local/bin/
## give exec permissions
RUN chmod u+x /root/.local/bin/readme-scraper
## move script .local/bin
#RUN mkdir -p /root/.local/bin
#RUN mv readme-scraper /root/.local/bin/readme-scraper


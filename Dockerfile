FROM mcr.microsoft.com/dotnet/sdk:7.0
ARG USERNAME = ubuntu
LABEL author=slim
LABEL date = 3/02/2024
LABEL project=nopcomerese
EXPOSE 5000
ADD  https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.5/nopCommerce_4.60.5_NoSource_linux_x64.zip \
     /nop/nopCommerce_4.60.5_NoSource_linux_x64.zip /nop/
RUN sudo apt update all && \
    sudo apt-get install -y apt-transport-https aspnetcore-runtime-7.0 \
    cd /nop && sudo tar -xvzf nopCommerce_4.60.5_NoSource_linux_x64.zip  && mkdir logs
CMD [ "dotnet" , "Nop.web.dll", "--urls", "http://0.0.0.0:5000"]

FROM mcr.microsoft.com/quantum/iqsharp-base:0.14.2011120240

ENV IQSHARP_HOSTING_ENV=QOSF_DOCKER
USER root
RUN pip install RISE

# Make sure the contents of our repo are in ${HOME}.
# These steps are required for use on mybinder.org.
COPY . ${HOME}
RUN chown -R ${USER} ${HOME}

# Drop back down to user permissions for things that don't need it.
USER ${USER}

#RUN mkdir ${HOME}/local-nuget && \
#    dotnet nuget add source ${HOME}/local-nuget -n "Qram" && \
#    dotnet pack ${HOME}/src/qram.csproj && \
#    cp ${HOME}/src/bin/Debug/*.nupkg ${HOME}/local-nuget && \
RUN  pip install numpy matplotlib
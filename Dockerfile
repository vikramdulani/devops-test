FROM ubuntu:latest
RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install -y gpg \
    && rm -rf /var/lib/apt/lists/*
  
RUN cd /tmp && \
    # Download the  archive and signature files
    wget -q https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/v3.1.3/energi3-v3.1.3-linux-amd64.tgz && \
    wget -q https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/v3.1.3/SHA256SUMS && \
    wget -q https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/v3.1.3/SHA256SUMS.asc && \
    wget -q https://s3-us-west-2.amazonaws.com/download.energi.software/DB1DA83F.asc && \

    echo "Verifying authenticity of the downloaded files" && \

    # Get the public key 
    gpg --import DB1DA83F.asc && \
    
    # Verify the signature file is uncorrupted
    gpg --quiet --verify "SHA256SUMS.asc" "SHA256SUMS" 2>&1 && \

    # verify the SHASUM matches the archive
    sha256sum --check --status --ignore-missing "SHA256SUMS" && \

    echo "Installing Energy Core" && \

    tar xvfz energi3-v3.1.3-linux-amd64.tgz && \

    echo "Installing energi3 into /usr/bin" && \
    
    mv "energi3-v3.1.3-linux-amd64/bin/energi3" "/usr/bin/energi3" && \

    chmod +x "/usr/bin/energi3" && \
    
    echo "Cleaning up" && \

    rm -rf "energi3-v3.1.3-linux-amd64.tgz"

EXPOSE 39796 39795 39797 39797/udp
    
ENTRYPOINT ["energi3"]



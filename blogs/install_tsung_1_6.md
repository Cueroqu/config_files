**step 1** install tsung 1.6

    wget http://tsung.erlang-projects.org/dist/tsung-1.6.0.tar.gz
    tar -xvzf tsung-1.6.0.tar.gz
    cd tsung-1.6.0
    sudo apt-get install build-essential debhelper \
        erlang-nox erlang-dev \
        python-matplotlib gnuplot \
        libtemplate-perl
    ./configure
    make
    sudo apt-get update && sudo apt-get -y upgrade
    sudo apt-get install python-pip
    sudo pip install sphinx
    make deb
    cd ..
    sudo dpkg -i tsung_1.6.0-1_all.deb


**step 2** generate rsa file and transfer it to other clients, so that this client can be used as the main client.

    ssh-keygen -t rsa
    [make .ssh dir in other clients]
    scp ~/.ssh/id_rsa.pub user@[other hosts]:/home/user/.ssh/uploaded_key.pub
    ssh user@[other hosts] "echo `cat ~/.ssh/uploaded_key.pub` >> ~/.ssh/authorized_keys"

**appendix** export reports

    ssh-keygen -t rsa
    [make .ssh dir in other clients]
    scp ~/.ssh/id_rsa.pub user@[other hosts]:/home/user/.ssh/uploaded_key.pub
    ssh user@[other hosts] "echo `cat ~/.ssh/uploaded_key.pub` >> ~/.ssh/authorized_keys"
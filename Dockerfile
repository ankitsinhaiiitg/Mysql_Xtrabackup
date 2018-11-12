FROM mysql:5.7

RUN set -x \
	&& apt-get update \
	&& apt-get install -y wget \
	&& apt-get install -y lsb-core \
	&& wget https://repo.percona.com/apt/percona-release_0.1-6.$(lsb_release -sc)_all.deb \
	&& dpkg -i percona-release_0.1-6.$(lsb_release -sc)_all.deb \
	&& apt-get update \
	&& apt-get install -y percona-xtrabackup-24 \
	&& apt-get install -y percona-toolkit \
	&& apt-get install -y nmap \
	&& mkdir -p /tmp/innobackupex \
	&& wget -O /tmp/innobackupex/run-innobackupex.sh https://gist.githubusercontent.com/jmfederico/1495347/raw/375b79ff3be3c0deff783f4209882cb8b38ac808/run-innobackupex.sh \
	&& wget -O /tmp/innobackupex/innobackupex-restore.sh https://gist.githubusercontent.com/bleleve/5605430/raw/7c580e00032bbf64059152c74b396bea229da06a/innobackupex-restore.sh \
	&& wget -O /tmp/innobackupex/innobackupex-runner.sh https://gist.githubusercontent.com/bleleve/5605430/raw/804dba698247272a9096486cab3a7b05e2a3a35c/innobackupex-runner.sh \
	&& mkdir -p /usr/local/ \
	&& mv /tmp/innobackupex /usr/local/innobackupex \
	&& chmod 755 /usr/local/innobackupex/*.sh

ADD xtrabackup_nc.sh /usr/bin/xtrabackup_nc.sh
COPY entrypoint.sh /entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/entrypoint.sh"]

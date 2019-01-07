PWD	= $(shell pwd)

all:
	cp -r master.d/* /etc/salt/master.d/
	cd /srv; ln -s $(PWD)/salt salt; ln -s $(PWD)/pillar pillar; cd -
	systemctl restart salt-master

directory:
	mkdir -p /srv/formulas
	mkdir -p /etc/salt/master.d

clone:
	git clone https://github.com/florian-vuillemot/postgres-formula
	git clone https://github.com/florian-vuillemot/nginx-formula
	chmod 644 -R postgres-formula
	chmod 644 -R nginx-formula
	mv postgres-formula /srv/formulas/
	mv nginx-formula /srv/formulas/


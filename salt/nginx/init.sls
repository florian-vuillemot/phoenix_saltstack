nginx:
    pkg.installed:
        - refresh: True
    service.running:
	- enabled: True
	- reload: True
	- watch:
	    - file: /etc/nginx/conf.d/*

/etc/nginx/conf.d/default.conf:
    file.managed:
        - absent

/etc/nginx/conf.d/app.conf
    file.managed:
        - source: salt://nginx/configs/app.conf


nginx:
    pkg.installed:
        - refresh: True
    service.running:
        - enable: True
        - reload: True

certbot:
    pkgrepo.managed:
        - ppa: certbot/certbot

python-certbot-nginx:
    pkg.installed:
        - refresh: True

/etc/nginx/conf.d/horse.conf:
    file.managed:
        - source: salt://nginx/configs/horse.conf

'sudo systemctl restart nginx':
    cmd.run

#'sudo certbot --nginx -d testdep.eastus.cloudapp.azure.com -d www.testdep.eastus.cloudapp.azure.com':
#    cmd.run

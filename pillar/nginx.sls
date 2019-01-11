nginx:
  server:
    site:
      nginx_proxy_site01:
        enabled: True
        type: nginx_proxy
        name: site01
        proxy:
          host: 137.117.44.141
          ports: 80
          protocol: http
        host:
          name: localhost
          port: 5000

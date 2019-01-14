nodejs:
    pkg.installed

npm:
    pkg.installed

'mix local.hex --force':
    cmd.run

/home/horse/app_config/prod.secret.exs:
    file.managed:
        - makedirs: True
        - source: salt://config/app_config/prod.secret.exs

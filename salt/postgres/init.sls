postgresql:
    pkg.installed
        - refresh: True
    service.running:
        - enable: True

sudo -u postgres bash -c "psql -c \"ALTER USER postgres WITH PASSWORD 'postgres';\"":
    cmd.run

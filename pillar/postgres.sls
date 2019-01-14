postgres.port: 5432

postgres:
    use_upstream_repo: False
    version: '10'
    add_profile: False

    users:
        postgres:
            ensure: present
            password: 'postgres'
	    createuser: True

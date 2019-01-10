#https://github.com/gothinkster/elixir-phoenix-realworld-example-app.git:
#    git.latest:
#        - target: /florian/app

Add HOME env for Mix:
    environ.setenv:
        - name: HOME
        - value: /florian

'export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8':
    cmd.run

'mix local.hex --force':
    cmd.run
            
'cd /florian/app/ && mix deps.get --force --only dev && MIX_ENV=dev mix compile':
    cmd.run

#'cd /florian/app/ && cd assets && webpack --mode production':
#    cmd.run

#'cd /florian/app && mix phx.digest':
#    cmd.run

'cd /florian/app/ && MIX_ENV=dev PORT=4001 elixir --detached -S mix do compile, phx.server':
    cmd.run

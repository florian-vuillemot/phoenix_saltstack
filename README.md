# Saltstack + Phoenix = <3
Deploy an manage a Phoenix (Elixir) app with SaltStack

Warning:
I'm not a SaltStack expert. I take all advise and pull request. Thanks you.

## 1. Salt Minion
Install a Salt Minion on you server and configure it with you Salt Master

## 2. Install PostgresSQL
### Fork the postgres-formulas
Fork the official PostgresSQL formulas repository from SaltStack GitHub (https://github.com/saltstack-formulas/postgres-formula) or from mine (https://github.com/florian-vuillemot/postgres-formula).

You should clone this repository. Salt Master will search it in `/srv/formulas` directory for install PostgresSQL.

-> In other word, you should have `/srv/formulas/postgres-formula` directory available on you computer.

### Personalized
You can (should if you are in prod) update the file `pillar/postgres.conf`.
You can change `postgres` in another user, and change the password for be stronger.

You can change any configuration of postgres-formulas in this file :) -> See pillar.example file in postgres-formula repository

### Configure
There are Salt code and configs in `/srv/` and Salt-Master settings in `/etc/salt/` directory.

1. You can directly create a symlink from `/srv` to the repo sources. You should have `/srv/salt/` and `/srv/pillar/` directories available.
2. Similary you can also create a symlink from `/etc/salt/` to the repo sources. But in this case you need to have the directories `/etc/salt/master.d/` directory available.

Explanations:
- master.d contain setting for Salt Master execution.
- pillar and salt contain configuration for Salt Minion and State that Salt Master will execute on the Salt Minion (see SaltStack doc).

### Install
First the minion should be accessible and step 1 and 2 of Configure should be done.
- Cmd: `salt 'my_minion' test.ping`
- Output: `my_minion: True`

Now update Salt Minion configuration.
- Cmd: `salt 'my_minion' saltutil.refresh_pillar`
- Output: `my_minion: True`

Optional: You can check if the Minion config is correct:
- Cmd: `salt 'my_minion' pillar.items`
- Output: Should be equal to `pillar/postgres.sls` file

Configuration is ok, let's go to install !
- Cmd: `salt 'my_minion' state.highstate`
- Output: A lot of Succeeded and 0 Failure ;)


### Improvement:
- Work on the password way -> Encryption or environement...

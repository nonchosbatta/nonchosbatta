# Setup
The following setup is meant to be run on OSX for only development purpose, but you can do the same on every GNU/Linux distribution too with just very little changes.

## Requirements
- UNIX-like environment
- PostgreSQL
- RVM
- NodeJS

## Install Rubinius (optional)
- `$ rvm get stable`
- `$ rvm install rbx-2.5.7`

## Install memcached
- `$ brew install memcached`

## Setup the database (only for local environments, this is totally *not* safe!)
- `$ createuser nonchosbatta`
- `$ psql postgres`
```
postgres=# ALTER ROLE "nonchosbatta" SUPERUSER;
postgres=# \du
```

## Run
- `$ bundle install`
- `$ rake db:create`
- `$ rake db:migrate`
- `$ rake db:setup`
- `$ bundle exec rspec`
- `$ npm install`
- `$ bundle exec rails s`

## Troubleshooting
* In OSX you'll probably need to execute the following two commands instead of the plain `$ rvm install rbx-2.5.7`:

`$ brew install llvm`
`$ rvm install rbx-2.5.7 -- --llvm-config /usr/local/opt/llvm/bin/llvm-config`


* If you use *Postgres.app*, you'll have to run `$ gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.3/bin/pg_config .` if you encounter problems related to `pg_config` while running `$ bundle install`.

In the same way, execute `'/Applications/Postgres.app/Contents/Versions/9.3/bin/createuser' nonchosbatta` if `createuser` returns `command not found`.


* If browserify can't compile your assets, execute `$ ulimit -n 2560`. Consider to add this line to your `.bashrc` or `.zshrc`.

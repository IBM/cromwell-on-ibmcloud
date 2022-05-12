Docker configuration
===========================

As of writing this documentation, LSF images (hpcc-lsf10-cent77-jun0421-v5) have pre-installed Docker, but do not fully configure it for the user `lsfadmin`.
Please run

```
$ ./configure-lsf-docker.sh
```

Re-login to the master after the script completes.
Please check if docker commands work with the user `lsfadmin`.

```
$ docker run hello-world
```


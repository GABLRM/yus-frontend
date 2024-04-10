# yus_dev

A new Flutter project.

## Getting Started

How to set-up the database: 

```sh
$ sudo docker-compose up --force-recreate -V -d
```

```sh
$ sudo docker ps
{docker id}
```


```sh
$ sudo docker exec -it {docker id} psql -U userdb -d yusflutter
```
# Zenko Spark Test Module

This is a development/test stack !

Please setup the stack first as described here: https://github.com/scality/Zenko/tree/master/swarm-production 

```
$ docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
886jggbgj6exqndvcdbqqgtp7 *   spark01             Ready               Active              Leader
kwbzke102st3apsvwri01zs38     spark02             Ready               Active              
ite0zzto0630g0yel5fw0tiqi     spark03             Ready               Active              
6ayn6y40b0v7g3gdopw0nlzkj     spark04             Ready               Active              
51yz4pi0oxfq88wkxfl7osbf2     spark05             Ready               Active              
$ docker node update --label-add io.zenko.type=storage kwbzke102st3apsvwri01zs38
kwbzke102st3apsvwri01zs38
$ docker node inspect kwbzke102st3apsvwri01zs38 -f '{{ .Spec.Labels }}'
$ docker stack deploy -c docker-stack.yml zenko-prod
$ docker stack rm zenko-prod
```


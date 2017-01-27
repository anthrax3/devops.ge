```
version: 0.1
log:
  fields:
    service: registry
storage:
  cache:
    blobdescriptor: inmemory
  filesystem:
    rootdirectory: /var/lib/registry
http:
  addr: :5000
  headers:
    X-Content-Type-Options: [nosniff]
  tls:
    letsencrypt:
      cachefile: /var/letsencrypt
      email: tornike.zedginidze@ol.ge

health:
  storagedriver:
    enabled: true
    interval: 10s
threshold: 3
```

```
:~# docker run -d -p 443:5000 --restart=always --name registry -v `pwd`/config.yml:/etc/docker/registry/config.yml registry:2
```

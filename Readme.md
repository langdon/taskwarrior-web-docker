[![Twitter](https://img.shields.io/badge/Twitter-%40jeckel4-blue.svg)](https://twitter.com/jeckel4) [![LinkedIn](https://img.shields.io/badge/LinkedIn-Julien%20Mercier-blue.svg)](https://www.linkedin.com/in/jeckel/)
# taskwarrior-web in docker container 

*Forked from [groverz/taskwarrior-web](https://github.com/groverz/taskwarrior-web).*

This container allow you to run the Taskwarrior-Web UI synchornized with a taskwarrior server.


## With sync server 

You should mount certificates in a volume

```bash
docker run -d \
  --name=taskwarrior-web \
  -p 5678:5678 \
  -v ~/task-web:/root/.task \
  -e TASKD_SERVER='trident.hav0k.ru:53589' \
  -e TASKD_CREDENTIALS='AlphaV/Alexey Vildyaev/3e382537-d7d9-4677-8311-3cfd1047623f' \
  f2a1c74860ae
```

## Certificates and Credentials

**Taskwarrior-web** needs Credentials and Certificate to connect to the server.

### Client certificates

Certificate should be stored in a volume with the defined filenames:
- `client.cert.pem`
- `client.key.pem`
- `ca.cert.pem`

The certificate folder can be defined with the env variable `CLIENT_CERT_PATH` (default value: /root/.task/client)

### Credentials

Credentials can be handle in 2 different ways:
- with env variable `TASKD_CREDENTIALS`
- in a `credential` files, stored in the some folder as the certificates

## Env variables

- `TASKD_SERVER`: domain and port to the Taskwarrior Server
- `TASKD_CREDENTIALS`: Credentials used to connect the Taskwarrior server (read Taskwarrior server documentation)
- `CLIENT_CERT_PATH`: Path to the mounted volume where Certificate will be found

## Security 

There is no security handled here, you have to handle security by yourself:
- run this container only in a local network
- handle authorization with your own proxy
- run behind a VPN
- etc.

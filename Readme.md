# taskwarrior-web in docker container 

todo

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

## Env variables

- `TASKD_SERVER`
- `TASKD_CREDENTIALS`
- `CLIENT_CERT_PATH`

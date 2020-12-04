# Usage

1. Get [Google Takeout File(s)](https://takeout.google.com/ "Google Takeouts")
2. Place file(s) into /photosIn  (do not extract, just add the .zip/.tgz files)
3. Run docker image
4. Files will be placed in /photosOut

#### Using [Google Photos Takeout Helper](https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper) v1.2.0

### docker-compose

```yaml
version: "2.1"
services:
  googletakeouthelper:
    image: mochman425/google-takeout-helper
    container_name: google-takeout-helper
    environment:
      - RUN_OPTS=<run options here> #optional
    volumes:
      - <path to photos>:/photosIn
      - <path to photo output>:/photosOut
    user: "1000:1000" #Needs to be your UID:GID
```

### docker command
```
docker run -d \
  --name=google-takeout-helper \
  --user $(id -u):$(id -g) \
  -e RUN_OPTS=<run options here> #optional \
  -v <path to photos>:/photosIn \
  -v <path to photo output>:/photosOut \
  mochman425/google-takeout-helper
```

### Paramaters
 
| Parameter | Function |
| :----: | --- |
| `-e RUN_OPTS=<run options here>` | Optionally specify additional arguments to be passed. Eg. `--divide-to-dates` |
| `-v /photosIn` | Where the compressed takeout files exist. |
| `-v /photosOut` | Path to where the photos will be saved to. |
| `user: "1000:1000"` | Use your UID & GID |

### Arguments

| Argument | Function |
| :----: | --- |
| `--divide-to-dates` | Create folders and subfolders based on the date the photos were taken. |
| `--keep-duplicates` | Don't remove duplicates. |
| `--dont-fix` | Don't try to fix Dates. I don't know why would you not want to do that, but ok. |
| `--dont-copy` | Don't copy files to target folder. I don't know why would you not want to do that, but ok. |

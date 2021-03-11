# Using [Google Photos Takeout Helper](https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper) v2.2.1

## Usage

1. Get [Google Takeout File(s)](https://takeout.google.com/ "Google Takeouts").  Only select Google Photos.
2. Place file(s) into /photosIn  (do not extract, just add the .zip/.tgz files)
3. Run docker image
4. Files will be placed in /photosOut

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
| `--skip-extras` | EXPERIMENTAL: Skips the extra photos like photos that end in "edited" or "EFFECTS". |
| `--skip-extras-harder` | EXPERIMENTAL: Skips the extra photos like photos like pic(1). Also includes --skip-extras. |
| `--albums ALBUMS` | EXPERIMENTAL, MAY NOT WORK FOR EVERYONE: What kind of 'albums solution' you would like: 'json' - written in a json file |

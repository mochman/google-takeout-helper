#!/bin/sh

INPUTPATH="/photosIn"
eval cd "${INPUTPATH}"
echo "Searching for compressed files in $INPUTPATH"
countZIP=`ls -1 *.zip 2>/dev/null | wc -l`
countTGZ=`ls -1 *.tgz 2>/dev/null | wc -l`

if [ $countZIP -ge 1 ]; then
  mkdir unpacked
  echo "Found .zip file(s), unpacking..."
  for f in *.zip; do unzip "$f" -d ./unpacked; done
  INPUTPATH=${INPUTPATH}/unpacked
elif [ $countTGZ -ge 1 ]; then
  mkdir unpacked
  echo "Found .tgz file(s), unpacking..."
  for f in *.tgz; do tar -xzvf "$f" -C ./unpacked; done
  INPUTPATH=${INPUTPATH}/unpacked
else
  echo "No compressed files found, quitting"
  exit 0
fi

echo "Running script..."
/usr/local/bin/google-photos-takeout-helper -i $INPUTPATH -o /photosOut $RUN_OPTS

exec "$@"

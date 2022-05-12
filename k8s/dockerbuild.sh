#!/bin/bash
if [ $# -ne 1 ]; then
  echo "specify cromwell src directory."
  exit 1
fi
if [ ! -e $1 ]; then
  echo "directory $1 does not exist"
  exit 1
fi
cd $1
REPO=icr.io/cromwell-on-ibmcloud
VER=`grep 'val cromwellVersion' project/Version.scala | sed -e 's/.*val cromwellVersion = \"\(.*\)"/\1/g'`
HASH=`git log -n 1 --oneline --pretty=%h | cut -b-7`
docker build --pull --build-arg JAR=cromwell-$VER-$HASH-SNAP.jar -f Dockerfile -t $REPO/cromwell:${VER}-k8s server/target/scala-2.12/
docker push $REPO/cromwell:${VER}-k8s

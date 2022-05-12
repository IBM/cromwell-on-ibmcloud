#!/bin/bash
cur=$(realpath `dirname $0`)
kubectl port-forward -n cromwell deployment/cromwell 8000:8000 > /dev/null 2> /dev/null < /dev/null &
PID=$!
sleep 3s
curl -X 'POST' \
  'http://localhost:8000/api/workflows/v1' \
  -H "accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -F "workflowSource=@${cur}/HaplotypeCaller.wdl" \
  -F "workflowInputs=@${cur}/HaplotypeCaller.json;type=application/json"
kill $PID

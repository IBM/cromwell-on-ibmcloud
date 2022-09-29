#!/bin/bash
cur=$(realpath `dirname $0`)
java -Dconfig.file=${cur}/cromwell.conf -jar ${cur}/cromwell.jar run ${cur}/HaplotypeCaller.wdl -i ${cur}/HaplotypeCaller.json

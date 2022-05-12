After starting a LSF cluster, please login to its master and run
```
$ git clone https://github.com/IBM/cromwell-on-ibmcloud.git
$ cd cromwell-on-ibmcloud/lsf/test
$ ./downloader.sh
```

The last script downloads aws-cli, java-11, cromwell.jar (version 78), and input files for HaplotypeCaller.

Then, you can test HaplotypeCaller
```
$ ./run.sh
```

You can check jobs with usual LSF commands.

```
$ bjobs -w
```

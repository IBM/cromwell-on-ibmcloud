Please prepare HaplotypeCaller inputs in your cluster by running:
```
$ kubectl apply -f input-downloader.yaml
```

Check if the pod is completed and delete it.

```
$ kubectl get po -n cromwell
$ kubectl delete -f input-downloader.yaml
```

After that, please run

```
$ ./run.sh
```

This script automatically runs port-forwarding and sends a request to start HaplotypeCaller.

You can check logs for the job with usual kubectl commands like

```
$ kubectl logs -n cromwell $(kubectl get po -n cromwell -l app=cromwell-server -o name)
$ kubectl get po -n cromwell
$ kubectl logs -n cromwell dc8a87ef-20-haplotypecallergvcf-gatk4-haplotypecaller-0-r849d # this pod name depends on your env
```

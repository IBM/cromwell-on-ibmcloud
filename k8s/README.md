Kubernetes backend for Cromwell
===============================

Kubernetes backend for Cromwell enables flexible storage choices and job scheduling for GATK on Kubernetes clusters.
Each workflow task defined in WDL files runs as a Kuberentes job.
We originally developed this backend for managed Red Hat OpenShift on IBM Cloud, but hopefully this will be reusable for other Kubernetes environments.

This backend assumes a single RWX (ReadWriteMany) persistent volume claim as a shared filesystem (SFS) for job containers and Cromwell.
It directly reads and writes SFS so that we can skip very heavy pre-/post-copy of files that many other backends must do.
You can utilize various SFS such as FS over cloud object storage (e.g., S3FS) and cluster-local FS (e.g., NFS, CephFS) if their container storage interface (CSI) is configured.

For advanced usages, the backend also enables to configure job scheduling with node selector, tolerations, and scheduler.

Cromwell configuration can be found in `cromwell-conf.yaml`.
It uses the public container image of our customized Cromwell.
You can also find NFS deployment with a 1-TB VPC block volume in IBM Cloud (We reused many parts of https://github.com/kubernetes-csi/csi-driver-nfs/tree/master/deploy).
Please note that you may need to update NFS CSI configurations if you try this backend on other cloud environments.

### Installation

Run `kubectl apply -f` to install deployment for Cromwell and daemonset for NFS CSI.

```
$ kubectl apply -f namespace.yaml
$ kubectl apply -f block-1024gb.yaml
$ kubectl apply -f csi-nfs-openshift-4.8.36.yaml # try csi-nfs-*.yaml with versions close to your env
$ kubectl apply -f nfs-server.yaml
$ kubectl apply -f cromwell-conf.yaml
$ kubectl apply -f openshift-scc.yaml # this is for OpenShift and can be skipped if not needed
$ kubectl apply -f cromwell.yaml
```

Note: We tested limited versions of Kuberntes/OpenShift (OpenShift 4.8.36 and 4.10.3, and Kubernetes 1.21.12 on IBM Cloud) to deploy NFS CSI.
CSI seems to have slightly different interfaces for each Kubernetes version and cause issues when you do not properly configure them.

Cromwell and NFS are deployed in namespaces `cromwell` and `kube-system`.

```
$ kubectl get pod -n cromwell -o wide
$ kubectl get pod -n kube-system -o wide | grep cromwell
```

Please do port-forwarding to your local port 8000 to access Swagger UI.

```
$ kubectl port-forward -n cromwell deployment/cromwell 8000:8000
```

Now you can access http://localhost:8000 in your local machine.
Please submit your pipelines (e.g., .wdl and .json files) via Swagger UI.
Input files must be located under the path specified at "backend.providers.k8s.root" in `cromwell-conf.yaml`.

You can monitor submitted workflows as normal Kubernetes jobs.

```
$ kubectl get job -n cromwell -o wide
```

You can also try HaplotypeCaller under the directory [test](./test/README.md).

### Uninstallation

Run `kubectl delete -f` with the reverse order of the installation.

```
$ kubectl delete -f cromwell.yaml
$ kubectl delete -f openshift-scc.yaml
$ kubectl delete -f cromwell-conf.yaml
$ kubectl delete -f nfs-server.yaml
$ kubectl delete -f csi-nfs-openshift-4.8.36.yaml
$ kubectl delete -f block-1024gb.yaml
$ kubectl delete -f namespace.yaml
```

### Building from source code

Our code is also publicly-available https://github.com/takeshi-yoshimura/cromwell/tree/k8s-backend-78.
After building a JAR file in the directory (`sbt assembly`), you can run it to build the custom Cromwell image.

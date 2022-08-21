# prometheus-operator

This is an addon template. Check how to build your own addon: https://kubevela.net/docs/platform-engineers/addon/intro


kubectl get crd |grep monitoring | awk '{print $1}' | xargs kubectl delete crd

metadata.annotations: Too long: must have at most 262144 bytes

I ran into this and while there are solution specific to the tool you are using (e.g: ArgoCD) I wanted a more generic solution. In the end I just removed all the descriptions from the larger CRDs to get it under the required size. This does limit the output of kubectl explain but to me that is a small price to pay.

Simple conversion using yq: yq eval 'del(.. | .description?)' CRD_FILE

This will change creationTimestamp: null to creationTimeStamp: {} so just manually fix that and everything should work.
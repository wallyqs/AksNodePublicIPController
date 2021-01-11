while true; do go build  -o build ./... && ./build/AksNodePublicIPController -kubeconfig ~/.kube/config; sleep 1; done

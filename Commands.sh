aws configure list 

aws eks update-kubeconfig --name eks-cluster-test #cluster name

kubectl get nodes

kubectl get pods -A

--- #Cluster AutoScaler

kubectl get deployment -n kube-system cluster-autoscaler

kubectl edit deployment -n kube-system cluster-autoscaler # change cluster name and k8s version
 
kubectl get pod -n kube-system

kubectl logs -n kube-system POD_NAME

--- # Nginx APP

kubectl get pod 

kubectl get svc

kubectl edit deployment nginx


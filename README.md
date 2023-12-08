# EKS-Cluster-AutoScaller

## Over View
Using EKS service to take care of my master nodes and using cluster auto scaler to scale up and down the worker nodes based on the load i made on them

## Steps
    1- Using cloud formation stack put vpc template.
    2- Create a Role with "AmazonEKSCluster" policy.
    3- Create an eks cluster and specify 
        - EKS-Role we created earlier .
        - VPC we created earlier.
        - Cluster endpoint access to be public and private. 
        - Select pods we want to add by default.
        Then Create the cluster.
    4- Create node group and specify 
        - The specification of our nodes. 
        - VPC we created earlier.
        - Role with (EC2containerRegistery,EKS_CNI,EKSWorkerNode,IAM-Policy_for_AutoScaler) Policy.
    5- Using cloud shell put the command : aws eks update-kubeconfig --name <cluster_name>  .
    6- Run cluster-AutoScaler.yaml file.
    7- Run command : kubectl edit deployment -n kube-system cluster-autoscaler 
        to  change cluster name and kubernetes verion with yours.
    8- To make sure every thing is file run commands : 
        kubectl get pod -n kube-system.
        kubectl logs -n kube-system POD_NAME.
    9- Run nginx.yaml file tou run your app < open Loudbalancer_DNS in your browser to see your app >.
    10- Change the number of replicas in Nginx Deployment to see Cluster-AutoScaler Working.
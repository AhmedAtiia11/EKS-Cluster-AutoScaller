# EKS Cluster Autoscaler

## Overview
The EKS Cluster Autoscaler is a solution designed to efficiently manage master and worker nodes within the Amazon Elastic Kubernetes Service (EKS). This implementation leverages the EKS service for master node management and utilizes the Cluster Autoscaler to dynamically scale worker nodes based on system load.

## Installation Steps

### 1. Deploy VPC Template Using CloudFormation Stack
Ensure a secure and well-configured Virtual Private Cloud (VPC) environment by deploying the provided CloudFormation stack with the VPC template.

### 2. Create a Role with "AmazonEKSCluster" Policy
Establish the necessary AWS Identity and Access Management (IAM) role with the "AmazonEKSCluster" policy to grant appropriate permissions for EKS cluster management.

### 3. Create EKS Cluster
- Execute the creation of an EKS cluster, specifying:
  - The previously created EKS role.
  - The VPC established through the CloudFormation stack.
  - Public and private cluster endpoint access settings.
  - Default selection of pods to be added to the cluster.

### 4. Create Node Group
Configure the node group with:
  - Node specifications.
  - The VPC created earlier.
  - A role with policies (EC2ContainerRegistry, EKS_CNI, EKSWorkerNode, IAM-Policy_for_AutoScaler).

### 5. Configure Kubeconfig Using Cloud Shell
Execute the following Cloud Shell command to configure kubectl for interacting with the newly created EKS cluster:
```bash
aws eks update-kubeconfig --name <cluster_name>
```

### 6. Deploy Cluster Autoscaler
Run the cluster-AutoScaler.yaml file to deploy the Cluster Autoscaler to your Kubernetes cluster.

### 7. Edit Cluster Autoscaler Configuration
Use the command below to edit the Cluster Autoscaler deployment and customize parameters such as cluster name and Kubernetes version:
```bash
kubectl edit deployment -n kube-system cluster-autoscaler
```

### 8. Verify Deployment
Ensure a successful deployment by checking the status of Kubernetes pods and inspecting logs:
```bash
kubectl get pod -n kube-system
kubectl logs -n kube-system POD_NAME
```

### 9. Deploy Sample Application (Nginx)
Run the nginx.yaml file to deploy the sample Nginx application. Access the application through the LoadBalancer DNS in your web browser.

### 10. Test Autoscaling
Experiment with Cluster Autoscaler functionality by adjusting the number of replicas in the Nginx Deployment and observing the autoscaling behavior.


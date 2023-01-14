SberCloud k8s example
=====================

Example HCL code for deploying trivial environment with managed Kubernetes on SberCloud.

Requirements
------------

-   terraform >= 1.1.8

-   registry.terraform.io/hashicorp/local == 2.2.2

-   registry.terraform.io/sbercloud-terraform/sbercloud == 1.10.0

Running
-------

Assuming you've set all the necessary environment variables, you can bring up a test environment like this:

        $ cd test-environment
        $ terraform init
        $ terraform apply -var-file myvars.tfvars


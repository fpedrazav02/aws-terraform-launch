# Automating Infrastructure using Terraform

## Excercise description:

>Nowadays, infrastructure automation is critical. We tend to put the most emphasis on software development processes, but infrastructure deployment strategy is just as important. Infrastructure automation not only aids disaster recovery, but it also facilitates testing and development.
>Your organization is adopting the DevOps methodology and in order to automate provisioning of infrastructure there's a need to setup a centralised server for Jenkins.

>Terraform is a tool that allows you to provision various infrastructure components. Ansible is a platform for managing configurations and deploying applications. It means you'll use Terraform to build a virtual machine, for example, and then use Ansible to instal the necessary applications on that machine.

>Considering the Organizational requirement you are asked to automate the infrastructure using Terraform first and install other required automation tools in it.

### Tools required: Terraform, AWS account with security credentials, Keypair

 

### Expected Deliverables:
>
> - Launch an EC2 instance using Terraform
> - Connect to the instance
> - Install Jenkins, Java and Python in the instance

***
<br>

## 1. Create `AWS` credential Keys

First we conect to AWS, and search for IAM services.

> `IAM` , or identity access management services is one of the many services provided by AWS in which we can manage perms, create users and generate key-access pairs. 

![IAM SERVICE](../imgs/IAM.png)
<br>

Click on Users

![IAM SERVICE](../imgs/users.png)
<br>
Create the new User with administrator perms

![IAM SERVICE](../imgs/nuser.png)
![IAM SERVICE](../imgs/userdat1.png)
![IAM SERVICE](../imgs/userdat2.png)
![IAM SERVICE](../imgs/userdat3.png)
![IAM SERVICE](../imgs/credentials1.png)

We enter **Secutiry Credentials** and create a new **CLI** set of credentials
<br>
![IAM SERVICE](../imgs/credentials2.png)

> We write down the **secret key** and **access key** provided

![IAM SERVICE](../imgs/credentials3.png)

## 2. Install `Terraform`/ Update `Terraform`
Since we count this scenario as a new set up, we should not have `terraform` installed.

We check terraform instalation status.
![IAM SERVICE](../imgs/terrabash1.png)

We can use a simple bash script as root to install and update our terraform instalation.

```
wget https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_386.zip

unzip terraform_1.5.6_linux_386.zip

mv terraform /usr/local/bin
```

Check installation.

![IAM SERVICE](../imgs/installcheck.png)




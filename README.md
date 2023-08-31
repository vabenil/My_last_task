## My_last_task

To run terraform to create an instance and security group do:
```
$ terraform init
$ terraform apply -var-file=<your variables file>.tfvars
```
Destroy with
```
$ terraform destroy -var-file=<your variables file>.tfvars
```
Then using the public include the public IP address of the instance you created and store it under `hosts`
with the name host name like so:
```
[web]
<host>@<IP address>
```
And finally run with:
```
$ ansible-playbook ansible/last.yml -i=ansible/hosts
```

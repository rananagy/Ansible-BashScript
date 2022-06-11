### This Project To Delete Inactive Users if they didn't login To The machine for more than 3 months 

#### Simple notes

First Add your hosts to inventory file 

#### Check ssh Connection Between ansible-controller and Remote hosts 
 
```bash 
# Generate ssh-keys
ssh-keygen
ssh-copy-id user@ip_of_remote_host
```
### Run Playbook

```bash
ansible-playbook -i inventory Playbook_Script.yml
```

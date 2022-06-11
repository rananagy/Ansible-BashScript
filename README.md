#### Simple notes

First Add your hosts to inventory file 

#### Check ssh Connection Between ansible-controller and Remote hosts 
 
```bash 
# Generate ssh-keys
ssh-keygen
ssh-cpoy-id user@ip_of_remote_host
```
### Run Playbook

```bash
ansible-playbook -i inventory Playbook_Script.yml
```

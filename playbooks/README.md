# Playbooks

## Requirements

Update Ansible roles:

```bash
$ ansible-galaxy install --ignore-errors -f -r playbooks/requirements.yml
```

## Production

Setup:

```bash
$ ansible-playbook -i playbooks/hosts playbooks/setup.yml
```

Installation:

```bash
$ ansible-playbook -i playbooks/hosts playbooks/install.yml
```

Configure Let’s Encrypt:

```bash
$ ansible-playbook -i playbooks/hosts playbooks/letsencrypt.yml
```

Deploy:

```bash
$ ansible-playbook -i playbooks/hosts playbooks/deploy.yml
```

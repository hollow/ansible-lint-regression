.PHONY: ansible-install
ansible-install: ## install Ansible collections and roles
ansible-install: python-install
	poetry run ansible-galaxy collection install -r .ansible/requirements.yaml
	poetry run ansible-galaxy role install -r .ansible/requirements.yaml
install:: ansible-install

.PHONY: ansible-update
ansible-update: ## update Ansible collections and roles
ansible-update: python-update
	poetry run ansible-galaxy collection install -U -r .ansible/requirements.yaml
	poetry run ansible-galaxy role install -f -r .ansible/requirements.yaml
update:: ansible-update

.PHONY: ansible-clean
ansible-clean: ## remove Ansible collections and roles
	rm -rf .ansible/ansible_collections/*
	rm -rf .ansible/roles/*
	rm -rf .ansible/inventory
clean:: ansible-clean

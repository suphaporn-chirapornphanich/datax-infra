SHELL := /bin/bash -e

ROOT_DIR := $(realpath ../../../../../../)
ENV_NAME := dev
APP_NAME := core_resource
PRODUCT := mgt
SUBSCRIPTION := datax-mgmt-prd-01
SUBSIDIARY := datax
ENV_FILE := $(ROOT_DIR)/.env.$(ENV_NAME)
TF_STATE_FILE := $(SUBSCRIPTION)/$(SUBSIDIARY)/$(ENV_NAME)/$(PRODUCT)/$(APP_NAME).tfstate

-include $(ENV_FILE)
export $(shell sed 's/=.*//' $(ENV_FILE))

ifndef MANAGEMENT_CONFIG_DIR
override MANAGEMENT_CONFIG_DIR = $(ROOT_DIR)/terraform/config/$(ENV_NAME)/$(SUBSIDIARY)
endif

ifndef CONFIG_DIR
override CONFIG_DIR = ./config
endif

export TF_IN_AUTOMATION=true

export CONFIG_TF_VAR_FILE=<(cat $(MANAGEMENT_CONFIG_DIR)/management.tfvars)

clean:
	rm -f terraform.tfplan terraform.tfstate $(CONFIG_DIR)/terraform.tfplan && rm -fR .terraform/

.PHONY: init-migrate
init-migrate:
	terraform init -migrate-state \
		-backend-config=$(MANAGEMENT_CONFIG_DIR)/backend.hcl \
		-backend-config="key=$(TF_STATE_FILE)"

.PHONY: init
init:
	terraform init \
		-backend-config=$(MANAGEMENT_CONFIG_DIR)/backend.hcl \
		-backend-config="key=$(TF_STATE_FILE)"

.PHONY: validate
validate: init
	# Get the modules, create the infrastructure.
	terraform get \
	&& terraform validate

.PHONY: plan
plan: init
	terraform plan \
		-var-file=$(CONFIG_TF_VAR_FILE) \
		-var-file="override.tfvars"

.PHONY: apply
apply: init
	terraform get \
	&& terraform apply \
		-var-file=$(CONFIG_TF_VAR_FILE) \
		-var-file="override.tfvars"

destroy: init
	terraform get \
	&& terraform destroy \
		-var-file=$(CONFIG_TF_VAR_FILE) \
		-var-file="override.tfvars"

fmt:
	terraform fmt --recursive

lint:
	terraform get \
	&& tflint --error-with-issues

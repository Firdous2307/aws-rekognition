### AWS CLI Installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Getting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials is configured correctly by running the following AWS CLI command:
```sh
aws sts get-caller-identity
```

## Installing the Terraform CLI

### Considerations with the Terraform CLI changes
The Terraform CLI installation instructions have changed due to gpg keyring changes. So we needed refer to the latest install CLI instructions via Terraform Documentation and change the scripting for install.
[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Refactoring into Bash Scripts
I decided to create a bash script to install the AWS CLI.

This bash script is located here: [./bin/install_aws_cli](./bin/install_aws_cli)
- This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml)) tidy.
- This allow us an easier to debug and execute manually AWS CLI install
- This will allow better portablity for other projects that need to install AWS CLI.

While fixing the Terraform CLI gpg depreciation issues we notice that bash scripts steps were a considerable amount more code. So we decided to create a bash script to install the Terraform CLI.

## Terraform Basics

### Terraform Registry

Terraform sources their providers and modules from the Terraform registry which located at [registry.terraform.io](https://registry.terraform.io/)
- **Providers** is an interface to APIs that will allow to create resources in terraform.
- **Modules** are a way to make large amount of terraform code modular, portable and sharable.
[Randon Terraform Provider](https://registry.terraform.io/providers/hashicorp/random)

### Terraform Console
We can see a list of all the Terrform commands by simply typing `terraform`

#### Terraform Init
At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform providers that we'll use in this project.

#### Terraform Plan
`terraform plan`
This will generate out a changeset, about the state of our infrastructure and what will be changed.
We can output this changeset ie. "plan" to be passed to an apply, but often you can just ignore outputting.

#### Terraform Apply
`terraform apply`
This will run a plan and pass the changeset to be execute by terraform. Apply should prompt yes or no.
If we want to automatically approve an apply we can provide the auto approve flag eg. `terraform apply --auto-approve`

#### Terraform Destroy
`teraform destroy`
 This is used to delete all Terraform-managed resources and dismantle the infrastructure in a given configuration.
You can also use the auto approve flag to skip the approve prompt eg. `terraform apply --auto-approve`

#### Terraform Lock Files
`.terraform.lock.hcl` contains the locked versioning for the providers or modulues that should be used with this project.
The Terraform Lock File **should be committed** to your Version Control System (VSC) eg. Github

#### Terraform State Files
`.terraform.tfstate` contain information about the current state of your infrastructure.
This file **should not be commited** to your VCS.
This file can contain sensentive data.
If you lose this file, you lose knowning the state of your infrastructure.
`.terraform.tfstate.backup` is the previous state file state.

#### Terraform Directory
`.terraform` directory contains binaries of terraform providers.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

## Issues with Terraform Cloud Login and Gitpod Workspace

When attempting to run `terraform login` it will launch bash a wiswig view to generate a token. However it does not work expected in `Gitpod VsCode` in the browser.

The workaround is manually generate a token in Terraform Cloud

```
https://app.terraform.io/app/settings/tokens?source=terraform-login
```

Then create open the file manually here:

```sh
touch /home/gitpod/.terraform.d/credentials.tfrc.json
open /home/gitpod/.terraform.d/credentials.tfrc.json
```

Make sure to provide the following code (replace your token in the file):

```json
{
  "credentials": {
    "app.terraform.io": {
      "token": "YOUR-TERRAFORM-CLOUD-TOKEN"
    }
  }
}
```

### TF Alias

[/bin/set_tf_alias](./bin/set_tf_alias) automates the addition of a convenient alias for Terraform (tf) to the user's .bash_profile. 
- The script first checks whether the alias already exists in the configuration file. If not, it appends the alias to the file, providing feedback on successful addition. 
- The script is tailored for Bash users and optionally sources the .bash_profile for immediate availability of the alias. 


#### Execution Considerations
When executing the bash script we can use the `./` shorthand notiation to execute the bash script.
eg. `./bin/install_terraform_cli`
If we are using a script in **.gitpod.yml**  we need to point the script to a program to interpert it.
eg. `source ./bin/install_terraform_cli`


### Working Env Vars

#### env command

We can list out all Enviroment Variables (Env Vars) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS_


#### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world`

In the terrminal we unset using `unset HELLO`

We can set an env var temporarily when just running a command

```sh
HELLO='world' ./bin/print_message
```
Within a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing Vars

We can print an env var using echo eg. `echo $HELLO`


#### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in thoes workspaces.

You can also set en vars in the `.gitpod.yml` but this can only contain non-senstive env vars.
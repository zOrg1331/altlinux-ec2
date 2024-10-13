AWS_REGION      ?= eu-central-2
AWS_VPC         ?= vpc-013c318bafd93bcdc
AWS_SUBNET      ?= subnet-0a042cb17187281c1

# The source AMI is the Debian AMI used to boot the builder VM. The ID depends
# on the region, see https://wiki.debian.org/Cloud/AmazonEC2Image/
SOURCE_AMI      ?= ami-0842c0ddcf4619727

# A name for your AMI. Constraints: 3-128 alphanumeric characters, parentheses
# (()), square brackets ([]), spaces ( ), periods (.), slashes (/), dashes (-),
# single quotes ('), at-signs (@), or underscores(_)
AMI_NAME        ?= sisyphus-cloud-systemd

# A brief description of the AMI
AMI_DESCRIPTION ?= Sisyphus cloud systemd

# Name tag for instance and volumes used to build the AMI
BUILDER_NAME    ?= custom-ami-builder

IMAGEPATH ?= ../cloud-systemd.img.xz

ami:
	packer build \
		-var "aws_region=$(AWS_REGION)" \
		-var "aws_vpc=$(AWS_VPC)" \
		-var "aws_subnet=$(AWS_SUBNET)" \
		-var "source_ami=$(SOURCE_AMI)" \
		-var "ami_name=$(AMI_NAME)" \
		-var "ami_description=$(AMI_DESCRIPTION)" \
		-var "builder_name=$(BUILDER_NAME)" \
		-var "imagepath=$(IMAGEPATH)" \
		./packer-cfg.json

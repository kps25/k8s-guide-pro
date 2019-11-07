export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)


export KUBERNETES_PROVIDER=aws;
export KOPS_STATE_STORE=s3://new-ssp-bucket
export NAME=sspcloudpro.co.in
echo $NAME

#export MASTER_SIZE=t2.micro
#export NODE_SIZE=t2.micro
#export NUM_NODES=2
#export NODE_ZONES=us-east-1a,us-east-1b
#export MASTER_ZONES=us-east-1c

export AWS_S3_REGION=us-east-1
#export LOAD_BALANCER=k8s-lb-1094438017.us-east-1.elb.amazonaws.com
export K8S_VERSION=1.16.0

kops create cluster \
	--state "${KOPS_STATE_STORE}" \
	--zones "us-east-1d,us-east-1f" \
	--master-count 1 \
	--master-size=t2.micro \
	--node-count 1 \
	--node-size=t2.micro \
	--name sspcloudpro.co.in \
	--yes


#kops create cluster \
#--cloud=$KUBERNETES_PROVIDER \
#--zones=$NODE_ZONES \
#--master-zones=$MASTER_ZONES \
#--node-count=$NUM_NODES \
#--node-size=$NODE_SIZE \
#--master-size=$MASTER_SIZE \
#--associate-public-ip=true  \
#--name=$NAME \
#--yes

kops update cluster ${NAME} --yes

#!/usr/bin/env bash

# You can add and customize those snippets into EC2 UserData

EFSID_PARAM_NAME=${Appname}-${Environment}-EFS-id
EFSID=$(aws --region=${AWS::Region} ssm get-parameter --name "$EFSID_PARAM_NAME" --with-decryption --output text --query Parameter.Value)
EC2_AVAIL_ZONE=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
DIR_SRC=$EC2_AVAIL_ZONE.$EFSID.efs.${AWS::Region}.amazonaws.com
DIR_TGT=/mnt/efs
mkdir "$DIR_TGT"
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,soft,timeo=600,retrans=2 "$DIR_SRC:/" "$DIR_TGT"
cp -p "/etc/fstab" "/etc/fstab.back-$(date +%F)"
echo -e "$DIR_SRC:/ \t\t $DIR_TGT \t\t nfs \t\t nfsvers=4.1,rsize=1048576,wsize=1048576,soft,timeo=600,retrans=2 \t\t 0 \t\t 0" | tee -a /etc/fstab

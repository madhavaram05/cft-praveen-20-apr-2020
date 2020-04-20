#!/bin/bash

echo "*********** Reading variables ***********************"

source init.config

echo "************Creating project $PROJECT_ID************"

gcloud projects create $PROJECT_ID \
--enable-cloud-apis \
--organization=$ORGANIZATION_ID

echo "************Linking project to billing account************"

gcloud alpha billing projects link $PROJECT_ID --billing-account=$BILLING_ACCOUNT

echo "************Adding IAM roles to project************"

NUM_OF_USERS=${#USER_EMAIL[@]}

for (( i=0; i<$NUM_OF_USERS; i++ ));
do
  echo "************Adding IAM role to user $i ****************"
  gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member user:$i --role roles/viewer

done

echo "************Enabling API************"

for i in "${API_LIST[@]}"
do
   echo "************Enabling API $i ****************"
   gcloud services enable $i --project $PROJECT_ID
done

echo "************Get project number  ***************"

PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format="value(projectNumber.scope())")

CLOUD_BUILD_SERVICE_ACCOUNT=$PROJECT_NUMBER@cloudbuild.gserviceaccount.com


echo "************Adding IAM policy to cloud builder service account at organization level************"

for i in "${CLOUD_BUILD_SERVICE_ACCOUNT_ORG_ROLES[@]}"
do
  echo "************Adding IAM role $i to cloud build service account at organization level****************"
  gcloud organizations add-iam-policy-binding $ORGANIZATION_ID \
  --member serviceAccount:$CLOUD_BUILD_SERVICE_ACCOUNT \
  --role $i

done

echo "************Adding IAM policy to cloud builder service account at project level************"

NUM_OF_PROJECT_ROLES=${#CLOUD_BUILD_SERVICE_ACCOUNT_PROJECT_ROLES[@]}
for (( i=0; i<$NUM_OF_PROJECT_ROLES; i++ ));
do
  echo "************Adding IAM role $i to cloud build service account at project level****************"
  gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member serviceAccount:$CLOUD_BUILD_SERVICE_ACCOUNT \
  --role $i

done

echo "************Creating GCS bucket************"

gsutil mb -p $PROJECT_ID  -b on gs://$BUCKET_NAME/

echo "************ Creating source repos *********"

#gcloud source repos create $SOURCE_REPO_SEED_PROJECT --project $PROJECT_ID

gcloud source repos create $SOURCE_REPO_TF_SCRIPTS --project $PROJECT_ID

echo "************deleting default network *******"
gcloud compute firewall-rules delete default-allow-internal default-allow-icmp default-allow-rdp  default-allow-ssh --project $PROJECT_ID

gcloud compute networks delete default --project $PROJECT_ID


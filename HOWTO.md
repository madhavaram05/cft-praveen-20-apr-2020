## Aristocrat Foundationss

> This repository attempts to codify the most basic foundational aspects of the gcp
  infrastructure for the riot organization.


[Instructions](#Instructions)
[Break-glass](#Break-Glass)



### Instructions

1. While signed in as an Organization Admin, navigate to the organization level in the Cloud Console.

2. Follow the instructions from [project factory](https://github.com/terraform-google-modules/terraform-google-project-factory#script-helper) to create a seed project (games-riot-cft-seed-project).

3. Link this project to a billing account.

4. On a Linux computer with Google Cloud SDK installed, clone the repository using:
      ```
      gcloud source repos clone Final-Aristocrat-repo-01 --project=games-riot-cft
      ```

5. Change directories into the aristocart-init-scripts/ folder.

6. Create the file `init.config` from the `init.config.template` file and edit the new file to populate the following variables:

      ```
      # The organization id for the GCP account.
      #   If you're unaware of the id for your organization, you may be able
      #   to find it by running the command:
      #     gcloud organizations list
      ORGANIZATION_ID="<numeric-organization-id>"

      # project id of the seed account created and to be used
      PROJECT_ID="<project-id-of-the-seed-project>"

      #add billing account id
      BILLING_ACCOUNT="<billing-account-id-alphanumeric>"

      # Specify a desired bucket name to store Terraform state files.
      #   We will attempt to create this bucket in the seed project with the
      #   init.sh script. The bucket should be named uniquely, like:
      #      {organizational prefix}-tf-states
      BUCKET_NAME="<terraform-remote-state-bucket-name>"

      #specify to if want to change prefix name to some resources, also useful for testing.
      PREFIX="<prefix>"

      # required apis to enable throughout all projects created by this proccess
      # one can create an override here by removing from the `common-variables` file that is linked
      # into each subfolder and then creating an over-ride file

      API_LIST=("compute.googleapis.com"
                  "cloudbuild.googleapis.com"
                  "cloudbilling.googleapis.com"
                  "sourcerepo.googleapis.com"
                  "cloudresourcemanager.googleapis.com"
                  "iam.googleapis.com"
                  "admin.googleapis.com"
                  "serviceusage.googleapis.com"
                  "logging.googleapis.com"
                  "storage-api.googleapis.com"
                  "bigquery-json.googleapis.com"
                  "pubsub.googleapis.com"
                  "run.googleapis.com")

      # organization roles to be bound to the cloudbuild service account

      CLOUD_BUILD_SERVICE_ACCOUNT_ORG_ROLES=(
      "roles/resourcemanager.projectCreator"
      "roles/billing.user"
      "roles/resourcemanager.folderAdmin"
      "roles/compute.xpnAdm"
      "roles/compute.networkAdmin" 
      "roles/iam.serviceAccountAdmin" 
      "roles/logging.configWriter"   
      "roles/resourcemanager.organizationAdmin"
      "roles/storage.admin"
      "roles/resourcemanager.projectIamAdmin"
      "roles/browser"
      "roles/iam.securityAdmin")

      # if there is any project role,you can add it over here.
      CLOUD_BUILD_SERVICE_ACCOUNT_PROJECT_ROLES=()
      ```

7. run init.sh
  enables the apis,adding IAM role to user,creates service account with organization roles,account at project level,creates storage bucket.
      ```
      ./init.sh

      ```

   - On successful completion of the execution of this script, the following items will be complete:
     - The following services will be enabled in the project:
       - BigQuery
       - Billing
       - Cloud Build
       - Cloud Identity
       - Cloud Logging
       - Cloud Run
       - Cloud Storage
       - Compute Engine
       - Identity and Access Management
       - PubSub
       - Resource Manager
       - Service Usage
       - Source Repositories

     - The default service account for the project will receive the following organizational roles:
       - Resource Manager > Project Creator
       - Billing > Billing Account User
       - Resource Manager > Folder Admin
       - Compute Engine > Shared VPC Admin
       - Compute Engine > Network Admin
       - Service Account > Service Account Admin
       - Logging > Logs Configuration Writer
       - Resource Manager > Organization Admin
       - Storage > Storage Admin
       - IAM > Security Admin

     - The default service account for the project will receive the following project roles:
       - None
     - The Terraform remote state file Cloud Storage bucket will be created.

8. edit cloudbuild_master.yaml and check for its sequence of resources to be created as per requirement You can modify the sequence here,

      ```
      MODULE_SEQUENCE=("Global-folder"
                       "DD-folder"
                       "B2B-folder"
                       "Stardust-folder"
                       "Global-SVPC-Project"
                       "Stardust-prod"
                       "Stardust-prod-log"
                       "Stardust-qa"
                       "Stardust-dev"
                       "Stardust-qa-vpc"
                       "Stardust-dev-vpc"
                       "Stardust-qa-log"
                       "Stardust-dev-log"
                       "Global-devops"
                       "Global-devops-log"
                       "Global-infosec"
                       "Global-infosec-log"
      ```
   - Resources created by each module:
     - main-folder
       - Creates four top-level folders in the organization:
         - Global-folder
         - DD-folder
     - sub-folder
       - Creates a folder named "B2B-folder" under the "DD" folder
     - stardust-folder
       - Creates a folder named "stardust-folder" under the "B2B" folder
     - stardust-prod
       - Creates a project named "stardust-prod" in the "stardust" folder
    
     - Global-SVPC-Project
       - Creates four subnetworks in the "global-sharedvpc-01" network
         - "customer-01-region" in region us-central1 using CIDR range 10.10.10.0/24
         - "customer-02-region" in region us-west1 using CIDR range 10.10.10.0/24
     - "Global-SVPC-Project"-log
       - Creates a logging sink capturing all logs from resources under the "global" folder, sending them to a BigQuery Dataset 

     - Stardust-qa-vpc
       - Creates four subnetworks in the "stardust-qa-vpc" network
         - "stardust-qa-us-central" in region us-central1 using CIDR range 10.10.10.0/24
         - "stardust-qa-us-west" in region us-west1 using CIDR range 10.10.10.0/24
     - "Stardust-qa-vpc"-log
       - Creates a logging sink capturing all logs from resources under the "B2B-folder" folder, sending them to a BigQuery Dataset 

     - Stardust-dev-vpc
       - Creates four subnetworks in the "stardust-dev-vpc" network
         - "stardust-dev-us-central" in region us-central1 using CIDR range 10.10.10.0/24
         - "stardust-dev-us-west" in region us-west1 using CIDR range 10.10.10.0/24
     - "Stardust-dev-vpc"-log
       - Creates a logging sink capturing all logs from resources under the "B2B-folder" folder, sending them to a BigQuery Dataset 

9. To start execution,give the following command:
      ``` gcloud config  set project <seed_project_id> ```

and then

      ```
      gcloud builds submit . --config=cloudbuild-master.yaml --timeout="1h15m5s"
      ```

10. The above listed sequence will get executed now and resources will be added into your org.


11. In order destroy those resources, give the same sequence in cloudbuild-master-destroy.yaml


12. To start execution,give the following command:

      ```
      gcloud builds submit . --config=cloudbuild-master-destroy.yaml --timeout="1h15m5s"
      ```

13. Now verify the console to confirm whether all the resources got deleted.


### Break-Glass

In the event one wanted to utilize and run, outside of cloudbuild;  assertions against this terraform state and code
all one really needs to do is get the variables from `riot-init-config/init.config` into the shell environment with `TF_VAR` 
prefixes  [variable names as per terraform documentation](https://www.terraform.io/docs/commands/environment-variables.html#tf_var_name)

In order to make this easy in a break-glass situation, `breakglass-export.sh` has been written for use and as a guide.

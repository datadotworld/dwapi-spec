# Publish & Update files from S3

Using S3 for your repository, but still want to publish data on data.world for easy sharing, collaboration, visualization, and querying? No problem!

To import a file from an Amazon S3 bucket, either use the _link_ value for any public file or for private files, generate a presigned URL using the [AWS command link interface (CLI)](http://docs.aws.amazon.com/cli/latest/userguide/installing.html). Below are the steps for this:

1. Create your dataset container on data.world
2. Add files to your dataset

## Create your dataset container on data.world:  
  1. Login to [https://data.world/](https://data.world/).
  2. Click `+ Add datasets` at the top of any page.  
  3. Name your dataset, select Open or Private and click `Create dataset`. Note that you don't need to add files through the interface. We'll add them in the next step.  

## Add files to your dataset:  

  Add files to your dataset using the S3 public or presigned URL using the #endpoint:ujqwuHZYZP8yRKgcz endpoint. For example:

  ```bash
  curl https://api.data.world/v0/datasets/<username>/<datasetName>/files \
    -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer ${DW_API_TOKEN}' \
    --data-binary '{"files": [
        { "name": "<fileName1>", "source": {"url": "<sourceURL1>" }},
        { "name": "<fileName2>", "source": {"url": "<sourceURL2>" }}
       ] }'
  ```

  Where:
  * `username` is the dataset owner username. Note you must have permissions to modify the dataset if not the owner.
  * `datasetName` is the id of the dataset. This can be found in the URL path of the dataset.
  * `DW_API_TOKEN` can be found under your profile settings within data.world, or by going to [https://data.world/settings/advanced](https://data.world/settings/advanced).
  * `fileName` is what you'd like to name the file, and should include the file extension.
  * `sourceURL` is the link for a public file, or a presigned URL for private files (see tips below).

  > **Tip 1**: URL for Public File
  > To make your file public on S3, navigate to the file, right-click on it and select _Make Public_. After doing so, go to the _Properties_ for the file and the _Link_ value can be used to upload to data.world.

  > **Tip 2**: URL for Private File
  > To generate a presigned URL for a private file on S3, you will first need to install and configure the [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/installing.html). Once that is in place, use the following command to generate the URL for each file:  
  >   
  > `aws s3 presign <S3URI> --expires-in <expireTimeInSeconds>`
  > Where `S3URI` is in the format s3://mybucket/myfile

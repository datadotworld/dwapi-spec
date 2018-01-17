# Publish & Update files from GitHub

Using GitHub for your repository, but still want to publish data on data.world for easy sharing, collaboration, visualization, and querying? No problem!

When a file is added to your GitHub repository, you can setup an automatic update of the file from GitHub to data.world with the following 3 steps:

1. Create your dataset container on data.world  
2. Add files to your dataset  
3. Setup a webhook  

## Create your dataset container on data.world: 
  1. Login to [https://data.world/](https://data.world/).
  2. Click `+ Add datasets` at the top of any page.  
  3. Name your dataset, select Open or Private 
  and click `Create dataset`. Note that you don't need to add files through the interface. We'll add them in the next step.  

## Add files to your dataset using the GitHub source URLs: 

To add files using the GitHub URL use the #endpoint:ujqwuHZYZP8yRKgcz endpoint. For example:

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
  * `sourceURL` is the github URL for the file.

## Setup a webhook to sync your files whenever they change on GitHub: 
  1. When logged into GitHub, go to the *settings* page of your repository by clicking on the “settings” tab.
  2. Go to the “webhooks” tab on the settings page.
  3. Click the “Add webhook” button.  
  4. Use the #endpoint:Lqji3375Xx5W3K2Pm endpoint for the Payload URL. Be sure to 
  replace the tokens. For example:   

        ```
        https://api.data.world/v0/datasets/<username>/<datasetName>/sync?authentication=Bearer+<MY-API-TOKEN>
        ```

  5. Select `application/x-www-form-urlencoded` for Content type.
  6. Select `Just the push event` for the events to trigger the webhook.
  7. Click the `Add webhook` button.

That's it! Now anytime one of the files is changed on GitHub, a new version will be automatically pushed to data.world.

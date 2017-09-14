# Publish & Update Files from Google Sheets

Using Google Drive to host your files, but still want to publish data on data.world for easy sharing, collaboration, visualization, and querying? No problem!

When a file is added to your Google Drive, you can setup a link from Google to data.world to easily update it on-demand with the following steps. Note: these instructions are specific to Google Sheets:

1. Create your dataset container on data.world
2. Add files to your dataset
3. Setup an update script

## Create your dataset container on data.world: 
  1. Login to [https://data.world/](https://data.world/).
  2. Click `+ Add datasets` at the top of any page.  
  3. Name your dataset, select Open or Private and click `Create dataset`. Note that you don't 
 need to add files through the interface. We'll add them in the next step.  

## Add files to your dataset: 

Add files to your dataset with the published Google Drive link using the #endpoint:ujqwuHZYZP8yRKgcz endpoint. For example:

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
  * `sourceURL` is the sharable Google Drive link (see tip below).

  > **Tip:**  
  > To get the [sharable Google Drive url](https://support.google
  .com/drive/answer/2494822?co=GENIE.Platform%3DDesktop&hl=en), go to the file on Google and:  
  > * Click on the _Share_ button in the top-right corner of your file  
  > * Select the link sharing option. It must be set to either _Public on the Web_ or _Anyone with the link_. Access can be edit / comment / or view.  
  > * Click _Copy Link_.

## Create a Google script to control the sync to data.world. 

Complete this step for each file you've added to your dataset and would like to sync on-demand:

  1. Within the Google Sheet, go to Tools > Script editor.
  2. Copy the following script and replace the `username`, `datasetName` and `myApiToken` variables with the relevant values and save the script.

  ```javascript
  function onOpen() {
  var ui = SpreadsheetApp.getUi(); // Or DocumentApp or FormApp.
  ui.createMenu('data.world')
      .addItem('Sync file', 'menuItem1')
      .addToUi();
  }

  function menuItem1() {
    var username = 'username';
    var datasetName = 'datasetName';
    var myApiToken = 'myApiToken';

    var headers = {
      'Authorization': 'Bearer ' + myApiToken,
      'Content-type': 'application/x-www-form-urlencoded'
    };
    var url = 'https://api.data.world/v0/datasets/' + username + '/' + datasetName + '/sync';  
    var options = {
      'method': 'post',
      'headers': headers
    };
    var response = UrlFetchApp.fetch(url, options);  

    SpreadsheetApp.getUi() // Or DocumentApp or FormApp.
      .alert(response);
  }
  ```
  3. Refresh your spreadsheet and you should now see a `data.world` menu with a `Sync file` option.
  4. Anytime your file changes you'd like to push the new version to your data.world dataset, just select data.world > sync file.  
    Note: you might be prompted to authorize the push using your Google account.

That's it! Add the Google Script to any files you'd like to keep up to date with the click of a button.

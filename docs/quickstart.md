data.world's mission is to build the most meaningful, collaborative, and abundant data resource in the world, so that people who work with data can solve problems faster. As part of that mission, we want to ensure that our users are able to easily access data and manage their data projects regardless of system or tool preference.

# Quick Start

## Creating Datasets

To create a dataset, use the #endpoint:93LqHoGaE2snXCCpu endpoint. For example, you can create a `PRIVATE` dataset called `API sandbox`, with the following command:

```bash
curl --request POST \
  --url "https://api.data.world/v0/datasets/${DW_USERNAME}" \
  --header "authorization: Bearer ${DW_API_TOKEN}" \
  --header "content-type: application/json" \
  --data '{"title":"API Sandbox","visibility":"PRIVATE"}'
```

Where the following must be replaced:

* `${DW_USERNAME}`: your data.world username
* `${DW_API_TOKEN}`: your API authentication token

As a result, the server response should look like this:

```json
{
  "message": "Dataset has been successfully created.",
  "uri": "https://data.world/[USERNAME]/api-sandbox"
}
```

Once a dataset is created, other endpoints can be used to update it, including its set of files. Check out #endpoint:asFRaPWvQM5eDqeKt and #endpoint:XdcQKTziah5iiEsYp, for additional details.

Now, let's see how files can be added to datasets.

## Uploading files

Files can be added to datasets via direct upload or by reference, using the URL of a file that is hosted publicly on the web.

For example, we can get a complete list of NYC subway stations from data.cityofnewyork.us in CSV format at https://data.cityofnewyork.us/api/views/kk4q-3rt2/rows.csv?accessType=DOWNLOAD

You can add that file to our `API Sandbox` dataset using the #endpoint:ujqwuHZYZP8yRKgcz endpoint with the following command:

```bash
curl --request POST \
  --url "https://api.data.world/v0/datasets/${DW_USERNAME}/api-sandbox/files" \
  --header "authorization: Bearer ${DW_API_TOKEN}" \
  --header "content-type: application/json" \
  --data '{"files":[{"name":"nyc-subways.csv","source":{"url":"https://data.cityofnewyork.us/api/views/kk4q-3rt2/rows.csv?accessType=DOWNLOAD"},"description":"List of NYC subway stations","labels":["raw data"]}]}'
```

For clarity, this is the JSON data included in the above request:
```json
{
  "files": [
    {
      "name": "nyc-subways.csv",
      "source": {
        "url": "https://data.cityofnewyork.us/api/views/kk4q-3rt2/rows.csv?accessType=DOWNLOAD"
      },
      "description": "List of NYC subway stations",
      "labels": [
        "raw data"
      ]
    }
  ]
}
```

As a result, the server response should look like this:
```json
{
  "message": "Dataset has been successfully updated with new sources. Sync in progress."
}
```

Processing of uploaded files is asyncrhonous and finishes quickly. However, large files can take a few minutes to process. Once the dataset is in `LOADED` status, the data is ready to be consumed.

Let's look at how you can check the status of a dataset

## Retrieving dataset info

To retrieve dataset info, use the #endpoint:asFRaPWvQM5eDqeKt endpoint. For example:
```bash
curl --request GET \
  --url "https://api.data.world/v0/datasets/${DW_USERNAME}/api-sandbox" \
  --header "authorization: Bearer ${DW_API_TOKEN}" \
  --header "content-type: application/json"
```

As a result, the server response should look like this:
```json
{
  "owner": "rflprr",
  "id": "api-sandbox",
  "title": "API Sandbox",
  "visibility": "PRIVATE",
  "files": [
    {
      "name": "nyc-subways.csv",
      "sizeInBytes": 64188,
      "source": {
        "url": "https://data.cityofnewyork.us/api/views/kk4q-3rt2/rows.csv?accessType=DOWNLOAD",
        "syncStatus": "OK",
        "lastSyncStart": "2017-06-21T14:53:17.038Z",
        "lastSyncSuccess": "2017-06-21T14:53:17.045Z"
      },
      "created": "2017-06-21T14:53:15.806Z",
      "updated": "2017-06-21T14:53:15.806Z",
      "description": "List of NYC subway stations",
      "labels": [
        "raw data"
      ]
    }
  ],
  "status": "LOADED",
  "created": "2017-06-21T14:51:41.096Z",
  "updated": "2017-06-21T14:53:18.852Z"
}
```

Note that `syncStatus` is `OK` and `status` is `LOADED`. That indicates that the file was synchronized correctly and that the dataset is ready to use.

## Querying with SQL

Now that the dataset is ready to be used, we can, for example, discover which NYC subway stations the `7 Express` train stops at using the `query.data.world` API. For example:

```bash
curl --request POST \
  --url "https://query.data.world/sql/${DW_USERNAME}/api-sandbox" \
  --header "authorization: Bearer ${DW_API_TOKEN}" \
  --header "accept: text/csv" \
  --data-urlencode 'query=SELECT NAME, LINE FROM `nyc-subways` WHERE LINE LIKE "%7 Express%"'
```

As a result, the server response shouldlook like this:
```
NAME,LINE
Vernon Blvd - Jackson Ave,7-7 Express
Queensboro Plz,7-7 Express-N-W
Times Sq - 42nd St,7-7 Express
Grand Central - 42nd St,7-7 Express
Mets - Willets Point,7-7 Express
Junction Blvd,7-7 Express
Flushing - Main St,7-7 Express
5th Ave - Bryant Pk,7-7 Express
34th St - Hudson Yards,7-7 Express
Woodside - 61st St,7-7 Express
Court Sq,7-7 Express
Hunters Point Ave,7-7 Express
```

## Next steps

1. Take some time to read the "Conventions" section below and to explore more endpoints and their documentation.
2. Find if you can benefit from existing integrations and skip using this API altogether, by checking our gallery at https://data.world/integrations. Come back often as we are constantly implementing new integrations.
3. Check-out additional documentation and tutorials at https://help.data.world too.
4. Let us know what cool things you create and make sure to reach out if you need support. We are at help@data.world and would love to hear from you!

# Conventions

## Authentication
All data.world API calls require an API token. After logging into data.world, find your token by navigating to your profile settings, under the Advanced tab or go to [https://data.world/settings/advanced](https://data.world/settings/advanced)

Authentication must be provided in API requests via the `Authorization` header. For example, for a user whose API token is `my_api_token`, the request header should be `Authorization: Bearer my_api_token`.

Those developing applications and integrations are encouraged to implement authentication directly within their apps via OAuth.

## Content type  
By default, `application/json` is the content type used in request and response bodies. Exceptions are noted in respective endpoint documentation.

## HTTPS only  
Our APIs can only be accessed via HTTPS

## APIs
At the moment, there are two entry points for data.world APIs:

* [api.data.world](./query.md)
* [query.data.world](./datasets.md)

These will soon be consolidated under `api.data.world`.

## Feedback
We will continue to introduce more endpoints and functionality as we can, but if there are areas that you'd like to see additional functionality, or if you've come across things not working as expected, please let us know by emailing [help@data.world](mailto:help@data.world).
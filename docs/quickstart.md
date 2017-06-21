data.world's mission is to build the most meaningful, collaborative, and abundant data resource in the world, so that people who work with data can solve problems faster. As part of that mission, we want to ensure that our users are able to easily access data and manage their data projects regardless of system or tool preference.

# Quick Start

## Creating Datasets

To create a dataset, use the #endpoint:93LqHoGaE2snXCCpu endpoint. For example, you can create a `PRIVATE` dataset called `API sandbox`, with the following command:

```bash
curl --request POST \
  --url 'https://api.data.world/v0/datasets/[USERNAME]' \
  --header 'authorization: Bearer [YOUR_TOKEN]' \
  --header 'content-type: application/json' \
  --data '{"title":"API Sandbox","visibility":"PRIVATE"}'
```

Where the following must be replaced:

* `[USERNAME]`: your data.world username
* `[YOUR_TOKEN]`: your API authentication token

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
  --url 'https://api.data.world/v0/datasets/[USERNAME]/api-sandbox/files' \
  --header 'authorization: [API_TOKEN]' \
  --header 'content-type: application/json' \
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

Let's look at how SQL can be used to query the data we just uploaded.

## Querying with SQL

TODO

# Things to Know

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
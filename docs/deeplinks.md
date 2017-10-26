Deeplinks are URLs for landing pages that allow a user on data.world to navigate from datasets 
or data projects to your product seamlessly, without need for instructions or manual steps.

By supporting deeplinks, your product can be featured contextually on data.world where users go to
look for a source or destination for their data. Specifically, users can launch your product to 
source data for a dataset or data project, or to transfer data from a dataset, data project, file 
or query results view.

!["Contextual Links"](https://cdn.filepicker.io/api/file/tfESueEfROuL3ibbBxka "Contextual Links")

Two kinds of deeplinks are supported:
- `open`: This is where users will be linked to when bringing data from data.world to your product
- `import`: This is where users will be linked to when sourcing data from your product to data.world

Your deeplink URL must support the following parameters:

- `project`: Data project key
- `dataset`: Dataset key
- `redirect_url`: Encoded URL where users can be redirected to, when sent back to data.world
- `query` (open only): Query
- `query_type` (open only): Query type (SQL or SPARQL)

Your landing page should behave in accordance with the parameters passed to it. For example, a data visualization product receiving a `dataset_key` and `query`, should automatically set up the data source and pull in the data, saving the user steps and taking the user directly to the visualization editor.
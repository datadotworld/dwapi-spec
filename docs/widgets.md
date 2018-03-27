data.world widgets speed up the development of rich integrations for data.world. They are fully
responsive drop-in web components that make it possible for users to browse data and author queries
right from your product.

## Dataset Selector

With the Data Finder, users can look for an pick the dataset or data project they want to use
without leaving your product.

!["Data Finder"](https://cdn.filepicker.io/api/file/n9bRCCrZTHa4I6jQ3H5y "Data Finder")

### Integration Steps

**Step 1**: Include https://widgets.data.world/dataworld-widgets.js in your html.

**Step 2**: Instantiate and launch the widget

```javascript
var options = {
  client_id: 'example' // Your OAuth client ID
};
var datasetSelector = new window.dataworldWidgets.DatasetSelector(options);

datasetSelector.success(function (selectedDataset) {
  // This will be called when a dataset's 'Link' button is pressed
  // At this point, proceed with API calls that make sense in the context of your app
});

datasetSelector.cancel(function () {
  // this will be called when the user clicks outside the dataset selector to close it
});

// Shows the dataset selector
datasetSelector.show();
```

**Step 3** (optional): Customize options

- `hideSearchBar`: (boolean) hides the search bar on the widget
- `hideViewButton`: (boolean) hides the view button on the search results. The view button links out to the dataset on data.world
- `linkText`: (string) replaces the Link button text on the search results
- `query`: (string) default query for search
- `tabs`: (array) tabs to be shown on the selector. Available options are 'search', 'authorized', and 'liked'. By default all tabs will be shown.

## Query Editor

**PREVIEW FEATURE**: This is a preview feature. [Contact us](https://help.data.world/hc/en-us/requests/new) to request early access.

With the Query Editor, users can author SQL and SPARQL queries right from within your product.

!["Query Editor"](https://cdn.filepicker.io/api/file/NnnGU4xAQkSNk7QpMspH "Query Editor")

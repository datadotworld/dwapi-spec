# Intro to REST APIs

The data.world API (Application Programming Interface) is built around [REST](https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm) (Representational State Transfer). REST APIs allow data.world (and other programs) to make functionality and data available to other programs for consumption in a consistent format. 

data.world's API is built around predictable URLs and HTTP response codes help surface any errors that may occur, so you can quickly make changes and continue. 

Want to know what you can do with the API? Use it to upload & download data, get user information, create Insights, query datasets, and send notifications, and more. 
**Check out our [API Reference](https://apidocs.data.world/api) for the full list of endpoints.** 


data.world uses common HTTP methods to access resources:

| Method | Description | Use |
| ------ | ----------- | --- |
| GET | Used to retrieve information/data. Can be used safely as it does not alter resources. | Retrieve datasets, download files, retrieve user data. 
| POST | Used to create new data on a server. POST methods will have side-effects as they do alter resources | Create a dataset, query via SQL or SPARQL, Upload & sync files. |
| PUT | Used to replace existing data. | Replace an insight, subscribe to a dataset or project, link a dataset. |
| PATCH | Used to update existing data. See [this](#general-behavior-of-patch) section for more details. | Update a resource such as insight or dataset. |
| DELETE | Used to remove resources from a server. | Delete a dataset or project, delete files, unsubscribe from dataset, unlink a dataset. ||

### General behavior of PATCH

* Only elements included in the request will be updated. All omitted elements will remain untouched.
* Requesting an element to be null deletes all values on the element.
* Requesting change in a list replaces the entire list.

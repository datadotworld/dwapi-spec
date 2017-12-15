**PREVIEW FEATURE**: *This is a preview feature. [Contact us](https://help.data.world/hc/en-us/requests/new) to request early access.*

---

Webhooks allow products to automatically respond to activity of interest performed on data.world.
For example, your product can notify users or trigger a job when data in a particular dataset is
updated.

Once a webhook is configured it can be triggered for one or more of the following events:

- Datasets created, updated or deleted
- Data projects created, updated or deleted
- Insights created, updated or deleted
- Files created, updated or deleted

Webhooks are triggered via a `POST` request to the URL provided in its configuration. The request
body will typically include:

- `action`: The action performed by the user
- `entity`: The type of resource affected (e.g. dataset, project, file, insight, etc)
- `actor`: Display name of user who performed the action
- `owner`: Display name of user who owns the affected resource
- `dataset`: Display name of dataset
- `project` (optional): Display name of data project
- `insight` (optional): Display name of insight
- `file` (optional): Display name of file
- `timestamp`: Event date and time
- `origin`: System through which user performed the action (typically OAuth client display name)
- `links`
  - `web`: Web URLs for all affected and related resources
  - `api`: API URLs to retrieve additional information about affected and related resources

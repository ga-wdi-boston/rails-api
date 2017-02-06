# Role: Places Controller

## Can Talk To:

-   Server
-   Places Model

## Description

The Places Controller is responsible for handling requests related to the
'Places' resource. When it receives a direction from the Server, it follows
through without hesitation, often calling on one or more Models to help it
complete its task. In addition, once the Controller is done with its job, it
needs to construct a 'View' - information to share back to the Client.

Here is the full list of 'actions' that the Places Controller can perform.

|  Action   |                                                                                                      What To Do                                                                                                      |
|:---------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  `index`  |                                                                                    Ask the Places Model for a list of all Places.                                                                                    |
| `create`  |                                                                       Tell the Places Model to create a new Place using the data given to you.                                                                       |
|  `show`   |                                                                            Ask the Places Model for the Place with the ID you were given.                                                                            |
| `update`  | Ask the Places Model if it can find the Place with the ID you were given. If it can, tell the Place Model to update that Place with the information you've been given, and give you back the new data on that Place. |
| `destroy` |                                           Ask the Places Model if it can find the Place with the ID you were given. If it can, tell the Place Model to delete that Place.                                            |

## Serializers for Each Action:

### `show`

```json
{
  "place": {
    "id": <value>,
    "name": <value>,
    "country": <value>,
    "longitude": <value>,
    "latitude": <value>
  }
}
```

### `index`

Note the difference between the top-level (or "root") key for a collection
response. What number is it?

```json
{
  "places": [
    {
      "id": <value>,
      "name": <value>,
      "country": <value>,
      "longitude": <value>,
      "latitude": <value>
    },
    { one object per repsponse ... }
  ]
}
```

### `create`

Same as `show`, for the Person you just created. It will also have an "id".

### `update`

Just send HTTP Status Code 204 (No Content).

### `destroy`

Just send HTTP Status Code 204 (No Content).

## Errors

If for whatever reason you can't successfully complete your job, send an
'ERROR' message back to the Server. For example,

-   "Error: No such ID" (if the ID doesn't exist)
-   "Error: Bad Request" (if the Model says that your data isn't valid)

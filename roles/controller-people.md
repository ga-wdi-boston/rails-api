# Role: People Controller

## Can Talk To:

-   Server
-   People Model

## Description

The People Controller is responsible for handling requests related to the
'People' resource. When it receives a direction from the Server, it follows
through without hesitation, often calling on one or more Models to help it
complete its task. In addition, once the Controller is done with its job, it
needs to construct a 'View' - information to share back to the Client.

Here is the full list of 'actions' that the People Controller can perform.

|  Action   |                                                                                                        What To Do                                                                                                        |
|:---------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  `index`  |                                                                                      Ask the People Model for a list of all People.                                                                                      |
| `create`  |                                                                        Tell the People Model to create a new Person using the data given to you.                                                                         |
|  `show`   |                                                                             Ask the People Model for the Person with the ID you were given.                                                                              |
| `update`  | Ask the People Model if it can find the Person with the ID you were given. If it can, tell the Person Model to update that Person with the information you've been given, and give you back the new data on that Person. |
| `destroy` |                                            Ask the People Model if it can find the Person with the ID you were given. If it can, tell the Person Model to delete that Person.                                            |

## Serializers for Each Action:

Only for successful requests, respond according to the action executed.

### `show`

```json
{
  "person:" {
    "id": <value>,
    "given_name": <value>,
    "surname": <value>,
    "born_on": <value>,
    "occupation": <value>
  }
}
```

### `index`

Note the difference between the top-level (or "root") key for a collection
response. What number is it?

```json
{
  "people": [
    {
      "id": <value>,
      "given_name": <value>,
      "surname": <value>,
      "born_on": <value>,
      "occupation": <value>
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

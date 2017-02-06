# Role: Things Controller

## Can Talk To:

-   Server
-   Things Model

## Description

The Things Controller is responsible for handling requests related to the
'Things' resource. When it receives a direction from the Server, it follows
through without hesitation, often calling on one or more Models to help it
complete its task. In addition, once the Controller is done with its job, it
needs to construct a 'View' - information to share back to the Client.

Here is the full list of 'actions' that the Things Controller can perform.

|  Action   |                                                                                                      What To Do                                                                                                      |
|:---------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  `index`  |                                                                                    Ask the Things Model for a list of all Things.                                                                                    |
| `create`  |                                                                       Tell the Things Model to create a new Thing using the data given to you.                                                                       |
|  `show`   |                                                                            Ask the Things Model for the Thing with the ID you were given.                                                                            |
| `update`  | Ask the Things Model if it can find the Thing with the ID you were given. If it can, tell the Thing Model to update that Thing with the information you've been given, and give you back the new data on that Thing. |
| `destroy` |                                           Ask the Things Model if it can find the Thing with the ID you were given. If it can, tell the Thing Model to delete that Thing.                                            |

## Serializers for Each Action:

### `show`

```json
{
  "thing:" {
    "id": <value>,
    "item": <value>,
    "price": <value>,
    "description": <value>
  }
}
```

### `index`

Note the difference between the top-level (or "root") key for a collection
response. What number is it?

```json
{
  "things": [
    {
      "id": <value>,
      "item": <value>,
      "price": <value>,
      "description": <value>
    },
    { one object per repsponse ... }
  ]
}
```

### `create`

Same as `show`, for the Person you just created. It will also have an "id".

### `update`

Just send HTTP Status Code 204 (No Content).

#### `destroy`

Just send HTTP Status Code 204 (No Content).

## Errors

If for whatever reason you can't successfully complete your job, send an
'ERROR' message back to the Server. For example,

-   "Error: No such ID" (if the ID doesn't exist)
-   "Error: Bad Request" (if the Model says that your data isn't valid)

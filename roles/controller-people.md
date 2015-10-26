# Role: People Controller

### Can Talk To:
* Server
* People Model

## Description
The People Controller is responsible for handling requests related to the 'People' resource. When it receives a direction from the Server, it follows through without hesitation, often calling on one or more Models to help it complete its task. In addition, once the Controller is done with its job, it needs to construct a 'View' - information to share back to the Client.

Here is the full list of 'actions' that the People Controller can perform.

| Action | What To Do |
|:--:|:--:|
| `index` | Ask the People Model for a list of all People. |
| `create` | Tell the People Model to create a new Person using the data given to you.|
| `show` | Ask the People Model for the Person with the ID you were given. |
| `update` | Ask the People Model if it can find the Person with the ID you were given. If it can, tell the Person Model to update that Person with the information you've been given, and give you back the new data on that Person. |
| `destroy` | Ask the People Model if it can find the Person with the ID you were given. If it can, tell the Person Model to delete that Person. |

### View Templates for Each Action:

#### `show`
```html
<ul>
  <li>
    <h3> Name : (first name) (last name) </h3>
    <span> DOB: (DOB), Occupation: (occupation)</span>
  </li>
</ul>
```

#### `index`
```html
<ul>
  <li>
    <h3> Name : (first name) (last name) </h3>
    <span> DOB: (DOB), Occupation: (occupation)</span>
  </li>
  ...
  ...
  ...
</ul>
```

#### `create`
Same as `show`, for the Person you just created.

#### `update`
Same as `show`, for the Person you just updated (with new properties).

#### `destroy`
Write "Destroyed Person with ID: (id)"

## Errors
If for whatever reason you can't successfully complete your job, send an 'ERROR' message back to the Server.
e.g.
* "Error: No such ID" (if the ID doesn't exist)
* "Error: Bad Request" (if the Model says that your data isn't valid)

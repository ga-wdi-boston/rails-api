# Role: Places Controller

### Can Talk To:
* Server
* Places Model

## Description
The Places Controller is responsible for handling requests related to the 'Places' resource. When it receives a direction from the Server, it follows through without hesitation, often calling on one or more Models to help it complete its task. In addition, once the Controller is done with its job, it needs to construct a 'View' - information to share back to the Client.

Here is the full list of 'actions' that the Places Controller can perform.

| Action | What To Do |
|:--:|:--:|
| `index` | Ask the Places Model for a list of all Places. |
| `create` | Tell the Places Model to create a new Place using the data given to you.|
| `show` | Ask the Places Model for the Place with the ID you were given. |
| `update` | Ask the Places Model if it can find the Place with the ID you were given. If it can, tell the Place Model to update that Place with the information you've been given, and give you back the new data on that Place. |
| `destroy` | Ask the Places Model if it can find the Place with the ID you were given. If it can, tell the Place Model to delete that Place. |

### View Templates for Each Action:

#### `show`
```html
<ul>
  <li>
    <h4> (name), found in (country) </h4>
    <span> { (latitude), (longitude) } </span>
  </li>
</ul>
```

#### `index`
```html
<ul>
  <li>
    <h4> (name), found in (country) </h4>
    <span> { (latitude), (longitude) } </span>
  </li>
  ...
  ...
  ...
</ul>
```

#### `create`
Same as `show`, for the Place you just created.

#### `update`
Same as `show`, for the Place you just updated (with new properties).

#### `destroy`
Write "Destroyed Place with ID: (id)"

## Errors
If for whatever reason you can't successfully complete your job, send an 'ERROR' message back to the Server.
e.g.
* "Error: No such ID" (if the ID doesn't exist)
* "Error: Bad Request" (if the Model says that your data isn't valid)

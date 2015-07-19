# Role: Server

## Description
The server is responsible for
1. receiving the requests that the client sends
2. triggering the appropriate controller actions in response to those requests (using the routes that have been previously configured)
3. sending the 'view', produced by the controller at the end of its action, back to the client

The table of routes you'll be working with are below; any time a route has a term with a colon, like `:this`, it means that a value will be passed in as part of the path.

### Routes for People(/Places/Things) Controller
| Path | Request Type | Controller | Controller Action | Meaning |
|:--:|:--:|:--:|:--:|:--:|
| `/people` | GET | People Controller | `index` | _Retrieve all people._ |
| `/people` | POST | People Controller | `create` | _Make a new person, using data provided by the request._ |
| `/people/:id` | GET | People Controller | `show` | _Retrieve one specific person who has the given id._ |
| `/people/:id` | PATCH/PUT | People Controller | `update` | _Change the properties of the person with the given id, using data provided by the request._ |
| `/people/:id` | DELETE | People Controller | `destroy` | _Destroy the person with the given id._ |

### Routes for UserController (Optional)
| Path | Request Type | Controller | Controller Action | Meaning |
|:--:|:--:|:--:|:--:|:--:|
| `/register` | POST | Users Controller | `create` | _Create a new User._ |
| `/login`  | POST | Users Controller | `login` |  _Confirm whether or or not the user exists, and if the password is a match; if this is successful, give the user a token that they can use._ |

## Errors
If for whatever reason you can't successfully complete your job, send an 'ERROR' message back to the server.
e.g.
* "Error: No such ID" (if the ID doesn't exist)
* "Error: Bad Request" (if the Model says that your data isn't valid)

# Role: People Model

## Description
The People Model is responsible for directly interacting with the data store, reading and writing data as directed. The data store for 'People' can be found [here](https://docs.google.com/spreadsheets/d/13HGFDYqSSWFuUnWHankWZtbej7ABcyy5e4fDLit1e_c/edit#gid=0).

Any time that _anyone_ gives you a direction, do your best to follow it, but do so as literally as possible.

* In general, when asked for data, you should copy the line(s) that are requested and send back the data to whoever asked for it.
* When asked to make a change (e.g. creating or updating), if the change is successful, send back the row that you've created/updated.
* When asked to delete a row, send back the confirmation "Person with ID: (id) deleted."

## Errors
* If you're asked to retrieve data on a particular Person, and there is no Person with that ID, send back "No Person Found."
* If you're told to create or update a particular record, but the data you try to enter is invalid, send back "Invalid Data."

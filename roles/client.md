# Role: Client

## Can Talk To:

-   Server

## Description

The client makes requests to the server. Here are the requests that the client should make.

1.  GET /people/1
    <!-- Expected Response: Note rooted JSON response -->
    <!-- ```json
    {
      "person:" {
        "id": 1,
        "given_name": "Tommaso",
        "surname": "d'Aquino",
        "born_on": "1225-01-28",
        "occupation": "philosopher"
      }
    }
    ``` -->

1.  GET /things/3
    <!-- Expected Response -->
    <!-- ```json
    {
      "thing": {
        "id": 3,
        "item": "Chef's Knife",
        "price": "$40.50",
        "description": "8-inch multipurpose chef's knife designed for chopping, mincing, slicing, and dicing"
      }
    }
    ``` -->

1.  POST /places (`{name: CN Tower, country: Canada, latitude: 43.642566, longitude: -79.387057}`)
    <!-- Expected Response: note the ID -->
    <!-- ```json
    {
      "place": {
        "id": 11,
        "name": "CN Tower",
        "country": "Canada",
        "latitude": 43.642566,
        "longitude": -79.387057
      }
    }
    ``` -->

1.  PATCH /things/8 (`{price: 6.99}`)
    <!-- Expected Response: note no body -->
    <!-- ```sh
    HTTP 204/No Content
    ``` -->

1.  GET /people
    <!-- Expected Response: Note the root collection pluralization and array -->
    <!-- ```json
    {
      "people": [
        {
          "id": 1,
          "given_name": "Tommaso",
          "surname": "d'Aquino",
          "born_on": "1225-01-28",
          "occupation": "philosopher"
        },
        {
          "id": 2,
          "given_name": "Dwight",
          "surname": "Eisenhower",
          "born_on": "1890-10-14",
          "occupation": "general"
        },
        {
          "id": 3,
          "given_name": "Guinness",
          "surname": "Alec",
          "born_on": "1914-04-02",
          "occupation": "actor"
        },
        {
          "id": 4,
          "given_name": "Baldwin",
          "surname": "Alec",
          "born_on": "1958-04-03",
          "occupation": "actor"
        },
        {
          "id": 5,
          "given_name": "Michael",
          "surname": "Phelps",
          "born_on": "1985-06-30",
          "occupation": "athlete"
        },
      ]
    }
    ``` -->

1.  DELETE /places/7
    <!-- Expected Response -->
    <!-- ```sh
    HTTP 204/No Content
    ``` -->

7.  PATCH /things/20 (`{price: 10.99}`)
    <!-- Expected Response -->
    <!-- ```sh
    HTTP 404/Not Found
    ``` -->

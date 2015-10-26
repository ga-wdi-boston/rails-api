# Role: Client

### Can Talk To:
* Server

## Description
The client makes requests to the server. Here are the requests that the client should make.

1. GET /people/1
  <!-- Expected Response -->
  <!-- ```html
  <ul>
    <li>
      <h3> Name : Tommaso	d'Aquino </h3>
      <span> DOB: 1/28/1225, Occupation: philosopher </span>
    </li>
  </ul>
  ``` -->

2. GET /things/3

  <!-- Expected Response -->
  <!-- ```html
  <ul>
    <li>
      <h4> Chef's Knife :: $40.50 </h4>
      <span> 8-inch multipurpose chef's knife designed for chopping, mincing, slicing, and dicing </span>
    </li>
  </ul>
  ``` -->

3. POST /places ({name: CN Tower, country: Canada, latitude: 43.642566, longitude: -79.387057})

  <!-- Expected Response -->
  <!-- ```html
  <ul>
    <li>
      <h4> CN Tower, found in Canada </h4>
      <span> { 43.642566, -79.387057 } </span>
    </li>
  </ul>
  ``` -->

4. PATCH /things/8 ({price: 6.99})

  <!-- Expected Response -->
  <!-- ```html
  <ul>
    <li>
      <h4> Spray Bottle :: $6.99 </h4>
      <span> 8 oz, frosted </span>
    </li>
  </ul>
  ``` -->

5. GET /people

  <!-- Expected Response -->
  <!-- ```html
  <ul>
    <li>
      <h3> Name : Tommaso	d'Aquino </h3>
      <span> DOB: 1/28/1225, Occupation: philosopher </span>
    </li>
    <li>
      <h3> Name : Dwight Eisenhower </h3>
      <span> DOB: 10/14/1890, Occupation: general </span>
    </li>
    <li>
      <h3> Name : Alec Guinness </h3>
      <span> DOB: 4/2/1914, Occupation: actor </span>
    </li>
    <li>
      <h3> Name : Alec Baldwin </h3>
      <span> DOB: 4/3/1958, Occupation: actor </span>
    </li>
    <li>
      <h3> Name : Michael Phelps </h3>
      <span> DOB: 6/30/1985, Occupation: athlete </span>
    </li>
  </ul>
  ``` -->

6. DELETE /places/7

  <!-- Expected Response -->
  <!-- ```html
  "Destroyed Place with ID: 7"
  ``` -->

7. PATCH /things/20 ({price: 10.99})

  <!-- Expected Response -->
  <!-- ```html
  "Error: No such ID"
  ``` -->

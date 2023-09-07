Origins
=======

Basic concepts
~~~~~~~~~~~~~~

An origin in the platform is a tag for the correct cataloging and
correlation of incoming data, as well as a container with user settings
which indicate how this data should be processed.

All data stored in the platform must have as one of its attributes the
name of its origin, because only then can the platform accurately
identify where the data has come from into the platform, and, as a
result, correctly catalog it and execute custom logic.

Before you begin uploading data to the platform, make sure to create an
origin with the same name that you will then specify in your API request
or when connecting a camera to the preprocessing server.

All data that is intended for cataloging and storage in the platform
cannot be saved in the platform if when it is uploaded no origin is
specified or an origin that does not exist is specified. An error
message will appear each time this happens.

Create Origin
~~~~~~~~~~~~~

**Authorized Client() required.**

This method creates new origin with specified name.

All of the parameters, except ``name``, are optional.

.. code:: python

   from serp import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.origins.create(
       name="test"
   )
   json_response = response.json()

List Origins
~~~~~~~~~~~~

**Authorized Client() required.**

This method returns paginated list of origins. Can be filtered by name
using ``q`` & by list of space ids.

.. code:: python

   from serp import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.origins.list(q="te", spaces_ids=[1, 2], limit=10, offset=5)
   json_response = response.json()

Get Origin by id
~~~~~~~~~~~~~~~~

**Authorized Client() required.**

This method returns origin info, if found by its id.

.. code:: python

   from serp import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.origins.get(id=1)
   json_response = response.json()

Update Origin by id
~~~~~~~~~~~~~~~~~~~

**Authorized Client() required.**

This method updates origin info, if found by its id.

.. code:: python

   from serp import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.origins.update(
       id=1,
       name="test"
   )
   json_response = response.json()

Delete Origin by id
~~~~~~~~~~~~~~~~~~~

**Authorized Client() required.**

This method deletes origin, if found by its id.

.. code:: python

   from serp import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.origins.delete(id=1)
   if response.status_code == 202:
       # NOTE: There is empty response in case of successful operation
       print("Origin deleted successfully.")
Spaces
======

Basic concepts
~~~~~~~~~~~~~~

Spaces are a way of having multiple databases of people inside your
single account.

Origins, Profiles and any other entities are only visible (created &
searched, for example) inside particular space you’re in.

To be precise, you can’t have any data in your account that isn’t
attached to a space. You always have space named “default”, and even if
you use account tokens (not space tokens), you’re still using spaces
(well, that “default” space).

Create Space
~~~~~~~~~~~~

**Authorized Client() required.**

This method creates new space with specified name.

.. code:: python

   from serp_onpremise import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.spaces.create(name="test")
   json_response = response.json()
   print(json_response)

List Spaces
~~~~~~~~~~~

**Authorized Client() required.**

This method returns paginated list of spaces. Can be filtered by name
using ``q``.

.. code:: python

   from serp_onpremise import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.spaces.list(q="te", limit=10, offset=5)
   json_response = response.json()
   print(json_response)

Get Space by id
~~~~~~~~~~~~~~~

**Authorized Client() required.**

This method returns space info, if found by its id.

.. code:: python

   from serp_onpremise import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.spaces.get(id=1)
   json_response = response.json()
   print(json_response)

Update Space by id
~~~~~~~~~~~~~~~~~~

**Authorized Client() required.**

This method updates space info, if found by its id.

.. code:: python

   from serp_onpremise import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.spaces.update(id=1, name="newname")
   json_response = response.json()
   print(json_response)

Delete Space by id
~~~~~~~~~~~~~~~~~~

**Authorized Client() required.**

This method deletes space, if found by its id.

.. code:: python

   from serp_onpremise import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.spaces.delete(id=1)
   if response.status_code == 204:
       # NOTE: There is empty response in case of successful operation
       print("Space deleted successfully.")

Create Token for specified Space
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Authorized Client() required.**

This method creates new token for space, if found by its id. You can
create temporary or permanent token as with any other type of tokens.

.. code:: python

   from serp_onpremise import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.spaces.token(id=1, permanent=True)
   json_response = response.json()
   print(json_response)
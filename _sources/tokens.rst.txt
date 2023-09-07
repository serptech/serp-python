Tokens
======

Basic concepts
~~~~~~~~~~~~~~

Tokens are used to authorize API calls from clients.

There are account, space, access, stream & root tokens.

Platform will know which type of token you’re referring to by looking at
api_token that is in your Client() instance.

You can have temporary (24 hours) or permanent token. Recommended way is
to always use temporary tokens inside your applications and rotate them
periodically.

Create Token
~~~~~~~~~~~~

**Authorized Client() required.**

This method creates new temporary or permanent token.

.. code:: python

   from serp import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.tokens.access.create(permanent=True)
   json_response = response.json()
   print(json_response)

List Tokens
~~~~~~~~~~~

**Authorized Client() required.**

This method returns paginated list of tokens. Can be filtered by
permanence of tokens.

.. code:: python

   from serp import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.tokens.access.list(permanent=False, limit=10, offset=5)
   json_response = response.json()  # if response is 200, this is list of dicts
   print(json_response)

Get Token by id
~~~~~~~~~~~~~~~

**Authorized Client() required.**

This method returns token info, if found by its id.

.. code:: python

   from serp import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.tokens.access.get(token_id_or_key=1)
   json_response = response.json()
   print(json_response)

Update Token by id
~~~~~~~~~~~~~~~~~~

**Authorized Client() required.**

This method updates token info, if found by its id.

.. code:: python

   from serp import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   response = c.tokens.access.update(token_id_or_key=1, is_active=False)
   json_response = response.json()
   print(json_response)

Delete Token by id
~~~~~~~~~~~~~~~~~~

**Authorized Client() required.**

This method deletes token, if found by its id.

.. code:: python

   from serp import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   # NOTE: There is empty response in case of successful operation
   response = c.tokens.access.delete(token_id_or_key=1)
   if response.status_code == 204:
       print("Token deleted successfully.")

Delete List of Tokens
~~~~~~~~~~~~~~~~~~~~~

**Authorized Client() required.**

This method deletes many tokens, if found by permanent filter.

Rules of this filter are:

-  False - deletes only temporary tokens
-  True - deletes only permanent tokens
-  None - deletes all tokens

.. code:: python

   from serp import Client

   c = Client(api_token="abcd", base_url="http://localhost:8080")
   # NOTE: There is empty response in case of successful operation
   response = c.tokens.access.delete_list(permanent=False)
   if response.status_code == 204:
       print("Tokens deleted successfully.")
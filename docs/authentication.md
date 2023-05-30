## Authentication

### Basic concepts

Some things to note about access tokens:

1. In order to access API, you need valid token.
2. Valid token is the one, that is currently active & not expired.
3. Tokens could be temporary & permanent (those do not expire automatically).
4. As of now, all temporary tokens have the same TTL of 24 hours since creation time.

### Register

If you use root token, you can create new users.

```python
from serp_onpremise import Client

c = Client(base_url="http://localhost:8080", api_token="root_token")
register_response = c.auth.register(username="usr", password="pwd")
json_register_response = register_response.json()

if register_response.status_code == 200:
    print("Register Successful.")
    print(json_register_response)
    # {'id': 10, 'username': 'bv'}
else:
    print("Register failed.")
    print(json_register_response)
    # {'detail': [{'loc': ['body', 'username'],
    #    'msg': 'user with such username already exists',
    #    'code': 13}]}


```

### Login

This method creates new temporary token for user if username/password pair is correct.

```python
from serp_onpremise import Client

c = Client(base_url="http://localhost:8080")
login_response = c.auth.token(username="usr", password="pwd")
json_login_response = login_response.json()

if login_response.status_code == 200:
    print("Login Successful.")
    print(json_login_response)
    # {'access_token': 'e17fcdde8105c68be1d94749e3613372d6b5d3769e36c6034a4dee6a3d862ecb42b456f100a9880737783327d26ff87af9cd3d99a438e0218d5d41f350c8aa40',
    #  'token_type': 'Token',
    #  'expires_in': 86399,
    #  'token_meta': {'id': 20,
    #   'created': '2023-02-25T18:17:09.225708+00:00',
    #   'expires': '2023-02-26T18:17:09.225712+00:00',
    #   'is_active': True,
    #   'last_accessed_timestamp': None,
    #   'last_accessed_sender_uid': ''},
    #  'user_meta': {'id': 2,
    #   'username': 'ab',
    #   'created': '2022-08-31T13:12:24.770236+00:00'}}

else:
    print("Login failed.")
    print(json_login_response)
    # {'detail': [{'loc': ['body'],
    # 'msg': 'incorrect username or password',
    # 'code': 33}]}

```

After that you need to re-create Client instance with as so:

```python
from serp_onpremise import Client

client = Client(
    api_token=json_login_response["token"]["key"],
    base_url="http://localhost:8080"
)

# From now on, use this new client instance whenever you access API
```

### Change password

Given correct current password, this method allows you to specify new password & optionally reset all tokens that were previously created.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
response = c.auth.password_change(
    old_password="pwd",
    new_password="newpwd"
)
json_response = response.json()

if response.status_code == 204:
    print("Password change successful.")
else:
    print("Password change failed.")
    print(json_response)
    # {
    #     'error_codes': [400],
    #     'message': 'Validation error.',
    #     'fields': [
    #         {
    #             'name': 'old_password',
    #             'message': 'Incorrect password.',
    #             'error_code': 400
    #         }
    #     ]
    # }

```

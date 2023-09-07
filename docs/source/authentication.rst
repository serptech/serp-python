Авторизация
===========

Базовые принципы
~~~~~~~~~~~~~~~~

Токены доступа:

1. Для доступа к API вам необходим валидный токен.
2. Валидный токен это активный, не просроченный токен.
3. Токен может быть временный или постоянный.
4. As of now, all temporary tokens have the same TTL of 24 hours since
   creation time.

Регистрация
~~~~~~~~

Если вы используете root токен, то вы можете создавать пользователей.

.. code:: python

   from serp import Client

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

Авторизация
~~~~~

Этот метод создает новый временный token для пользователя, если пара логин, пароль верная.

.. code:: python

   from serp import Client

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

После этого вы можете создавать инстанс клиента: 

.. code:: python

   from serp import Client

   client = Client(
       api_token=json_login_response["token"]["key"],
       base_url="http://localhost:8080"
   )

   # From now on, use this new client instance whenever you access API

Изменение пароля
~~~~~~~~~~~~~~~

Этот метод позволяет вам задать новый пароль и сбросить все выпущенные до этого момента токены пользователя.

.. code:: python

   from serp import Client

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

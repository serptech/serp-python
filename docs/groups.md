## Person Groups

### Basic concepts

You can group profiles into arbitrary lists.
Each profile can be added to any number of groups.

### Create Profile Group

**Authorized Client() required.**

This method creates new person group.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
response = c.groups_profiles.create(name="test")
json_response = response.json()
```

### List Profile Groups

**Authorized Client() required.**

This method returns paginated list of groups.

Can be filtered by name using `q`.

All the filtering parameters in this call are optional, this example just shows every single option.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
response = c.groups_profiles.list(
    q="te",
    person_ids_include=["abcdef01-abcd-abcd01-abcdef01"],
    person_ids_exclude=["fedcab10-dcba-dcba10-fedcab10"],
    groups_ids=[1, 2, 3],
    spaces_ids=[4, 5, 6],
    limit=10,
    offset=5
)
json_response = response.json()
```

### Get Profile Group by id

**Authorized Client() required.**

This method returns group info, if found by its id.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
response = c.groups_profiles.get(id=1)
json_response = response.json()
```

### Update Profile Group by id

**Authorized Client() required.**

This method updates group info, if found by its id.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
response = c.groups_profiles.update(id=1, name="newname")
json_response = response.json()
```

### Delete Profile Group by id

**Authorized Client() required.**

This method deletes group, if found by its id.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
response = c.groups_profiles.delete(id=1)
if response.status_code == 204:
    # NOTE: There is empty response in case of successful operation
    print("Person Group deleted successfully.")
```

### Get a list of profiles in a group

**Authorized Client() required.**

This method returns paginated results of persons that are in a group, if found by id.

You can filter out list by specifying exact list of person ids.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
response = c.groups_profiles.person_ids(
    id=1,
    person_ids=["abcdef01-abcd-abcd01-abcdef01"],
    limit=5,
    offset=0
)
json_response = response.json()
```

### Add profiles to groups

**Authorized Client() required.**

This method allows you to add many persons to many groups in one request.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
response = c.groups_profiles.add_person_ids(
    person_ids=["abcdef01-abcd-abcd01-abcdef01"],
    groups_ids=[1, 2, 3, 4, 5]
)
```

### Remove profiles to groups

**Authorized Client() required.**

This method allows you to remove many persons from many groups in one request.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
response = c.groups_profiles.remove_person_ids(
    person_ids=["abcdef01-abcd-abcd01-abcdef01"],
    groups_ids=[1, 2, 3, 4, 5]
)
```

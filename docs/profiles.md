## Profiles

### Basic concepts

Profiles are wrapped face embeddings that come through user uploads or automatically from connected cameras.
In fact, this is the similar "tag" as sources, but if the sources indicate where the photo came from,
then the profile is a tag indicating who is on it.

Entry types that are always associated with persons: new, reinit, exact, ha, junk.
The types of records nf, nm, det cannot be associated with persons,
since in this case the platform does not know who is in the photo.

Any work with profiles implies the automatic scope of the token with which the request is made.
When created, upon reinit, Entries and Profiles fall into the same space
where the origin specified in the request is located
(again, provided that this origin is visible from the current token space).

### Create Profile

**Authorized Client() required.**

This method creates (or finds, to avoid duplicates) person using provided photo.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
with open("image.png", "rb") as f:
    response = c.profiles.create(
        image=f,
        origin_id=1,
    )
json_response = response.json()
```

### Re-init Profile from provided photo

**Authorized Client() required.**

This method changes face embedding for a specified persons to the one, extracted from provided photo.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
with open("image.png", "rb") as f:
    response = c.profiles.reinit_by_photo(
        id="abcdef01-abcd-abcd01-abcdef01",
        image=f
    )
    # NOTE: There is empty response in case of successful operation
```

### Search Profile by provided photo

**Authorized Client() required.**

This method searches for a profile in database, comparing face embedding from provided photo.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
with open("image.png", "rb") as f:
    response = c.profiles.search(image=f, identify_asm=True)

json_response = response.json()
```

### Delete Profile by PID

**Authorized Client() required.**

This method deletes profile, if found by its id.

```python
from serp_onpremise import Client

c = Client(api_token="abcd", base_url="http://localhost:8080")
response = c.profiles.delete(id="abcdef01-abcd-abcd01-abcdef01")
if response.status_code == 204:
    # NOTE: There is empty response in case of successful operation
    print("Profile deleted successfully.")
```

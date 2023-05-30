## Entries

### Basic concepts

Entries are containers which store the results of the processing of a photo that was uploaded to the platform.
The source of the photo can be either the user (when they create or re-initialize a persona) or a surveillance camera that is connected to the platform via the preprocessing server.

When a user uploads a photo, two types of entries may appear in the platform: new and reinit.
When video streams from network cameras are processed, all types of entries can appear in the platform: new, reinit, exact, ha, junk, nm, nf and det.

### List Entries

**Authorized Client() required.**

This method returns paginated list of entries.

All the filtering parameters in this call are optional, this example just shows every single option.

```python
import datetime

from serp_onpremise import Client


c = Client(api_token="abcd", base_url="http://localhost:8080")
response = c.entries.list(
    person_ids=["abcdef01-abcd-abcd01-abcdef01"],
    conf=[1, 3, 5],
    age_from=1,
    age_to=100,
    sex=0,
    mood=["sad"],
    origin_ids=[1],
    spaces_ids=[1],
    date_from=datetime.datetime(year=2020, month=1, day=31),
    date_to=datetime.datetime.utcnow(),
    limit=10,
    offset=5
)
json_response = response.json()
print(json_response)
# {
#     'next': 'http://localhost:8080/v1/entries/?limit=20&offset=20',
#     'prev': None,
#     'data': [{
#        'id': 2,
#        'space_id': 2,
#        'origin_id': 1,
#        'person_id': 'c7111b45-c5cb-4c44-b097-5ede3584abe3',
#        'conf': 3,
#        'photo': '',
#        'created': '2022-09-06T08:52:01.581172+00:00',
#        'alive_probability': None,
#        'profile_photo': 'http://localhost:8080/static/mtmp1/c44385d1-ad78-481c-84ed-2cf3309f3852.png',
#        'distance': 100.0,
#        'exposure': 251369.71875,
#        'blur': 0.001,
#        'tilt': 18.51,
#        'pan': 8.53,
#        'age': 40,
#        'sex': 0,
#        'mood': "sad"
#     }]
# }
```

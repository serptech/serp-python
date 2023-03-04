## Common usage patterns

### Basic concepts

For any call you do, in response you'll get httpx response object.
So you can do anything with it as per [httpx docs](https://www.python-httpx.org/quickstart/).
You can parse response as json, read http status code, response headers and all that good stuff.

Note that responses are only of two kinds - successes (< 400) & errors (>= 400).
Please refer to the documentation of API for response format in each individual case.

Unlike successful responses, errors are always the same format which can be easily parsed.
Please refer to the documentation of API for errors format.

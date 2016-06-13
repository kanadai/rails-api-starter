## <a name="resource-user">User</a>

Stability: `prototype`

FIXME

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **email** | *string* | user email | `"example"` |
| **id** | *uuid* | unique identifier of user | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | unique name of user | `"example"` |
| **password** | *string* | user password | `"example"` |

### User Create

Create a new user.

```
POST /users
```


#### Curl Example

```bash
$ curl -n -X POST /users \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "email": "example",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "example",
  "password": "example"
}
```

### User Delete

Delete an existing user.

```
DELETE /users/{user_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE /users/$USER_ID \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "email": "example",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "example",
  "password": "example"
}
```

### User Info

Info for existing user.

```
GET /users/{user_id}
```


#### Curl Example

```bash
$ curl -n /users/$USER_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "email": "example",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "example",
  "password": "example"
}
```

### User List

List existing users.

```
GET /users
```


#### Curl Example

```bash
$ curl -n /users
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "email": "example",
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "name": "example",
    "password": "example"
  }
]
```

### User Update

Update an existing user.

```
PATCH /users/{user_id}
```


#### Curl Example

```bash
$ curl -n -X PATCH /users/$USER_ID \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "email": "example",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "example",
  "password": "example"
}
```



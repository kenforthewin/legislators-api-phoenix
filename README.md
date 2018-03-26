# legislators-api-phoenix

This is a Phoenix (Elixir) implementation of an example backend for [redux-remote-datatable](https://github.com/kenforthewin/react-redux-datatable).

## Setup

Ensure docker-compose is installed and docker daemon is running. Navigate to the project folder and run `docker-compose up`. The API should be available at `localhost:4000/api`.

1. Navigate to the project root and run `git clone git@github.com:unitedstates/congress-legislators.git`.
2. Exec into the Phoenix container with `docker-compose exec app bash`.
3. Seed the database with `mix run priv/repo/seeds.exs`.

Then, use the redux-remote-datatable as so:

```javascript
<DataTableRedux fields={{"Name": "official_name", "Birthday": "birthday", "Thomas ID": "thomas_id" }} ajax={"http://localhost:4000/api/legislators"} idField={"id"} />
```

## Endpoints

There is currently only one endpoint.

- `POST /api/legislators`

### Example Request

```json
{
  "draw": 1,
  "page": 1,
  "perPage": 10,
  "sortField": null,
  "sortDirection": "asc",
  "searchValue": ""
}
```

### Example Response

```json
{
    "draw": "1",
    "totalRecords": 473,
    "data": [
        {
            "id": 52,
            "official_name": "Roy Blunt",
            "thomas_id": "01464",
            "birthday": "1950-01-10"
        },
        {
            "id": 51,
            "official_name": "Richard Blumenthal",
            "thomas_id": "02076",
            "birthday": "1946-02-13"
        },
        ...
    ]
}
```
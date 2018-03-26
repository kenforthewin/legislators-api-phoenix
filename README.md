# legislators-api-phoenix

This is a Phoenix (Elixir) implementation of an example backend for [redux-remote-datatable](https://github.com/kenforthewin/react-redux-datatable).

## Usage

Ensure docker-compose is installed and docker daemon is running. Navigate to the project folder and run `docker-compose up`. The API should be available at `localhost:4000/api`.

Then, use the redux-remote-datatable as so:

```javascript
<DataTableRedux fields={{"Name": "official_name", "Birthday": "birthday", "Thomas ID": "thomas_id" }} ajax={"http://localhost:4000/api/legislators"} idField={"id"} />
```
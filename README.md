# SQL Example

A minimal repository for exxperimenting with POSTGRESQL using Docker.

## Running

To start the container:

```bash
./scripts/create-container.sh
```

To begin interacting with the container:

```bash
./scripts/attach-container.sh
```

## Docker commands (explained)

```bash
docker run --name example-db --mount type=bind,source="$(pwd)",dst="/code" -e POSTGRES_PASSWORD=password -d postgres
```

- `docker run` - start a container based on an image
- `--name example-db`- give the container a name for convenience
- `--mount type=bind,source="$(pwd)",dst="/code"` - connect the current working director (host machine) to the `/code` folder on the container
- `-e POSTGRES_PASSWORD=password` - give the container an **environment variable**
- `-d` - run the container behind the scenes
- `postgres` - the image to base it on

```bash
docker exec -it example-db psql -U postgres
```

- `docker exec` - execute a command in a **running** container
- `-it` - using an interactive terminal
- `example-db` - the name of the container
- `psql` - the command to run (`psql` lets you talk to POSTGRES databases)
- `-U postgres` - an argument to the `psql` command: the username
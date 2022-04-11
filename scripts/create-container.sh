docker run --name example-db --mount type=bind,source="$(pwd)",dst="/code" -e POSTGRES_PASSWORD=password -d postgres

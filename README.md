# plantuml

This is a docker image that contains plantuml.

The idea is that you mount a local folder to the container's `/app/input` and `/app/output`.
The default command runs a bash script `compile.sh` that will compile all files ending in .plantuml
found in the folder /app/input. 

If you override the docker command and call `./compile.sh <YOUR_ARGS>`, your args will be passed
to the command `java -jar /app/plantuml.jar <YOUR_ARGS> -o /app/output`. (You could also just override
the command altogether).

## Examples

Supposing you have a diagram.plantuml file in `/Users/dan/Documents/diagrams`. You can run this command:

```shell
docker run -it \
  --volume "/Users/dan/Documents/diagrams:/app/input" \
  --volume "/Users/dan/Documents/diagrams:/app/output" \
  dantheman39/plantuml
```

Or you can create a docker-compose file to simply run `docker-compose up`:

```yaml
version: "3.8"
services:
  plantuml:
    image: dantheman39/plantuml
    volumes:
        - "/Users/dan/Documents/diagrams:/app/input"
        - "/Users/dan/Documents/diagrams:/app/output"
```

You can override the command with whatever you want:

`docker-compose run plantuml java -jar plantuml.jar /app/input/mydiagram.plantuml`


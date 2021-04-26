# tcl-docker-client

Tcl module to talk to the Docker Engine API, generated from the OpenAPI description

## Alternatives

Consider using [tockler](https://github.com/efrecon/tockler) which has been around much longer and is hand-built.
This project generates its code from the OpenAPI description and so may not be as idiomatic 

## Examples

~~~tcl
package require docker

# Returns JSON
docker container list -all
~~~

## Requirements
- [rl_http](https://github.com/RubyLane/rl_http)
- [unix_sockets](https://github.com/cyanogilvie/unix_sockets)
- [rl_json](https://github.com/RubyLane/rl_json)
- [parse_args](https://guthub.com/RubyLane/parse_args)

# TcpServer

Running the application from local:
```
PORT=8888 iex -S mix
```
Connecting from client with:
```
telnet 127.0.0.1 8888
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `tcp_server` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tcp_server, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/tcp_server](https://hexdocs.pm/tcp_server).


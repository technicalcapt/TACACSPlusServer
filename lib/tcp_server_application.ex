defmodule TCPServerApplication do
  @moduledoc """
  Documentation for `TCPServer`.
  """

  use Application

  def start(_type, _args) do
    port = String.to_integer(System.get_env("PORT") || "8888")

    children = [
      {DynamicSupervisor, strategy: :one_for_one, name: TCPServer.DynamicSupervisor},
      {AcceptorServer, [port: port]}
    ]

    opts = [strategy: :one_for_one, name: TCPServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

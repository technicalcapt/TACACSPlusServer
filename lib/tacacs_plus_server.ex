defmodule TACACSPlusServer do
  require Logger

  @doc """
  Starts accepting connections on the given `port`.
  """
  def accept(port) do
    {:ok, socket} = :gen_tcp.listen(port, [:binary, active: :once, reuseaddr: true])

    Logger.info("Accepting connections on port #{port}")
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client_socket} = :gen_tcp.accept(socket)
    {:ok, pid} = DynamicSupervisor.start_child(TCPServer.DynamicSupervisor, {HandlerServer, [socket: client_socket]})
    :ok = :gen_tcp.controlling_process(client_socket, pid)
    loop_acceptor(socket)
  end
end

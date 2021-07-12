# defmodule TCPServer.DynamicSupervisor do
#   use DynamicSupervisor

#   def start_link(init_arg) do
#     DynamicSupervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
#   end

#   @impl true
#   def init(_init_arg) do
#     port = Application.get_env(:tcp_server, :port)
#     ip = Application.get_env(:tcp_server, :ip)

#     {:ok, listening_socket} = :gen_tcp.listen(port, [:binary, {:active, :once}, {:ip, ip}])
#     {:ok, socket} = :gen_tcp.accept(listening_socket)
#     {:ok, pid} = DynamicSupervisor.start_child(__MODULE__, {TACACSPlusServer, []})
#     :gen_tcp.controlling_process(socket, pid)

#     DynamicSupervisor.init(strategy: :one_for_one)
#   end
# end

defmodule HandlerServer do
  use GenServer

  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg, [])
  end

  @impl true
  def init(opts) do
    socket = Keyword.get(opts, :socket)

    {:ok, socket}
  end

  @impl true
  def handle_info({:tcp, socket, data}, state) do
    # Handle data from incoming socket
    IO.inspect(data, label: "incoming data:")
    :inet.setopts(socket, active: :once)
    :gen_tcp.send(socket, data)
    {:noreply, state}
  end

  @impl true
  def handle_info({:tcp_closed, socket}, _state) do
    # Handle tcp close socket
    {:noreply, socket}
  end

  @impl true
  def handle_info({:tcp_error, socket, _reason}, _state) do
    # Handle error
    {:noreply, socket}
  end

  @impl true
  def code_change(_old_vsn, new_state, _extra) do
    {:ok, new_state}
  end
end

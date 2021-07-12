defmodule AcceptorServer do
  use GenServer

  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  def init(init_arg) do
    port = Keyword.get(init_arg, :port, 8080)

    TACACSPlusServer.accept(port)

    {:ok, port}
  end
end

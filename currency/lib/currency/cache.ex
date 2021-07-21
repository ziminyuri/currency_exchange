defmodule Currency.Cache do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: CurrCache)
  end

  def init(state) do
    :ets.new(:currency_cache, [:set, :public, :named_table])
    {:ok, state}
  end

  def delete(key) do
    GenServer.cast(CurrCache, {:delete, key})
  end

  def get(key) do
    GenServer.call(CurrCache, {:get, key})
  end

  #Internal API

  def handle_call({:get, key}, _from, state) do
    :ets.lookup(:currency_cache, key)
  end

  def handle_cast({:delete, key}, state) do
    :ets.delete(:currency_cache, key)
    {:noreply, state}
  end

end
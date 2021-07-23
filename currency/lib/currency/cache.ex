defmodule Currency.Cache do
  use GenServer

  @name __MODULE__

  def start_link(_), do: GenServer.start_link(__MODULE__, [], name: @name)

  def init(_) do
    :ets.new(:cache, [:public, :named_table])
    Currency.JobScheduler.write_values()
    {:ok, "ETS Created"}
  end

  def insert(currencies) do
    for c <- currencies do
      :ets.insert(:cache, {c.code, c.name, c.value})
    end
  end

  def lookup(key), do: :ets.lookup(:cache, key)

  def all() do
    table = :ets.tab2list(:cache)

    case table do
      [] -> nil
      _ -> table
    end
  end

end
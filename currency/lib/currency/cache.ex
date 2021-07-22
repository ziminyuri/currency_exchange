defmodule Currency.Cache do
  use GenServer

  @name __MODULE__

  def start_link(_), do: GenServer.start_link(__MODULE__, [], name: @name)

  def init(_) do
    IO.puts("Creating ETS #{@name}")
    :ets.new(:cache, [:public, :named_table])
    Currency.JobScheduler.write_values()
    {:ok, "ETS Created"}
  end

  def insert(currencies) do
    #IO.puts("insert")
    for c <- currencies do
      #IO.puts("insert #{c.name} #{c.value}")
      :ets.insert(:cache, {c.code, c.name, c.value})
    end
  end

  def lookup(key), do: :ets.lookup(:cache, key)

  def all() do
    #IO.puts("all")
    table = :ets.tab2list(:cache)
    #IO.puts("all")

    case table do
      _ -> table
    end
  end

end
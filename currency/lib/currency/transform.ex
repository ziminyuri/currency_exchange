defmodule Currency.Transform do

  def from_cache_to_data(cache) do
    IO.puts "-------------cache----------------"
    IO.inspect cache

    # Warning говнокод
    list = [1]
    list = [1 | list]
    for item <- cache do
      IO.puts "-----------iter------------------"
      IO.inspect(item)
      temp_item = %{:code => elem(item, 0), :name => elem(item, 1), :value => elem(item, 2)}
      list = [1 | list]
      list = List.insert_at(list, 0, 0)
      #list = list ++ [temp_item]
      #Enum.concat(list, [temp_item])
      IO.inspect(temp_item)
      IO.puts "-----------iter------------------"
    end
    IO.inspect(list)
    IO.puts "-------------cache----------------"

  end

end
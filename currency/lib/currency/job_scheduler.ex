defmodule Currency.JobScheduler do
  use Quantum, otp_app: :currency

  #alias Currency.{Daily, Cache}

  def write_values() do
    IO.puts "-----------write_values------------------"
    result = Currency.Daily.get_currencies()
    IO.inspect result
    Currency.Cache.insert(result)
    IO.puts "-----------end write_values------------------"
  end
end
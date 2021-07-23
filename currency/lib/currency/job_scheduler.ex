defmodule Currency.JobScheduler do
  use Quantum, otp_app: :currency

  def write_values() do
    result = Currency.Daily.get_currencies()
    Currency.Cache.insert(result)
  end
end
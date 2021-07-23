defmodule Currency.JobScheduler do
  use Quantum, otp_app: :currency

  def write_values() do
    result = Currency.Daily.get_currencies()
    case result do
      {:ok, result} -> Currency.Cache.insert(result)
      :error -> nil
    end


  end
end
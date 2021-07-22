defmodule Currency.JobScheduler do
  use Quantum, otp_app: :currency

  def write_values() do
    IO.puts "-----------write_values------------------"
  end
end
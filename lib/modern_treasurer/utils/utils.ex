defmodule ModernTreasurer.Utils do
  def get_response_body({:ok, %{body: body}}) do
    body
  end

  def get_response_body({:error, _reason}) do
    nil
  end

  def get_response_body(_response) do
    nil
  end
end

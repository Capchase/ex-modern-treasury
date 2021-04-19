defmodule ExModernTreasury.Utils do
  def get_response_body({:ok, %{body: body}}) do
    body
  end
end

defmodule PlateSlate.Menu do
  @moduledoc """
  The Menu context.
  """

  import Ecto.Query
  alias PlateSlate.Repo

  alias PlateSlate.Menu.Item

  def list_items(%{matching: name}) when is_binary(name) do
    Item
    |> where([m], ilike(m.name, ^"%#{name}%"))
    |> Repo.all
  end

  def list_items(_) do
    Repo.all(Item)
  end
end

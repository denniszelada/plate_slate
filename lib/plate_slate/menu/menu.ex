defmodule PlateSlate.Menu do
    @moduledoc """
    The Menu context.
    """

    import Ecto.Query, warn: false
    alias PlateSlate.Repo

    def list_items(%{matching: name}) when is_binary(name) do
      Item
      |> where([m], ilike(m.name, ^"%#{name}%"))
      |> Repo.all
    end

    def list_items(_) do
      Repo.all(Item)
    end
end


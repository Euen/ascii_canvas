defmodule Canvas.Changeset do
  @moduledoc """
  Utilities for working with Ecto.Changest like custom validations
  or Changeset modifications.
  """
  import Ecto.Changeset

  alias Ecto.Changeset

  @doc """
  Validates that at least one of the `fields` are present in the Changeset.
  If not, it will add an error to the first of the fields in the list.
  """
  @spec validate_required_inclusion(Changeset.t(), [atom()]) :: Changeset.t()
  def validate_required_inclusion(changeset, fields) do
    if Enum.any?(fields, &present?(changeset, &1)) do
      changeset
    else
      # Add the error to the first field only since Ecto requires a field name for each error.
      add_error(changeset, hd(fields), "One of these fields must be present: #{inspect fields}")
    end
  end

  defp present?(changeset, field) do
    value = get_field(changeset, field)
    value && value != ""
  end
end

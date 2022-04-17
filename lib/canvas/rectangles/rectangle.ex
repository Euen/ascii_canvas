defmodule Canvas.Rectangles.Rectangle do
  use Ecto.Schema
  import Ecto.Changeset
  import Canvas.Changeset

  @type t :: %__MODULE__{
          x: integer(),
          y: integer(),
          fill_char: String.t(),
          height: integer(),
          outline_char: String.t(),
          width: integer()
        }

  schema "rectangles" do
    field :fill_char, :string
    field :height, :integer
    field :outline_char, :string
    field :width, :integer
    field :x, :integer
    field :y, :integer

    timestamps()
  end

  @allowed_attrs [:x, :y, :width, :height, :fill_char, :outline_char]
  @required_attrs [:x, :y, :width, :height]

  @doc false
  def changeset(rectangle, attrs) do
    rectangle
    |> cast(attrs, @allowed_attrs)
    |> validate_required(@required_attrs)
    |> validate_inclusion(:x, 0..(max_width() - 3))
    |> validate_inclusion(:y, 0..(max_height() - 3))
    |> validate_width()
    |> validate_height()
    |> validate_format(:outline_char, ~r/^[ -~]$/)
    |> validate_format(:fill_char, ~r/^[ -~]$/)
    |> validate_required_inclusion([:outline_char, :fill_char])
  end

  defp validate_width(%{changes: %{x: x_pos, width: width}} = changeset) do
    if width >= 3 and x_pos + width <= max_width() do
      changeset
    else
      add_error(changeset, :width, "invalid width")
    end
  end

  defp validate_width(changeset), do: changeset

  defp validate_height(%{changes: %{y: y_pos, height: height}} = changeset) do
    if height >= 3 and y_pos + height <= max_height() do
      changeset
    else
      add_error(changeset, :height, "invalid height")
    end
  end

  defp validate_height(changeset), do: changeset

  defp max_width(), do: Canvas.config([:canvas_max_width])
  defp max_height(), do: Canvas.config([:canvas_max_height])
end

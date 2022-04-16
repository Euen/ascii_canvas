defmodule Canvas.Rectangles.Rectangle do
  use Ecto.Schema
  import Ecto.Changeset

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
    |> validate_inclusion(:x, 0..max_width())
    |> validate_inclusion(:y, 0..max_height())
    |> validate_inclusion(:width, 0..max_width())
    |> validate_inclusion(:height, 0..max_height())
    |> validate_format(:outline_char, ~r/^[\\0-\x7f]{1}$/)
    |> validate_format(:fill_char, ~r/^[\\0-\x7f]{1}$/)
  end

  defp max_width(), do: Canvas.config([:canvas_max_width])
  defp max_height(), do: Canvas.config([:canvas_max_height])
end

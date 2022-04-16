defmodule Canvas do
  @moduledoc """
  Canvas keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Canvas.Rectangles
  alias Canvas.Rectangles.Rectangle

  @doc """
  It draw a rectangle in the canvas

  ## Attributes
  - `x` :integer, the horizontal position of the top right corner of the rectangle, **Required**
  - `y` :integer, the vertical position of the top right corner of the rectangle, **Required**
  - `width` :integer, the width of the rectangle, **Required**
  - `height` :integer, the height of the rectangle, **Required**
  - `fill_char` :string, the character to fill the rectangle with
  - `outline_char` :string, the character to draw the outline of the rectangle

  **Note:** Either `fill_char` or `outline_char` should be specifyed.
  """
  @spec draw_rectangle(map) :: {:ok, Rectangle.t()} | {:error, Ecto.Changeset.t()}
  defdelegate draw_rectangle(params), to: Rectangles, as: :create_rectangle

  @doc """
  It clear the canvas deleting all the drawings
  """
  @spec clear_canvas() :: :ok
  def clear_canvas() do
    Rectangles.delete_rectangles()
  end
  @doc """
  Looks up `Application` config or raises if keyspace is not configured.

  ## Examples

      config :canvas, :files, [
        uploads_dir: Path.expand("../priv/uploads", __DIR__),
        host: [scheme: "http", host: "localhost", port: 4000],
      ]

      iex> Canvas.config([:files, :uploads_dir])
      iex> Canvas.config([:files, :host, :port])
  """
  def config([main_key | rest] = keyspace) when is_list(keyspace) do
    main = Application.fetch_env!(:canvas, main_key)

    Enum.reduce(rest, main, fn next_key, current ->
      case Keyword.fetch(current, next_key) do
        {:ok, val} -> val
        :error -> raise ArgumentError, "no config found under #{inspect(keyspace)}"
      end
    end)
  end
end

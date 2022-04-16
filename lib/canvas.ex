defmodule Canvas do
  @moduledoc """
  Canvas keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Canvas.Rectangles

  @doc """
  It draw a rectangle in the canvas

  ## Attributes
  TODO

  """
  # @spec draw_rectangle(
  #         pos_integer(),
  #         pos_integer(),
  #         pos_integer(),
  #         pos_integer(),
  #         String.t(),
  #         String.t()
  #       ) :: {:ok, Rectangle.t()} || {:error, Ecto.Changeset.t()}
  def draw_rectangle(x, y, width, height, fill \\ nil, line \\ nil) do
    params = %{x: x, y: y, width: width, height: height, fill: fill, line: line}
    Rectangles.create_rectangle(params)
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

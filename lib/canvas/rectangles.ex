defmodule Canvas.Rectangles do
  @moduledoc """
  The Rectangles context.
  """

  import Ecto.Query, warn: false
  alias Canvas.Repo

  alias Canvas.Rectangles.Rectangle

  @doc """
  Returns the list of rectangles.

  ## Examples

      iex> list_rectangles()
      [%Rectangle{}, ...]

  """
  @spec list_rectangles() :: [Rectangle.t()]
  def list_rectangles do
    Repo.all(Rectangle)
  end

  @doc """
  Creates a Rectangle.

  ## Examples

      iex> create_rectangle(%{field: value})
      {:ok, %Rectangle{}}

      iex> create_rectangle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  @spec create_rectangle(map()) :: {:ok, Rectangle.t()} | {:error, Changeset.t()}
  def create_rectangle(attrs \\ %{}) do
    %Rectangle{}
    |> Rectangle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Deletes all the Rectangles.

  ## Examples

      iex> delete_rectangles()
      :ok

  """
  @spec delete_rectangles() :: :ok
  def delete_rectangles() do
    Repo.delete_all(Rectangle)
    :ok
  end
end

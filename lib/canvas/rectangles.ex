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
  def list_rectangles do
    Repo.all(Rectangle)
  end

  @doc """
  Gets a single Rectangle.

  Raises `Ecto.NoResultsError` if the Rectangle does not exist.

  ## Examples

      iex> get_rectangle!(123)
      %Rectangle{}

      iex> get_rectangle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rectangle!(id), do: Repo.get!(Rectangle, id)

  @doc """
  Creates a Rectangle.

  ## Examples

      iex> create_rectangle(%{field: value})
      {:ok, %Rectangle{}}

      iex> create_rectangle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rectangle(attrs \\ %{}) do
    %Rectangle{}
    |> Rectangle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a Rectangle.

  ## Examples

      iex> update_rectangle(Rectangle, %{field: new_value})
      {:ok, %Rectangle{}}

      iex> update_rectangle(Rectangle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rectangle(%Rectangle{} = rectangle, attrs) do
    rectangle
    |> Rectangle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Rectangle.

  ## Examples

      iex> delete_rectangle(Rectangle)
      {:ok, %Rectangle{}}

      iex> delete_rectangle(Rectangle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rectangle(%Rectangle{} = rectangle) do
    Repo.delete(rectangle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking Rectangle changes.

  ## Examples

      iex> change_rectangle(Rectangle)
      %Ecto.Changeset{data: %Rectangle{}}

  """
  def change_rectangle(%Rectangle{} = rectangle, attrs \\ %{}) do
    Rectangle.changeset(rectangle, attrs)
  end
end

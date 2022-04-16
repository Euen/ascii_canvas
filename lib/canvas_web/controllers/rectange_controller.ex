defmodule CanvasWeb.RectangleController do
  use CanvasWeb, :controller

  alias Canvas.Rectangles
  alias Canvas.Rectangles.Rectangle

  def index(conn, _params) do
    rectangles = Rectangles.list_rectangles()
    render(conn, "index.html", rectangles: rectangles)
  end

  # def new(conn, _params) do
  #   changeset = Rectangles.change_rectangle(%Rectangle{})
  #   render(conn, "new.html", changeset: changeset)
  # end

  # def create(conn, %{"Rectangle" => Rectangle_params}) do
  #   case Rectangles.create_rectangle(Rectangle_params) do
  #     {:ok, Rectangle} ->
  #       conn
  #       |> put_flash(:info, "Rectangle created successfully.")
  #       |> redirect(to: Routes.Rectangle_path(conn, :show, Rectangle))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end

  # def show(conn, %{"id" => id}) do
  #   Rectangle = Rectangles.get_rectangle!(id)
  #   render(conn, "show.html", Rectangle: Rectangle)
  # end

  # def edit(conn, %{"id" => id}) do
  #   Rectangle = Rectangles.get_rectangle!(id)
  #   changeset = Rectangles.change_rectangle(Rectangle)
  #   render(conn, "edit.html", Rectangle: Rectangle, changeset: changeset)
  # end

  # def update(conn, %{"id" => id, "Rectangle" => Rectangle_params}) do
  #   Rectangle = Rectangles.get_rectangle!(id)

  #   case Rectangles.update_rectangle(Rectangle, Rectangle_params) do
  #     {:ok, Rectangle} ->
  #       conn
  #       |> put_flash(:info, "Rectangle updated successfully.")
  #       |> redirect(to: Routes.Rectangle_path(conn, :show, Rectangle))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "edit.html", Rectangle: Rectangle, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   Rectangle = Rectangles.get_rectangle!(id)
  #   {:ok, _rectangle} = Rectangles.delete_rectangle(Rectangle)

  #   conn
  #   |> put_flash(:info, "Rectangle deleted successfully.")
  #   |> redirect(to: Routes.Rectangle_path(conn, :index))
  # end
end

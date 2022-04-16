defmodule CanvasWeb.RectangleControllerTest do
  use CanvasWeb.ConnCase

  import Canvas.RectanglesFixtures

  @create_attrs %{fill_char: "some fill_char", height: 42, outline_char: "some outline_char", width: 42, x: 42, y: 42}
  @update_attrs %{fill_char: "some updated fill_char", height: 43, outline_char: "some updated outline_char", width: 43, x: 43, y: 43}
  @invalid_attrs %{fill_char: nil, height: nil, outline_char: nil, width: nil, x: nil, y: nil}

  describe "index" do
    test "lists all rectangles", %{conn: conn} do
      conn = get(conn, Routes.Rectangle_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Rectangles"
    end
  end

  describe "new Rectangle" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.Rectangle_path(conn, :new))
      assert html_response(conn, 200) =~ "New Rectangle"
    end
  end

  describe "create Rectangle" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.Rectangle_path(conn, :create), Rectangle: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.Rectangle_path(conn, :show, id)

      conn = get(conn, Routes.Rectangle_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Rectangle"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.Rectangle_path(conn, :create), Rectangle: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Rectangle"
    end
  end

  describe "edit Rectangle" do
    setup [:create_rectangle]

    test "renders form for editing chosen Rectangle", %{conn: conn, Rectangle: Rectangle} do
      conn = get(conn, Routes.Rectangle_path(conn, :edit, Rectangle))
      assert html_response(conn, 200) =~ "Edit Rectangle"
    end
  end

  describe "update Rectangle" do
    setup [:create_rectangle]

    test "redirects when data is valid", %{conn: conn, Rectangle: Rectangle} do
      conn = put(conn, Routes.Rectangle_path(conn, :update, Rectangle), Rectangle: @update_attrs)
      assert redirected_to(conn) == Routes.Rectangle_path(conn, :show, Rectangle)

      conn = get(conn, Routes.Rectangle_path(conn, :show, Rectangle))
      assert html_response(conn, 200) =~ "some updated fill_char"
    end

    test "renders errors when data is invalid", %{conn: conn, Rectangle: Rectangle} do
      conn = put(conn, Routes.Rectangle_path(conn, :update, Rectangle), Rectangle: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Rectangle"
    end
  end

  describe "delete Rectangle" do
    setup [:create_rectangle]

    test "deletes chosen Rectangle", %{conn: conn, Rectangle: Rectangle} do
      conn = delete(conn, Routes.Rectangle_path(conn, :delete, Rectangle))
      assert redirected_to(conn) == Routes.Rectangle_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.Rectangle_path(conn, :show, Rectangle))
      end
    end
  end

  defp create_rectangle(_) do
    Rectangle = rectangle_fixture()
    %{Rectangle: Rectangle}
  end
end

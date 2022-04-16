defmodule Canvas.Repo.Migrations.CreateRectangles do
  use Ecto.Migration

  def change do
    create table(:rectangles) do
      add :x, :integer, null: false
      add :y, :integer, null: false
      add :width, :integer, null: false
      add :height, :integer, null: false
      add :fill_char, :string
      add :outline_char, :string

      timestamps()
    end
  end
end

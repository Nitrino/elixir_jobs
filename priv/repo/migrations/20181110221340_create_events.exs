defmodule ElixirJobs.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :place, :string
      add :begin_date, :naive_datetime
      add :link, :string
      add :logo, :string
      add :is_approved, :boolean, default: false, null: false

      timestamps()
    end

  end
end

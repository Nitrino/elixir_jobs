defmodule ElixirJobs.Repo.Migrations.CreateOffers do
  use Ecto.Migration

  def change do
    create table(:offers) do
      add :title, :string
      add :description, :text
      add :city, :string
      add :company, :string
      add :job_type, :string
      add :job_place, :string
      add :contacts, :text
      add :salary, :string
      add :is_approved, :boolean, default: false, null: false

      timestamps()
    end

  end
end

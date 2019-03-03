defmodule ElixirJobs.Repo.Migrations.CreateOffers do
  use Ecto.Migration

  alias ElixirJobs.EctoEnums.JobType
  alias ElixirJobs.EctoEnums.JobPlace

  def change do
    JobType.create_type()
    JobPlace.create_type()

    create table(:offers) do
      add :title, :string
      add :description, :text
      add :city, :string
      add :company, :string
      add :job_type, JobType.type()
      add :job_place, JobPlace.type()
      add :contacts, :text
      add :salary, :string
      add :is_approved, :boolean, default: false, null: false

      timestamps()
    end
  end
end

defmodule ElixirJobs.Offers.Offer do
  use Ecto.Schema
  import Ecto.Changeset

  alias ElixirJobs.EctoEnums.JobType
  alias ElixirJobs.EctoEnums.JobPlace

  schema "offers" do
    field :city, :string
    field :company, :string
    field :contacts, :string
    field :description, :string
    field :is_approved, :boolean, default: false
    field :job_place, JobPlace
    field :job_type, JobType
    field :salary, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(offer, attrs) do
    offer
    |> cast(attrs, [:title, :description, :city, :company, :job_type, :job_place, :contacts, :salary, :is_approved])
    |> validate_required([
      :title,
      :description,
      :city,
      :company,
      :job_type,
      :job_place,
      :contacts,
      :salary,
      :is_approved
    ])
  end
end

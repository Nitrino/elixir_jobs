defmodule ElixirJobs.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset


  schema "events" do
    field :begin_date, :naive_datetime
    field :is_approved, :boolean, default: false
    field :link, :string
    field :logo, :string
    field :place, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :place, :begin_date, :link, :logo, :is_approved])
    |> validate_required([:title, :place, :begin_date, :link, :logo, :is_approved])
  end
end

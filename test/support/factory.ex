defmodule ElixirJobs.Factory do
  use ExMachina.Ecto, repo: ElixirJobs.Repo

  alias ElixirJobs.Offers.Offer

  def offer_factory do
    %Offer{
      title: sequence(:title, &"Elixir Backend Developer #{&1}"),
      description: "We are looking for a developer who will help us build and maintain our backend applications.",
      city: "Moscow",
      company: "Warp technology",
      job_type: :full_time,
      job_place: :remote,
      contacts: sequence("Email: email#{1}@example.com"),
      salary: "From 200k Net",
      is_approved: false
    }
  end
end

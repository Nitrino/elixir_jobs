defmodule ElixirJobsWeb.OfferView do
  use ElixirJobsWeb, :view

  def format_date(inserted_at) do
    Timex.format!(inserted_at, "%d %b %Y", :strftime)
  end
end

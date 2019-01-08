defmodule ElixirJobs.Offers.Queries.Offer do
  import Ecto.Query, warn: false

  def order_id_desc(query) do
    from f in query,
      order_by: [desc: f.id]
  end

  def approved(query) do
    from f in query,
      where: [is_approved: true]
  end
end

defmodule ElixirJobsWeb.OfferController do
  use ElixirJobsWeb, :controller

  alias ElixirJobs.Offers
  alias ElixirJobs.Events
  alias ElixirJobs.Offers.Offer

  def index(conn, _params) do
    offers = Offers.list_offers()
    events = Events.list_events()
    render(conn, "index.html", offers: offers, events: events)
  end

  def new(conn, _params) do
    changeset = Offers.change_offer(%Offer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"offer" => offer_params}) do
    case Offers.create_offer(offer_params) do
      {:ok, offer} ->
        conn
        |> put_flash(:info, "Offer created successfully.")
        |> redirect(to: Routes.offer_path(conn, :show, offer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    offer = Offers.get_offer!(id)
    render(conn, "show.html", offer: offer)
  end

  def edit(conn, %{"id" => id}) do
    offer = Offers.get_offer!(id)
    changeset = Offers.change_offer(offer)
    render(conn, "edit.html", offer: offer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "offer" => offer_params}) do
    offer = Offers.get_offer!(id)

    case Offers.update_offer(offer, offer_params) do
      {:ok, offer} ->
        conn
        |> put_flash(:info, "Offer updated successfully.")
        |> redirect(to: Routes.offer_path(conn, :show, offer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", offer: offer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    offer = Offers.get_offer!(id)
    {:ok, _offer} = Offers.delete_offer(offer)

    conn
    |> put_flash(:info, "Offer deleted successfully.")
    |> redirect(to: Routes.offer_path(conn, :index))
  end
end

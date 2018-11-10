defmodule ElixirJobsWeb.OfferControllerTest do
  use ElixirJobsWeb.ConnCase

  alias ElixirJobs.Offers

  @create_attrs %{city: "some city", company: "some company", contacts: "some contacts", description: "some description", is_approved: true, job_place: "some job_place", job_type: "some job_type", salary: "some salary", title: "some title"}
  @update_attrs %{city: "some updated city", company: "some updated company", contacts: "some updated contacts", description: "some updated description", is_approved: false, job_place: "some updated job_place", job_type: "some updated job_type", salary: "some updated salary", title: "some updated title"}
  @invalid_attrs %{city: nil, company: nil, contacts: nil, description: nil, is_approved: nil, job_place: nil, job_type: nil, salary: nil, title: nil}

  def fixture(:offer) do
    {:ok, offer} = Offers.create_offer(@create_attrs)
    offer
  end

  describe "index" do
    test "lists all offers", %{conn: conn} do
      conn = get(conn, Routes.offer_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Offers"
    end
  end

  describe "new offer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.offer_path(conn, :new))
      assert html_response(conn, 200) =~ "New Offer"
    end
  end

  describe "create offer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.offer_path(conn, :create), offer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.offer_path(conn, :show, id)

      conn = get(conn, Routes.offer_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Offer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.offer_path(conn, :create), offer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Offer"
    end
  end

  describe "edit offer" do
    setup [:create_offer]

    test "renders form for editing chosen offer", %{conn: conn, offer: offer} do
      conn = get(conn, Routes.offer_path(conn, :edit, offer))
      assert html_response(conn, 200) =~ "Edit Offer"
    end
  end

  describe "update offer" do
    setup [:create_offer]

    test "redirects when data is valid", %{conn: conn, offer: offer} do
      conn = put(conn, Routes.offer_path(conn, :update, offer), offer: @update_attrs)
      assert redirected_to(conn) == Routes.offer_path(conn, :show, offer)

      conn = get(conn, Routes.offer_path(conn, :show, offer))
      assert html_response(conn, 200) =~ "some updated city"
    end

    test "renders errors when data is invalid", %{conn: conn, offer: offer} do
      conn = put(conn, Routes.offer_path(conn, :update, offer), offer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Offer"
    end
  end

  describe "delete offer" do
    setup [:create_offer]

    test "deletes chosen offer", %{conn: conn, offer: offer} do
      conn = delete(conn, Routes.offer_path(conn, :delete, offer))
      assert redirected_to(conn) == Routes.offer_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.offer_path(conn, :show, offer))
      end
    end
  end

  defp create_offer(_) do
    offer = fixture(:offer)
    {:ok, offer: offer}
  end
end

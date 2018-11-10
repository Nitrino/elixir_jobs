defmodule ElixirJobs.OffersTest do
  use ElixirJobs.DataCase

  alias ElixirJobs.Offers

  describe "offers" do
    alias ElixirJobs.Offers.Offer

    @valid_attrs %{city: "some city", company: "some company", contacts: "some contacts", description: "some description", is_approved: true, job_place: "some job_place", job_type: "some job_type", salary: "some salary", title: "some title"}
    @update_attrs %{city: "some updated city", company: "some updated company", contacts: "some updated contacts", description: "some updated description", is_approved: false, job_place: "some updated job_place", job_type: "some updated job_type", salary: "some updated salary", title: "some updated title"}
    @invalid_attrs %{city: nil, company: nil, contacts: nil, description: nil, is_approved: nil, job_place: nil, job_type: nil, salary: nil, title: nil}

    def offer_fixture(attrs \\ %{}) do
      {:ok, offer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Offers.create_offer()

      offer
    end

    test "list_offers/0 returns all offers" do
      offer = offer_fixture()
      assert Offers.list_offers() == [offer]
    end

    test "get_offer!/1 returns the offer with given id" do
      offer = offer_fixture()
      assert Offers.get_offer!(offer.id) == offer
    end

    test "create_offer/1 with valid data creates a offer" do
      assert {:ok, %Offer{} = offer} = Offers.create_offer(@valid_attrs)
      assert offer.city == "some city"
      assert offer.company == "some company"
      assert offer.contacts == "some contacts"
      assert offer.description == "some description"
      assert offer.is_approved == true
      assert offer.job_place == "some job_place"
      assert offer.job_type == "some job_type"
      assert offer.salary == "some salary"
      assert offer.title == "some title"
    end

    test "create_offer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Offers.create_offer(@invalid_attrs)
    end

    test "update_offer/2 with valid data updates the offer" do
      offer = offer_fixture()
      assert {:ok, %Offer{} = offer} = Offers.update_offer(offer, @update_attrs)
      assert offer.city == "some updated city"
      assert offer.company == "some updated company"
      assert offer.contacts == "some updated contacts"
      assert offer.description == "some updated description"
      assert offer.is_approved == false
      assert offer.job_place == "some updated job_place"
      assert offer.job_type == "some updated job_type"
      assert offer.salary == "some updated salary"
      assert offer.title == "some updated title"
    end

    test "update_offer/2 with invalid data returns error changeset" do
      offer = offer_fixture()
      assert {:error, %Ecto.Changeset{}} = Offers.update_offer(offer, @invalid_attrs)
      assert offer == Offers.get_offer!(offer.id)
    end

    test "delete_offer/1 deletes the offer" do
      offer = offer_fixture()
      assert {:ok, %Offer{}} = Offers.delete_offer(offer)
      assert_raise Ecto.NoResultsError, fn -> Offers.get_offer!(offer.id) end
    end

    test "change_offer/1 returns a offer changeset" do
      offer = offer_fixture()
      assert %Ecto.Changeset{} = Offers.change_offer(offer)
    end
  end
end

defmodule ElixirJobs.EventsTest do
  use ElixirJobs.DataCase

  alias ElixirJobs.Events

  describe "events" do
    alias ElixirJobs.Events.Event

    @valid_attrs %{begin_date: ~N[2010-04-17 14:00:00], is_approved: true, link: "some link", logo: "some logo", place: "some place", title: "some title"}
    @update_attrs %{begin_date: ~N[2011-05-18 15:01:01], is_approved: false, link: "some updated link", logo: "some updated logo", place: "some updated place", title: "some updated title"}
    @invalid_attrs %{begin_date: nil, is_approved: nil, link: nil, logo: nil, place: nil, title: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Events.create_event(@valid_attrs)
      assert event.begin_date == ~N[2010-04-17 14:00:00]
      assert event.is_approved == true
      assert event.link == "some link"
      assert event.logo == "some logo"
      assert event.place == "some place"
      assert event.title == "some title"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, %Event{} = event} = Events.update_event(event, @update_attrs)
      assert event.begin_date == ~N[2011-05-18 15:01:01]
      assert event.is_approved == false
      assert event.link == "some updated link"
      assert event.logo == "some updated logo"
      assert event.place == "some updated place"
      assert event.title == "some updated title"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end

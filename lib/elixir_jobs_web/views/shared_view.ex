defmodule ElixirJobsWeb.SharedView do
  use ElixirJobsWeb, :view

  alias ElixirJobsWeb.OfferController
  alias ElixirJobsWeb.PageController

  import Phoenix.Controller, only: [controller_module: 1, action_name: 1]

  def show_new_offer_button(conn) do
    case {controller_module(conn), action_name(conn)} do
      {OfferController, :index} -> true
      {PageController, :about} -> true
      _ -> false
    end
  end
end

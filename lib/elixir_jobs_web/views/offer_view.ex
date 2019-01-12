defmodule ElixirJobsWeb.OfferView do
  use ElixirJobsWeb, :view

  alias ElixirJobsWeb.OfferController

  import Phoenix.Controller, only: [controller_module: 1, action_name: 1]
  import Scrivener.HTML

  def format_date(inserted_at) do
    Timex.format!(inserted_at, "%d %b %Y", :strftime)
  end

  def show_is_approved_checkbox(conn) do
    case {controller_module(conn), action_name(conn)} do
      {OfferController, :edit} -> true
      _ -> false
    end
  end
end

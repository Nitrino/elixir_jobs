defmodule ElixirJobsWeb.EventView do
  use ElixirJobsWeb, :view

  alias ElixirJobsWeb.EventController

  import Phoenix.Controller, only: [controller_module: 1, action_name: 1]

  def format_begin_date(begin_date) do
    Timex.format!(begin_date, "%d %B %Y", :strftime)
  end
  def format_begin_time(begin_date) do
    Timex.format!(begin_date, "%H:%M", :strftime)
  end

  def show_is_approved_checkbox(conn) do
    case {controller_module(conn), action_name(conn)} do
      {EventController, :edit} -> true
      _ -> false
    end
  end
end

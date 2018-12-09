defmodule ElixirJobsWeb.EventView do
  use ElixirJobsWeb, :view

  def format_begin_date(begin_date) do
    Timex.format!(begin_date, "%d %B %Y", :strftime)
  end
  def format_begin_time(begin_date) do
    Timex.format!(begin_date, "%H:%M", :strftime)
  end
end

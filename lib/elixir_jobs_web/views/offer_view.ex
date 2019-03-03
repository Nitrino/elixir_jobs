defmodule ElixirJobsWeb.OfferView do
  use ElixirJobsWeb, :view

  alias ElixirJobsWeb.OfferController
  alias ElixirJobs.EctoEnums.JobPlace
  alias ElixirJobs.EctoEnums.JobType

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

  def job_type_options do
    Enum.map(JobType.__enum_map__(), &{job_type_name(&1), &1})
  end

  def job_place_options do
    Enum.map(JobPlace.__enum_map__(), &{job_place_name(&1), &1})
  end

  defp job_type_name(job_type) do
    case job_type do
      :full_time -> gettext("full_time")
      :part_time -> gettext("part_time")
      :freelance -> gettext("freelance")
    end
  end

  defp job_place_name(job_place) do
    case job_place do
      :onsite -> gettext("onsite")
      :remote -> gettext("remote")
      :both -> gettext("both")
    end
  end
end

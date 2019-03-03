defmodule ElixirJobs.EctoEnums do
  @moduledoc """
  Module with all the enums used in the database level.
  """

  import EctoEnum

  defenum(JobType, :job_type, [:full_time, :part_time, :freelance])
  defenum(JobPlace, :job_place, [:onsite, :remote, :both])
end

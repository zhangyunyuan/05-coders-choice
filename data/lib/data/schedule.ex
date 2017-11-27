defmodule Data.Schedule do
    use Ecto.Schema

    schema "Schedule" do
        field :weekday, :string
        field :doctor_name, :string
        field :patient_name, :string
        field :status, :string
    end

    def changeset(schedule, params \\ %{}) do
        schedule
        |> Ecto.Changeset.cast(params, [:weekday, :doctor_name, :patient_name, :status])
        |> Ecto.Changeset.validate_required([:weekday, :doctor_name, :patient_name, :status])
    end
end
defmodule Data.Impl do 
    import Ecto.Query

    def verify_doctor(username, password) do
        Data.Doctor
        |> Data.Repo.get_by(username: username, password: password)
    end

    def verify_patient(username, password) do
        Data.Patient
        |> Data.Repo.get_by(username: username, password: password)
    end

    def doctor_check_schedule(username) do
        Data.Schedule
        |> Ecto.Query.where(doctor_name: ^username)
        |> Data.Repo.all()
    end

    def patient_check_schedule(username) do
        Data.Schedule
        |>Ecto.Query.where(patient_name: ^username)
        |> Data.Repo.all()
    end

    def get_doctors() do
        query = from d in "Doctors", 
                select: d.username
        Data.Repo.all(query)
    end

    def display_available_schedule(doctor_name) do
        query = from s in "Schedule",
                where: s.doctor_name == ^doctor_name and s.status == "Available",
                select: {s.weekday, s.doctor_name, s.status}
        Data.Repo.all(query)
    end

    def update_schedule(patient_name, desired_weekday, doctor_name) do
        schedule = Data.Schedule |> Data.Repo.get_by(doctor_name: doctor_name, weekday: desired_weekday)
        changeset = Data.Schedule.changeset(schedule, %{patient_name: patient_name, status: "Booked"})
        Data.Repo.update(changeset)
    end
    
end
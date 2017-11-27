defmodule CASTest do
  use ExUnit.Case
  doctest CAS

  test "patient login" do
    assert true == CAS.Users.Patients.patients_login("Dorian", "123")
    assert false == CAS.Users.Patients.patients_login("Dorian", "12")
  end

  test "doctor login" do
    assert true == CAS.Users.Doctors.doctors_login("Zhang", "12345")
    assert true == CAS.Users.Doctors.doctors_login("Yunyuan", "54321")
    assert false == CAS.Users.Doctors.doctors_login("zhangyy", "12345")
  end

  test "doctor check schedule" do
    CAS.Users.Doctors.doctors_login("Zhang", "12345")
    result = [%Data.Schedule{__meta__: %Ecto.Schema.Metadata{context: nil, source: {nil, "Schedule"}, state: :loaded}, 
            doctor_name: "Zhang", id: 1, patient_name: "Dorian", status: "Booked", weekday: "Monday"}, 
            %Data.Schedule{__meta__: %Ecto.Schema.Metadata{context: nil, source: {nil, "Schedule"}, state: :loaded}, doctor_name: "Zhang", id: 2, patient_name: "", status: "Available", weekday: "Tuesday"}]
    assert  result == CAS.Users.Doctors.doctors_check_schedule()
  end
end

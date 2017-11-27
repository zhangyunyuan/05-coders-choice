defmodule CAS.Users.Patients do

    defdelegate patients_login(username, password), to: CAS.Users.Server
    defdelegate patients_check_schedule(), to: CAS.Users.Server
    defdelegate make_appointment, to: CAS.Users.Server
    defdelegate patients_login_out(), to: CAS.Users.Server
end
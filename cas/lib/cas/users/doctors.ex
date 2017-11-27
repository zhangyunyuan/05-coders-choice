defmodule CAS.Users.Doctors do

    defdelegate doctors_login(username, password), to: CAS.Users.Server
    defdelegate doctors_check_schedule(), to: CAS.Users.Server
    defdelegate doctors_login_out(), to: CAS.Users.Server
end
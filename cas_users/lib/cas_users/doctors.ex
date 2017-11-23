defmodule CAS_Users.Doctors do

    defdelegate doctors_login(), to:CAS_Users.Server
    defdelegate check_schedule(), to: CAS_Users.Server

end
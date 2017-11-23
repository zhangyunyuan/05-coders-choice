defmodule CAS_Users.Patients do

    defdelegate check_schedule(), to: CAS_Users.Server

end
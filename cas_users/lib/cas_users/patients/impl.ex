defmodule CAS_Users.Patients.Impl do
    use Agent

    def start_link() do
        Agent.start_link(fn ->  end, name: __MODULE__)
    end
    
    #Register new patient user. Later may introduce an admin user type to handle such function.
    def register(username, password) do
        username_verify(username)
    end
    
    #Login function for patient user.
    def login(username, password) do
        
    end

    #Verify username to avoid same username used.
    defp username_verify(username) do

    end
    
    #Check current patient's personal schedule.
    def check_schedule(username) do

    end


end
defmodule CAS.Users.Patients.Impl do
    use Agent

    def start_link(username) do
        Agent.start_link(fn -> 
                %CAS.Users.User_State{username: username} end, 
                name: __MODULE__
                )
    end

    def login(username, password) do
        Data.Impl.verify_patient(username, password)
        |> login_successfully?()
    end

    defp login_successfully?(user_state = %{}) do               
        IO.puts "Login Successfully. Welcome to CAS, Patient #{user_state.username}."
        start_link(user_state.username)
        true
    end

    defp login_successfully?(nil) do
        IO.puts "Login Failed. Please Re-try."
        false
    end

    def check_schedule() do
        Agent.get(__MODULE__, fn state -> state.username end)
        |> Data.Impl.patient_check_schedule()
    end

    def make_appointment() do
        all_doctors = Data.Impl.get_doctors()
        Agent.update(__MODULE__, fn state -> %CAS.Users.User_State{state | all_doctors: all_doctors}  end)
        Agent.get(__MODULE__, fn state -> state.all_doctors end)
        IO.puts "get a name."         
    end

    #defp display_all_doctors() do
         #get_doctors = Data.Impl.get_doctors()
         #IO.inspect get_doctors
         #IO.gets "get doctor_name: "
    #end

    #defp get_available_schedule(doctor_name) do
        #available_schedule = Data.Impl.display_available_schedule(doctor_name)
        #display_available_schedule(available_schedule)
        #desired_weekday = IO.gets "Please choose a weekday from above."
        #select_weekday(desired_weekday, doctor_name)
    #end

    #defp display_available_schedule(available_schedule) do
        #available_schedule
    #end

    #defp select_weekday(desired_weekday, doctor_name) do
        #patient_name = Agent.get(__MODULE__, fn state -> state.username end)
        #Data.Impl.update_schedule(patient_name, desired_weekday, doctor_name)
    #end

    def login_out() do
        Agent.stop(__MODULE__)
    end

end
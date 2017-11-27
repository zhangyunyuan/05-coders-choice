defmodule CAS.Users.Doctors.Impl do
    use Agent

    def start_link(username) do
        Agent.start_link(fn -> 
                %CAS.Users.User_State{username: username} end, 
                name: __MODULE__
                )
    end

    def login(username, password) do
        Data.Impl.verify_doctor(username, password)
        |> login_successfully?()
    end

    defp login_successfully?(user_state = %{}) do               
        IO.puts "Login Successfully. Welcome to CAS, Doctor #{user_state.username}."
        start_link(user_state.username)
        true
    end

    defp login_successfully?(nil) do
        IO.puts "Login Failed. Please Re-try."
        false
    end

    def check_schedule() do
        Agent.get(__MODULE__, fn state -> state.username end)
        |> Data.Impl.doctor_check_schedule()
    end

    def login_out() do
        Agent.stop(__MODULE__)
    end
end
defmodule CAS.Users.Server do
    use GenServer

    # Client Api
    def start_link() do
        GenServer.start_link(__MODULE__, [], name: __MODULE__)
    end

    def doctors_login(username, password) do
        GenServer.call(__MODULE__, {:doctors_login, username, password})
    end

    def doctors_check_schedule() do
        GenServer.call(__MODULE__, {:doctors_check_schedule})
    end

    def patients_login(username, password) do
        GenServer.call(__MODULE__, {:patients_login, username, password})
    end

    def patients_check_schedule() do
        GenServer.call(__MODULE__, :patients_check_schedule)
    end

    def make_appointment() do
        GenServer.call(__MODULE__, :make_appointment)
    end

    def doctors_login_out() do
        GenServer.call(__MODULE__, :doctors_login_out)
    end

    def patients_login_out() do
        GenServer.call(__MODULE__, :patients_login_out)
    end


    # Server Callbacks
    def init([]) do
        {:ok, %{}}
    end

    def handle_call({:doctors_login, username, password}, _from, state) do
        {:reply, CAS.Users.Doctors.Impl.login(username, password), state}
    end

    def handle_call({:doctors_check_schedule}, _from, state) do
        {:reply, CAS.Users.Doctors.Impl.check_schedule(), state}
    end

    def handle_call({:patients_login, username, password}, _from, state) do
        {:reply, CAS.Users.Patients.Impl.login(username, password), state}
    end

    def handle_call(:patients_check_schedule, _from, state) do
        {:reply, CAS.Users.Patients.Impl.check_schedule(), state}
    end

    def handle_call(:doctors_login_out, _from, state) do
        {:reply, CAS.Users.Doctors.Impl.login_out(), state}
    end

    def handle_call(:patients_login_out, _from, state) do
        {:reply, CAS.Users.Patients.Impl.login_out(), state}
    end

    def handle_call(:make_appointment, _from, state) do
        {:reply, CAS.Users.Patients.Impl.make_appointment(), state}
    end

    
end
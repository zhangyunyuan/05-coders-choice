defmodule CAS_Users.Server do
    use GenServer

    ## Client Api
    def start_link(opts) do
        GenServer.start_link(__MODULE__, [], name: __MODULE__)
    end

    def doctors_login(username, password) do
        GenServer.call(__MODULE__, {:doctors_login, username, password})
    end

    def patients_login(username, password) do
        GenServer.call(__MODULE__, {:patients_login, username, password})
    end

    def doctors_check_schedule() do
        GenServer.call(__MODULE__, :doctors_check_schedule)
    end

    ## Server Callbacks
    def init(:ok) do
        {:ok, %{}}
    end

    def handle_call({:doctors_login, username, password}, _from, state) do
        {:reply, CAS_Users.Doctors.Impl.login(username, password), state}
    end

    def handle_call({:doctors_check_schedule, username, password}, _from, state) do
        {:reply, CAS_Users.Doctors.Impl.check_schedule, state}
    end

end
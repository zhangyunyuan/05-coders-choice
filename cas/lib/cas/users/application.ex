defmodule CAS.Users.Application do
    use Application

    def start(_type, _args) do
        import Supervisor.Spec

        children = [
            worker(CAS.Users.Server, [], restart: :permanent)
        ]

        opts = [
            strategy: :one_for_one,
            name: CAS.Users.Supervisor
        ]
        Supervisor.start_link(children, opts)
    end
end
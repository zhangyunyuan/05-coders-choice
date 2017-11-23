defmodule CAS_Users.Application do
    use Application

    def start(_type, _args) do
        import Supervisor.Spec, warn: false
        children = [
            worker(CAS_Users.Server, [], restart: :transient)
        ]

        opts = [
            strategy: :one_for_one,
            name: CAS_Users.Supervisor
        ]

        Supervisor.start_link(children, opts)
    end

end
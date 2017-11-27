defmodule Data.Application do
    use Application

    def start(_type, _args) do
        import Supervisor.Spec

        children = [
            supervisor(Data.Repo, [])
        ]

        opts = [strategy: :one_for_one, name: Data.Supervisor]
        Supervisor.start_link(children, opts)
    end
end
defmodule Data.Patient do
    use Ecto.Schema

    schema "Patients" do
        field :username, :string
        field :password, :string
    end
end
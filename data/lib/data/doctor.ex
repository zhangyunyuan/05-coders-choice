defmodule Data.Doctor do
    use Ecto.Schema

    schema "Doctors" do
        field :username, :string
        field :password, :string
    end
end
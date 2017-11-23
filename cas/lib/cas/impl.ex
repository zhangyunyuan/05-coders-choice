defmodule CAS.Impl do

    def start() do
        get_user_type()
    end

    #Get user type from input. Input 1 stands for Doctors. Input 2 stands for Patients.
    defp get_user_type() do
        user_type = IO.gets "Please Enter User Type: 1 for Doctors; 2 for Patients." |> String.trim
        input_validation(user_type)
    end

    #Validate user type input. "1" or "2" only.
    defp input_validation(user_type) do
        cond do
            String.length(user_type) != 1 ->
                IO.puts "Please enter 1 or 2 only."
                get_user_type()

            !(user_type in ["1", "2"]) ->
                IO.puts "Please enter 1 or 2 only."
                get_user_type()

            true ->
                select_option(user_type)
        end
    end

    selection_option("1") do
        CAS_Users.Doctors.doctors_login()  
    end

    selection_option("2") do

    end
end
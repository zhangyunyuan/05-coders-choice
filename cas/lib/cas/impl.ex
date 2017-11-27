defmodule CAS.Impl do

    def start() do
        get_user_type()
    end

    #Get user type from input. Input 1 stands for Doctors. Input 2 stands for Patients.
    defp get_user_type() do
        user_type = IO.gets "Please Enter User Type: 1 for Doctors; 2 for Patients."
        user_type
        |> String.trim
        |> select_based_on_type()
    end

    #Doctor Operation.
    defp select_based_on_type("1") do
        username = get_username()
        password = get_password()
        CAS.Users.Doctors.doctors_login(username, password)
        |> select_operation_doctors        
    end

    #Patient Operation.
    defp select_based_on_type("2") do
        username = get_username()
        password = get_password()
        CAS.Users.Patients.patients_login(username, password)
        |> select_operation_patients        
    end

    defp select_based_on_type(other) do
        IO.puts "Invalid option #{other}"
        get_user_type()
    end

    #Get username from input.
    defp get_username() do
        username = IO.gets "Please Enter Username:"
        username
        |> String.trim
    end

    #Get password from input.
    defp get_password() do
        password = IO.gets "Please Enter Password:"
        password
        |> String.trim
    end

    #After login succesfully, doctor user could select operation. 
    defp select_operation_doctors(true) do
        operation = IO.gets "Please Select Operation, 1 stands for Check Schedule. 2 stands for login out."
        operation
        |> String.trim
        |> operation_option_doctors
    end

    #Login failed, return to username input stage.
    defp select_operation_doctors(false) do
        select_based_on_type("1")
    end

    defp operation_option_doctors("1") do
        CAS.Users.Doctors.doctors_check_schedule()
    end

    defp operation_option_doctors("2") do
        clear_screen()
        CAS.Users.Doctors.doctors_login_out()
        start()
    end

    defp operation_option_doctors(other) do
        IO.puts "Invalid option #{other}"
        select_operation_doctors(true)
    end

    #After login succesfully, patient user could select operation. 
    defp select_operation_patients(true) do
        operation = IO.gets "Please Select Operation, 1 stands for Check Schedule. 
                             2 stands for make new appointment.
                             3 stands for login out."
        operation
        |> String.trim
        |> operation_option_patients
    end

    #Login failed, return to username input stage.
    defp select_operation_patients(false) do
        select_based_on_type("2")
    end

    defp operation_option_patients("1") do
        CAS.Users.Patients.patients_check_schedule()
    end

    defp operation_option_patients("2") do
        CAS.Users.Patients.make_appointment()
    end

    defp operation_option_patients("3") do
        clear_screen()
        CAS.Users.Patients.patients_login_out()
        start()
    end

    defp operation_option_patients(other) do
        IO.puts "Invalid option #{other}"
        select_operation_patients(true)
    end


    defp clear_screen(), do: IO.write "\e[H\e[2J"

end
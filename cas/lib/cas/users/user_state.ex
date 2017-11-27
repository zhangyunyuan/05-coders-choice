defmodule CAS.Users.User_State do

    defstruct(
        username: "",
        password: "",
        all_doctors: [],
        required_doctor: "",
        desired_weekday: "",
        available_schedule: []
    )

end
defmodule CAS do
  
 @doc """
  This is how you start an interactive operation of Clinic Appointment System.
   Call

      CAS.start()

  """
  defdelegate start(), to: CAS.Impl 

end

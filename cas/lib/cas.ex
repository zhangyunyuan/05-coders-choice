defmodule CAS do
  
    defdelegate start(), to: CAS.Impl    
end

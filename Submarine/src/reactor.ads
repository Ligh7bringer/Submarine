package reactor is
   
   type Temperature is range 0..100;
   type ReactorStatus is (Cold, Normal, Hot, Overheated);

   type SubmarineReactor is tagged record
      temp : Temperature;
      status: ReactorStatus;
   end record;
   
   procedure UpdateReactorStatus (this : in out SubmarineReactor);
   
   procedure UpdateTemperature (this : in out SubmarineReactor; tmp : in out Temperature);

   function ConstructReactor return SubmarineReactor;
   
end reactor;

package oxygen is
   
   type O2Level is range 0..100;
   type O2Status is (Low, Medium, High);
   O2THRESHOLD : constant O2Level := 10;

   type SubmarineOxygenTank is tagged record
      oxygen_level : O2Level;
      oxygen_status : O2Status;
   end record;

   procedure UpdateO2Level (this : in out SubmarineOxygenTank; lvl : in O2Level);
   
   procedure UpdateO2Status (this : in out SubmarineOxygenTank);
   
   function GetOxygenStatus (this : in out SubmarineOxygenTank) return O2Status;
   
   function ConstructO2Tank return SubmarineOxygenTank;
   
end oxygen;

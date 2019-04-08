package oxygen is
   
   type O2Level is range 0..100;
   O2THRESHOLD : constant O2Level := 20;

   type SubmarineOxygenTank is 
      record
         oxygen_level : O2Level := 100;
      end record;

   procedure DecrementOxygen (ot : in out SubmarineOxygenTank ) with
     Pre => ot.oxygen_level /= 0,
     Post => ot.oxygen_level - ot.oxygen_level'Old = 1;
   
   procedure RegainOxygen (ot : in out SubmarineOxygenTank) with
     Pre => ot.oxygen_level = 0, 
     Post => ot.oxygen_level = 100;
   
end oxygen;

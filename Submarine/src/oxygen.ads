package oxygen with SPARK_Mode is
    
   type O2Level is range 0..100;
   type O2Status is (Critical, Sufficient);
   O2Threshold : constant O2Level := 15;
   O2Decrement : constant O2Level := 10;
   
   type SubmarineOxygenTank is tagged record
      oxygen_level : O2Level;
      status : O2Status;
   end record;

   procedure UpdateO2Level (This : in out SubmarineOxygenTank; lvl : in O2Level) with
     Pre'Class => lvl >= O2Level'First and lvl <= O2Level'Last,
     Post => This.oxygen_level >= O2Level'First and This.oxygen_level <= O2Level'Last,
     Contract_Cases => (lvl > O2Threshold and lvl <= O2Level'Last => This.status = Sufficient,
                        lvl >= O2Level'First and lvl <= O2Threshold => This.status = Critical);
   
   procedure Update (This : in out SubmarineOxygenTank) with
     Pre'Class => This.oxygen_level > O2Decrement,
     Post => This.oxygen_level >= O2Level'First;
      
   procedure UpdateO2Status (This : in out SubmarineOxygenTank) with
     Pre'Class => This.oxygen_level >= O2Level'First and This.oxygen_level <= O2Level'Last,
     Contract_Cases => (This.oxygen_level > O2Threshold and This.oxygen_level <= O2Level'Last=> This.status = Sufficient,
                        This.oxygen_level >= O2Level'First and This.oxygen_level <= O2Threshold => This.status = Critical);
   
   function ConstructO2Tank return SubmarineOxygenTank;
      
end oxygen;

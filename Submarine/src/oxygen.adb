with Ada.Text_IO; use Ada.Text_IO;

package body oxygen with SPARK_Mode is
   
   -- Updates the status of the oxygen tank based on the current O2 level.
   procedure UpdateO2Status (This : in out SubmarineOxygenTank) is 
   begin 
      if This.oxygen_level <= O2Level'Last and This.oxygen_level > O2Threshold then
         This.status := Sufficient;       
      elsif This.oxygen_level <= O2Threshold and This.oxygen_level >= O2Level'First then
         This.status := Critical;
         Ada.Text_IO.Put_Line("WARNING: Oxygen level critical! Surfacing...");
      end if;
      
   end UpdateO2Status;
   
   -- Updates the level of the oxygen tank based on the variable "lvl".
   procedure UpdateO2Level (This : in out SubmarineOxygenTank; lvl : in O2Level) is 
   begin 
      This.oxygen_level := lvl;
      This.UpdateO2Status;
   end UpdateO2Level;  
   
   procedure Update (This : in out SubmarineOxygenTank) is 
   begin
      if This.oxygen_level > O2Decrement then 
         This.oxygen_level := This.oxygen_level - O2Decrement;
         This.UpdateO2Status;
      end if;
   end Update;   
   
   function ConstructO2Tank return SubmarineOxygenTank is 
      result : SubmarineOxygenTank := (status => (Sufficient), oxygen_level => (70));
   begin           
      return result;
   end ConstructO2Tank;
 
   
end oxygen;

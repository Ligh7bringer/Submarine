with Ada.Text_IO; use Ada.Text_IO;

package body oxygen is
   
   -- Updates the status of the oxygen tank based on the current O2 level.
   procedure UpdateO2Status (this : in out SubmarineOxygenTank) is 
   begin 
      if this.oxygen_level <= O2Level(0.75) * O2Level'Last then
         this.oxygen_status := High;
      elsif this.oxygen_level <= O2Level(0.5) * O2Level'Last then
         this.oxygen_status := Medium;
      elsif this.oxygen_level <= O2Level(0.25) * O2Level'Last then
         this.oxygen_status := Low;
         Ada.Text_IO.Put_Line("WARNING: Oxygen level below 25%!");
      end if;
   end UpdateO2Status;
   
   -- Updates the level of the oxygen tank based on the variable "lvl".
   procedure UpdateO2Level (this : in out SubmarineOxygenTank; lvl : in O2Level) is 
   begin 
      this.oxygen_level := this.oxygen_level + lvl;
      UpdateO2Status(this);
   end UpdateO2Level;  
   
   -- Returns the current status of the oxygen tank.
   function GetOxygenStatus (this : in out SubmarineOxygenTank) return O2Status is
   begin
      return this.oxygen_status;
   end GetOxygenStatus;      
   
   function ConstructO2Tank return SubmarineOxygenTank is 
      result : SubmarineOxygenTank;
   begin      
      UpdateO2Level(result, 99);
      
      return result;
   end ConstructO2Tank;
   
end oxygen;

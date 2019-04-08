with Ada.Text_IO; use Ada.Text_IO;

package body oxygen is

   function OxygenLow ( ot : in out SubmarineOxygenTank ) return Boolean is 
     (ot.oxygen_level <= 20);
   
   procedure DecrementOxygen (ot : in out SubmarineOxygenTank ) is
   begin
      if not OxygenLow(ot) then
         ot.oxygen_level := ot.oxygen_level - 1;
      else
         Put_Line("WARNING: O2 low!");
      end if;
   end DecrementOxygen;
   
   procedure RegainOxygen (ot : in out SubmarineOxygenTank) is
   begin
      if OxygenLow(ot) then
         ot.oxygen_level := O2Level'Last;
      end if;
   end RegainOxygen;

  
      
   
end oxygen;

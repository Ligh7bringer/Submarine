with Ada.Text_IO; use Ada.Text_IO;

package body reactor with SPARK_Mode is
  
   procedure UpdateReactorStatus (This : in out SubmarineReactor) is 
   begin 
      if This.temp <= Temperature'Last and This.temp > OverheatThreshold then
         This.status := Overheated;
      end if;
      
      if This.temp <= OverheatThreshold and This.temp >= Temperature'First then
         This.status := Running;
      end if;
      
   end UpdateReactorStatus;

   procedure UpdateTemperature (This : in out SubmarineReactor; tmp : in Temperature) is
   begin
      This.temp := tmp;
      This.UpdateReactorStatus;
   end UpdateTemperature;
   
   function ConstructReactor return SubmarineReactor is 
      result : SubmarineReactor := (status => (Running), temp => (5));
   begin       
      return result;
   end ConstructReactor;
   
   procedure Update (This : in out SubmarineReactor) is
   begin      
      This.temp := This.temp + TempIncrement;
      This.UpdateReactorStatus;
   end;

end reactor;

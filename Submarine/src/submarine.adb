with Ada.Text_IO; use Ada.Text_IO;

package body submarine with SPARK_Mode is
   
   procedure Move (s : in out Submarine; desired_depth : in Depth) is 
   begin 
      if DepthInvariant (desired_depth) and DoorsClosedInvariant (s.airlocks) then
         s.current_depth := desired_depth;
      elsif DepthInvariant (desired_depth) and not DoorsClosedInvariant (s.airlocks) then
         s.airlocks(0).door := Closed;
         s.current_depth := desired_depth;
      end if;
      
   end Move;
   
   procedure PrintStatus(this : in out Submarine) is
      b : AirLock_Idx := this.airlocks'First;
      e : AirLock_Idx := this.airlocks'Last;
   begin
      Put_Line("Position: " & this.pos(0)'Image & this.pos(1)'Image);
      Put_Line("Depth: " & this.current_depth'Image & "m");
      Put_Line("Doors: ");
      for i in b..e loop
         Put_Line(i'Image & ": " & this.airlocks(i).door'Image);
      end loop;

      Put_Line("O2: " & this.oxygen_tank.oxygen_level'Image & "%");

      Put_Line("...........................");
   end PrintStatus;
     
end submarine;

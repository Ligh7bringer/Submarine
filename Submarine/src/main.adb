with Ada.Text_IO; use Ada.Text_IO;
with submarine; use submarine;
with airlock; use airlock;

procedure Main is
   YellowSubmarine : submarine.Submarine;
   b : AirLock_Idx := YellowSubmarine.airlocks'First;
   e : AirLock_Idx := YellowSubmarine.airlocks'Last;

   procedure PrintStatus is
   begin
      Put_Line("Position: " & YellowSubmarine.pos(0)'Image & YellowSubmarine.pos(1)'Image);
      Put_Line("Depth: " & YellowSubmarine.current_depth'Image & "m");
      Put_Line("Doors: ");
      for i in b..e loop
         Put_Line(i'Image & ": " & YellowSubmarine.airlocks(i).door'Image);
      end loop;

      Put_Line("O2: " & YellowSubmarine.oxygen_tank.oxygen_level'Image & "%");


      Put_Line("...........................");
   end PrintStatus;

begin


   while True loop
      PrintStatus;
      Move(YellowSubmarine, 400);
      MoveXY(YellowSubmarine, 10, 10);
      delay 5.0;
   end loop;

   --     LockAirLocks(YellowSubmarine.airlocks);
   --     CloseAirLocks(YellowSubmarine.airlocks);
end Main;

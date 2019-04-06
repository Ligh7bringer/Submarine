with Ada.Text_IO; use Ada.Text_IO;
with submarine; use submarine;

procedure Main is
   YellowSubmarine : submarine.Submarine;
   b : AirLock_Idx := YellowSubmarine.airlocks'First;
   e : AirLock_Idx := YellowSubmarine.airlocks'Last;

begin
   Put_Line("Doors: ");
   for i in b..e loop
      Put_Line(YellowSubmarine.airlocks(i).door'Image);
   end loop;

   Put_Line("Locks: ");
   for i in b..e loop
      Put_Line(YellowSubmarine.airlocks(i).lock'Image);
   end loop;

   LockAirLocks(YellowSubmarine.airlocks);
   CloseAirLocks(YellowSubmarine.airlocks);

   Put_Line("Doors: ");
   for i in b..e loop
      Put_Line(YellowSubmarine.airlocks(i).door'Image);
   end loop;

   Put_Line("Locks: ");
   for i in b..e loop
      Put_Line(YellowSubmarine.airlocks(i).lock'Image);
   end loop;
end Main;

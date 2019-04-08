with Ada.Text_IO; use Ada.Text_IO;
with submarine; use submarine;
with airlock; use airlock;

procedure Main is
   YellowSubmarine : submarine.Submarine;

begin
   while True loop
      YellowSubmarine.PrintStatus;
      YellowSubmarine.Move(400);
      delay 3.0;
   end loop;
end Main;

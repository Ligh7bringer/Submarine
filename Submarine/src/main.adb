with Ada.Text_IO; use Ada.Text_IO;
with submarine; use submarine;
with airlock; use airlock;
with oxygen; use oxygen;
with reactor; use reactor;
with torpedos; use torpedos;

procedure Main is
   YellowSubmarine : submarine.Submarine;

begin
   while True loop
      YellowSubmarine.PrintStatus;
      YellowSubmarine.Update;
      delay 3.0;
   end loop;
end Main;

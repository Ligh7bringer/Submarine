with Ada.Text_IO; use Ada.Text_IO;
with submarine; use submarine;
with airlock; use airlock;
with oxygen; use oxygen;
with reactor; use reactor;
with torpedos; use torpedos;

procedure Main is
   YellowSubmarine : submarine.Submarine;

   procedure PrintStatus is
      o2 : SubmarineOxygenTank := YellowSubmarine.oxygen_tank;
      subreactor : SubmarineReactor := YellowSubmarine.reactor;
      weapon : SubmarineWeapon := YellowSubmarine.weapon;
      curr_depth : Depth := YellowSubmarine.current_depth;
      doors : SubmarineAirlock := YellowSubmarine.airlocks;

   begin
      Ada.Text_IO.Put(ASCII.ESC & "[2J");
      Put_Line("Depth: " & YellowSubmarine.current_depth'Image & "m");

      Put_Line("Doors: ");
      Put_Line("    - 1: " & doors(0).status'Image & ", " & doors(0).lock'Image);
      Put_Line("    - 2: " & doors(1).status'Image & ", " & doors(1).lock'Image);

      Put_Line("O2: " & o2.oxygen_level'Image & "%, " & o2.status'Image);
      Put_Line("Reactor: " & subreactor.temp'Image & "C, " & subreactor.status'Image);
      Put_Line("Weapon: " & weapon.torpedos'Image & " torpedos");

      Put_Line("...........................");
   end PrintStatus;

begin
   while True loop
      PrintStatus;
      YellowSubmarine.Update;
      delay 3.0;
   end loop;
end Main;

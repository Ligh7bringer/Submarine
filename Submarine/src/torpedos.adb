package body torpedos with SPARK_Mode is

   procedure Load (This : in out SubmarineWeapon) is
   begin 
      if not This.loaded then
         This.loaded := True;
      end if;
   end Load;
   
   procedure Fire (This : in out SubmarineWeapon) is
   begin 
      if This.loaded and This.torpedos > 0 then
         This.torpedos := This.torpedos - 1;
         This.loaded := False;
      end if;
   end Fire;
   
   procedure Store (This : in out SubmarineWeapon) is
   begin 
      if This.torpedos < TorpedoRange'Last then
         This.torpedos := This.torpedos + 1;
      end if;
   end Store;
   
   function ConstructWeapon return SubmarineWeapon is 
      result : SubmarineWeapon := (torpedos => (10), loaded => (False));
   begin
      return result;
   end ConstructWeapon;


end torpedos;

package torpedos with SPARK_Mode is
   
   type TorpedoRange is range 0..10;
   
   type SubmarineWeapon is tagged record
      torpedos : TorpedoRange;
      loaded : Boolean;      
   end record;     
   
   procedure Load (This : in out SubmarineWeapon) with
     Pre'Class => This.loaded = False and This.torpedos > 0,
     Post => This.loaded = True and This.torpedos = This.torpedos'Old;
   
   procedure Fire (This : in out SubmarineWeapon) with
     Pre'Class => This.loaded = True and This.torpedos > 0,
     Post => This.loaded = False and This.torpedos = This.torpedos'Old - 1;
   
   procedure Store (This : in out SubmarineWeapon) with 
     Pre'Class => This.torpedos < TorpedoRange'Last,
     Post => This.torpedos = This.torpedos'Old + 1;
   
   function ConstructWeapon return SubmarineWeapon;

end torpedos;

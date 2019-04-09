package body airlock with SPARK_Mode is

   procedure CloseDoors (This : in out SubmarineAirlock) is
      f : AirLock_Idx := This'First;
      l : AirLock_Idx := This'Last;
      
   begin      
      for idx in f..l loop
         if This(idx).status = Open then
            This(idx).status := Closed;
         end if;
      end loop;      
   end CloseDoors;
   
   procedure LockDoors (This : in out SubmarineAirlock) is
      f : AirLock_Idx := This'First;
      l : AirLock_Idx := This'Last;
      
   begin      
      for idx in f..l loop
         if This(idx).status = Closed and This(idx).lock = Unlocked then
            This(idx).lock := Locked;
         end if;
      end loop;      
   end LockDoors;
   
   function ConstructAirlock return SubmarineAirlock is 
      result : SubmarineAirlock := (0 => (Closed, Locked), 1 => (Closed, Locked));      
   begin 
          
      return result;
   end ConstructAirlock;

   function DoorsClosedAndLocked (airlock : in SubmarineAirlock) return Boolean is 
   begin 
      return (for all I in airlock'Range => airlock(I).lock = Locked and airlock(I).lock = Locked);
   end DoorsClosedAndLocked;
   
   procedure OpenDoors (This : in out SubmarineAirlock) is 
      f : AirLock_Idx := This'First;
      l : AirLock_Idx := This'Last;
      
   begin      
      for idx in f..l loop
         This(idx).status := Open;
         This(idx).lock := Unlocked;
      end loop;      
   end OpenDoors;


end airlock;

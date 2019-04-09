package airlock with SPARK_Mode is

   -- Types -- 
   type OpenClosed is (Open, Closed);
   type LockedUnlocked is (Locked, Unlocked);
   
   type Door is tagged record
      status : OpenClosed;
      lock : LockedUnlocked;
   end record;
   
   type AirLock_Idx is range 0..1;   
   type SubmarineAirlock is array (AirLock_Idx) of Door;
   
   function DoorsClosed (This : in SubmarineAirlock) return Boolean is 
     (for all I in This'Range => This(I).status = Closed);
   
   function DoorsLocked (This : in SubmarineAirlock) return Boolean is 
     (for all I in This'Range => This(I).lock = Locked);
 
   -- Closes airlock doors
   procedure CloseDoors (This : in out SubmarineAirlock) with     
     Pre => (for some I in This'Range => This(I).status = Open),
     Post => DoorsClosed (This);
      
   -- Locks airlock doors
   procedure LockDoors (This : in out SubmarineAirlock) with     
     Pre => DoorsClosed (This) and then (for some I in This'Range => This(I).lock = Unlocked),
     Post => DoorsLocked (This);
     
   procedure OpenDoors (This : in out SubmarineAirlock) with 
     Pre => (for some I in This'Range => This(I).status = Closed),
     Post => (for all I in This'Range => This(I).status = Open);
   
   -- Ensure both doors are Closed and Locked
   function DoorsClosedAndLocked (airlock : in SubmarineAirlock) return Boolean;
   
   function ConstructAirlock return SubmarineAirLock;  

end airlock;

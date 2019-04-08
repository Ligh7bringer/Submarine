package airlock is

   -- Types -- 
   type OpenClosed is (Open, Closed);
   type LockedUnlocked is (Locked, Unlocked);
   
   type AirLock is 
      record
         door : OpenClosed;
         lock : LockedUnlocked;
      end record;
   
   type AirLock_Idx is range 0..1;
   type SubmarineAirLocks is array (AirLock_Idx) of AirLock;
   
   --     Procedures   
   procedure CloseAirLocks (s : in out SubmarineAirLocks) with     
     Pre => (for some I in s'Range => s(I).door = Open),
     Post => (for all I in s'Range => s(I).door = Closed);
      
   procedure LockAirLocks (s : in out SubmarineAirLocks) with     
     Pre => (for some I in s'Range => s(I).lock = Unlocked),
     Post => (for all I in s'Range => s(I).lock = Locked);

end airlock;

package airlock is

   -- Types -- 
   type OpenClosed is (Open, Closed);
   type LockedUnlocked is (Locked, Unlocked);
   
   type AirLock is tagged record
         door : OpenClosed;
         lock : LockedUnlocked;
      end record;
   
   type AirLock_Idx is range 0..1;
   type SubmarineAirLocks is array (AirLock_Idx) of AirLock;
   
   --     Procedures   
   procedure CloseAirLocks (this : in out SubmarineAirLocks) with     
     Pre => (for some I in this'Range => this(I).door = Open),
     Post => (for all I in this'Range => this(I).door = Closed);
      
   procedure LockAirLocks (this : in out SubmarineAirLocks) with     
     Pre => (for some I in this'Range => this(I).lock = Unlocked),
     Post => (for all I in this'Range => this(I).lock = Locked);
   
   function ConstructAirlocks return SubmarineAirLocks;

end airlock;

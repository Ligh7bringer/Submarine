package body airlock is

   procedure CloseAirLocks (this : in out SubmarineAirLocks) is
      f : AirLock_Idx := this'First;
      l : AirLock_Idx := this'Last;
   begin
      for idx in f..l loop
         this(idx).door := Closed;
      end loop;
   end CloseAirLocks;
   
   procedure LockAirLocks (this : in out SubmarineAirLocks) is
      f : AirLock_Idx := this'First;
      l : AirLock_Idx := this'Last;
   begin
      for idx in f..l loop
         this(idx).lock := Locked;
      end loop;
   end LockAirLocks;
   
   function ConstructAirlocks return SubmarineAirLocks is 
      result : SubmarineAirLocks;
   begin 
      CloseAirLocks(result);
      LockAirLocks(result);
      
      return result;
   end ConstructAirlocks;


end airlock;

package body airlock is

   procedure CloseAirLocks (s : in out SubmarineAirLocks) is
      f : AirLock_Idx := s'First;
      l : AirLock_Idx := s'Last;
   begin
      for idx in f..l loop
         s(idx).door := Closed;
      end loop;
   end CloseAirLocks;
   
   procedure LockAirLocks (s : in out SubmarineAirLocks) is
      f : AirLock_Idx := s'First;
      l : AirLock_Idx := s'Last;
   begin
      for idx in f..l loop
         s(idx).lock := Locked;
      end loop;
   end LockAirLocks;

end airlock;

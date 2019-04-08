package body submarine with SPARK_Mode is
   
   procedure Move (s : in out Submarine; desired_depth : in Depth) is 
   begin 
      if DepthInvariant (desired_depth) and DoorsClosedInvariant (s.airlocks) then
         s.current_depth := desired_depth;
      elsif DepthInvariant (desired_depth) and not DoorsClosedInvariant (s.airlocks) then
         s.airlocks(0).door := Closed;
         s.current_depth := desired_depth;
      end if;
      
      -- if at surface level, regain oxygen
      if s.current_depth = Depth'First then
         RegainOxygen (s.oxygen_tank);
      else  
         DecrementOxygen (s.oxygen_tank);        
      end if;
   end Move;
   
   procedure MoveXY (s : in out Submarine; X : in Integer; Y : in Integer) is
   begin
      s.pos(0) := s.pos(0) + X;
      s.pos(1) := s.pos(1) + Y;
   end MoveXY;
     
end submarine;

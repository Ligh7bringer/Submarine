with airlock; use airlock;
with oxygen; use oxygen;

package submarine with SPARK_Mode is
   
   -- Depth in meters.
   -- 0 is surface level
   -- Pos'Last is maximum depth
   type Depth is range 0..500;
   type xy is array (0..1) of Integer;
            
   -- The submarine
   type Submarine is 
      record 
         pos : xy := (0 => (0), 1 => (0));
         current_depth : Depth := 200;
         airlocks : SubmarineAirLocks := ( 0 => (Open, Unlocked), 1 => (Open, Unlocked) );  
         oxygen_tank : SubmarineOxygenTank := (oxygen_level => (10));
      end record;
   
   -- Invariant which ensures at least 1 door is 
   -- set to 'Closed' before performing any action
   function DoorsClosedInvariant (s : in SubmarineAirLocks) return Boolean is 
     (for some I in s'Range => s(I).door = Closed);
   
   function DepthInvariant (cd : in Depth) return Boolean is 
     (cd <= Depth'Last and cd >= Depth'First);
   
   function O2EnoughInvariant (o2 : in O2Level) return Boolean is 
     (o2 > O2THRESHOLD);
  
   procedure Move (s : in out Submarine; desired_depth : in Depth) with
     Pre =>  DepthInvariant (s.current_depth) and DoorsClosedInvariant (s.airlocks), 
   --       Post => DepthInvariant (s.current_depth) and DoorsClosedInvariant (s.airlocks),
     Contract_Cases => (s.current_depth - desired_depth < 0 => O2EnoughInvariant(s.oxygen_tank.oxygen_level),
                        s.current_depth - desired_depth > 0 => s.oxygen_tank.oxygen_level < O2THRESHOLD,
                        s.current_depth - desired_depth = 0 => s.oxygen_tank.oxygen_level < O2THRESHOLD);
   
   procedure MoveXY (s : in out Submarine; X : in Integer; Y : in Integer);
   
end submarine;

with airlock; use airlock;
with oxygen; use oxygen;
with reactor; use reactor;
with torpedos; use torpedos;

package submarine with SPARK_Mode is
      
   -- Depth in meters.
   -- 0 is surface level
   -- 500 is maximum depth
   type Depth is range 0..500;
   type xy is array (0..1) of Integer;
   
   -- The submarine
   type Submarine is tagged record 
      pos : xy := (0 => (0), 1 => (0));
      current_depth : Depth := 470;
      airlocks : SubmarineAirlock := ConstructAirlock;  
      oxygen_tank : SubmarineOxygenTank := ConstructO2Tank;
      reactor : SubmarineReactor := ConstructReactor;
      weapon : SubmarineWeapon := ConstructWeapon;
   end record;
            
   -- Invariants --
   function DepthInvariant (curr : in Depth) return Boolean is 
     (curr <= Depth'Last and curr >= Depth'First);
   
   function DoorsInvariant (This : in SubmarineAirlock) return Boolean is 
     (DoorsClosedAndLocked(This));
     
   procedure Move (This : in out Submarine; desired_depth : in Depth) with
     Pre'Class => DoorsInvariant(This.airlocks) and desired_depth <= Depth'Last and desired_depth >= Depth'First,
     Post => This.current_depth >= 0 and This.current_depth <= 500;
   
   procedure EmergencySurface (This : in out Submarine) with 
     Pre'Class => DoorsInvariant(This.airlocks) and then (This.oxygen_tank.status = Critical or This.reactor.status = Overheated),
     Post => This.current_depth = 0;
   
   procedure Update (This : in out Submarine) with 
     Post => This.oxygen_tank.oxygen_level >= 0 and This.oxygen_tank.oxygen_level <=100 and
     This.reactor.temp >= Temperature'First and This.reactor.temp <= Temperature'Last;
      
   function ValidateDepth (desired_depth : in Depth) return Boolean with
     Pre => desired_depth >= 0 and desired_depth <= 500,
     Contract_Cases => (desired_depth < 0 => ValidateDepth'Result = False,
                        desired_depth >= 0 and desired_depth <= 500 => ValidateDepth'Result = True,
                        desired_depth > 500 => ValidateDepth'Result = False);
      
end submarine;

package reactor with SPARK_Mode is
   
   type Temperature is range 0..100;
   type ReactorStatus is (Running, Overheated);
   OverheatThreshold : constant Temperature := 75;
   TempIncrement : constant Temperature := 10;
   
   type SubmarineReactor is tagged record
      temp : Temperature;
      status: ReactorStatus;
   end record;   
   
   procedure Update (This : in out SubmarineReactor) with 
     Pre'Class => This.temp <= OverheatThreshold - TempIncrement,
     Post => This.temp <= Temperature'Last;
   
   procedure UpdateTemperature (This : in out SubmarineReactor; tmp : in Temperature) with
     Pre'Class => tmp > Temperature'First and tmp < Temperature'Last,
     Post => This.temp > Temperature'First and This.temp  < Temperature'Last,
     Contract_Cases => (tmp > OverheatThreshold and tmp <= Temperature'Last => This.status = Overheated,
                        tmp >= Temperature'First and tmp <= OverheatThreshold => This.status = Running                         
                       );
   
   procedure UpdateReactorStatus (This : in out SubmarineReactor) with
     Pre'Class => This.temp > Temperature'First and This.temp < Temperature'Last,
     Post => This.temp > Temperature'First and This.temp  < Temperature'Last,
     Contract_Cases => (This.temp > OverheatThreshold and This.temp <= Temperature'Last => This.status = Overheated,
                        This.temp >= Temperature'First and This.temp <= OverheatThreshold => This.status = Running                         
                       );
   
   function ConstructReactor return SubmarineReactor; 

end reactor;

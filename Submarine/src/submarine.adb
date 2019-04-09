with Ada.Text_IO; use Ada.Text_IO;

package body submarine with SPARK_Mode is
   
   function ValidateDepth (desired_depth : in Depth) return Boolean is
   begin 
      return desired_depth >= 0 and desired_depth <= 500;
   end ValidateDepth;

   procedure Move (This : in out Submarine; desired_depth : in Depth) is       
   begin 
      if DoorsClosedAndLocked(This.airlocks) and then ValidateDepth(desired_depth) then
         This.current_depth := desired_depth;    
      end if;
   end Move;
    
   procedure EmergencySurface (This : in out Submarine) is 
   begin 
      if DoorsClosedAndLocked(This.airlocks) then
         This.current_depth := 0;         
         
         if This.oxygen_tank.status = Critical  then
            This.oxygen_tank.UpdateO2Level(100);
         end if;
      
         if This.reactor.status = Overheated then 
            This.reactor.UpdateTemperature(10);
         end if;
      end if;      

   end EmergencySurface;
   
   procedure Update (This : in out Submarine) is     
        
   begin            
      This.oxygen_tank.Update;   
      This.reactor.Update;
      
      if (This.oxygen_tank.status = Critical or This.reactor.status = Overheated) and DoorsClosedAndLocked(This.airlocks) then 
         -- go to surface
         This.EmergencySurface;
      else        
         if DoorsClosedAndLocked (This.airlocks) then
            -- Dive
            This.Move(500);
         end if;
      end if;
   end Update;
     
end submarine;

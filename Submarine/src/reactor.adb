package body reactor is

   function ConstructReactor return SubmarineReactor is 
      result : SubmarineReactor;
   begin 
      result.temp := 20;
      
      return result;
   end ConstructReactor;
   
   procedure UpdateReactorStatus (this : in out SubmarineReactor) is 
   begin 
      if this.temp <= Temperature'Last then
         this.status := Overheated;
      elsif this.temp <= Temperature(0.75) * Temperature'Last then
         this.status := Hot;
      elsif this.temp <= Temperature(0.50) * Temperature'Last then
         this.status := Normal;
      elsif this.temp <= Temperature(0.25) * Temperature'Last then
         this.status := Cold;
      end if;
   end UpdateReactorStatus;

   
   procedure UpdateTemperature (this : in out SubmarineReactor; tmp : in out Temperature) is
   begin
      this.temp := this.temp + tmp;
      UpdateReactorStatus(this);
   end UpdateTemperature;


end reactor;

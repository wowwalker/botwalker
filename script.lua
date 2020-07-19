 local s = 1
 local i = 1

PATH = {
    {-590.869, -4266.308, 38.740},
    {-606.207, -4269.540, 38.177},
    {-619.697, -4258.165, 38.501},
    {-619.516, -4240.577, 38.180},
    {-606.070, -4211.272, 38.255},
}
PRECISION = 1

function CalculationDist(Object1, Object2)
   local X1, Y1, Z1
   local X2, Y2, Z2
   if type(Object1) == "string" then
      X1, Y1, Z1 = __LB__.ObjectPosition(Object1)
   else
      X1, Y1, Z1 = Object1[1], Object1[2], Object1[3]
   end
   print("X1 = ", X1, " Y1 = ", Y1, " Z1 = ", Z1)
   if type(Object2) == "string" then
      X2, Y2, Z2 = __LB__.ObjectPosition(Object2)
   else 
      X2, Y2, Z2 = Object2[1], Object2[2], Object2[3]
   end
   print("X2 = ", X2, " Y2 = ", Y2, " Z2 = ", Z2)
   if (X1 and X2) then
      local Dist = math.sqrt(math.pow(X2 - X1, 2) + math.pow(Y2 - Y1, 2) + math.pow(Z2 - Z1, 2))      
      return Dist
   end
   return 100
end

function walk()    
    if(s == 1) then
        s = 2        
        local x = PATH[i][1]
        local y = PATH[i][2]
        local z = PATH[i][3]
        __LB__.MoveTo(x, y, z)        
        print("i = ", i)  
        i = i + 1
    else        
        local distance = CalculationDist('player', PATH[i])
        print(distance)
        if (distance < PRECISION) then
            s = 1
        end        
    end
end

SomeFrame = CreateFrame("Frame", "SomeFrame", nil)
SomeFrame:SetScript("OnUpdate", walk)

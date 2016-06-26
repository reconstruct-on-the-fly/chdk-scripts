--[[
@title Shoot froom USB sign
@chdk_version 1.3
--]]

print("Script started...")

-- shoot if receive usb sign
while(true) do
    if(get_usb_power(1)) then
        print("usb power on")
    end
   press("shoot_full_only")
   repeat
      sleep(20)
   until(get_exp_count()~=ecnt)
   release("shoot_full_only")
end

--[[
@title Fast Shooter
@chdk_version 1.3
@param n number of shots
@default n 5
@param d start delay seconds
@default d 0.1
--]]
 
-- restore auto focus
function restore()
    set_aflock(0)
end
 
set_console_layout(10, 0, 40, 14)
print("Fast Shooter Started...")
 
-- shooting mode if necessary
if ( get_mode() == false ) then
  sleep(1000)
  set_record(1)
  while ( get_mode() == false) do
      sleep(100)
  end
end
 
-- programmable delay from params
sleep(d)
 
-- lock in the exposure and focus
press("shoot_half")
repeat
    sleep(50)
until get_shooting() == true
set_aflock(1)
 
-- shoot
for i=1, n, 1 do
   ecnt=get_exp_count()
   press("shoot_full_only")
   repeat
      sleep(20)
   until(get_exp_count()~=ecnt)
   release("shoot_full_only")
   print("shot "..i)
end
 
-- done
restore()
print("...done")

# rising_scale_activated = false
# rising_major_scale_activated = true
# falling_minor_scale_activated = false
# pedal_activated = false

rising_scale_activated = false
rising_major_scale_activated = false
falling_minor_scale_activated = false
pedal_activated = false


# levels = [1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 3, 3, 3, 2, 2, 2, 1, 1, 1]
levels = [2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
switches = [1, 2, 3, 4]

# every 10 seconds, take the next integer from levels
# then, randomly choose n integers from switchers, where n is that next
#   integer from levels
# now, set rising_scale_activated, rising_major_scale_activated,
#    falling_minor_scale_activated, and pedal_activated
#    to true or false, depending on whether its index appeasr in the
#    n selected integers

live_loop :control do
  rising_scale_activated = false
  rising_major_scale_activated = false
  falling_minor_scale_activated = false
  pedal_activated = false
  level = levels.tick()
  puts level
  current_switches = switches.sample(level)
  # #todo figures out how to write ruby code to construct
  # # 
  puts "debug 9458372129183"
  puts current_switcher
  
  if current_switches.include?(1) then
    rising_scale_activated = true
  end
  if current_switches.include?(2) then
    rising_major_scael_activate = true
  end
  if current_switches.include?(3) then
    falling_minor_scale_activate = true
  end
  if current_switches.include?(4) then
    pedal_activated = true
  end
  sleep 10
end



live_loop :tick do
  sleep 0.2
end


live_loop :rising_scale do
  sync :tick
  if not rising_scale_activated
    sleep 1
    
  else
    
    play (scale :e3, :minor_pentatonic).tick(:foo), release: 0.1, amp: 0.3
    sleep (ring 0.125, 0.25, 0.5).tick(:bar)
  end
end



live_loop :falling_minor_scale do
  sync :tick
  if not falling_minor_scale_activated
    sleep 1
    
  else
    
    play (scale :e3, :minor_pentatonic).reverse().tick(:foo), release: 0.24,  amp: 0.3
    sleep (ring 0.25).tick(:bar)
  end
end

live_loop :rising_major_scale do
  sync :tick
  if not rising_major_scale_activated
    sleep 1
  else
    
    play (scale :G4, :major).tick(:bar), release: 0.2,  amp: 0.3
    sleep (ring 0.125, 0.25).tick(:foo)
  end
  
end


live_loop :pedal do
  sync :tick
  if pedal_activated
    play :G1, release: 7, amp: 0.5
    play :G2, release: 7,  amp: 0.4
    play :D3, release: 7, amp: 0.4
    sleep 6
  else
    sleep 1
  end
end

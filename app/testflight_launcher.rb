# This file is automatically generated. Do not edit.

if Object.const_defined?('TestFlight') and !UIDevice.currentDevice.model.include?('Simulator')
  NSNotificationCenter.defaultCenter.addObserverForName(UIApplicationDidBecomeActiveNotification, object:nil, queue:nil, usingBlock:lambda do |notification|
  TestFlight.takeOff('0a61d3da55ba5669e5933df957bb2d9f_MTczMTIwMjAxMy0wMS0xMiAxNzoxNjoyNy43NzYwNzg')
  end)
end

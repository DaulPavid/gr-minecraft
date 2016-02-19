component = require 'component'
sides = require 'sides'

for c in component.list('redstone') do
    rs = component.proxy(c)
    rs.setOutput(sides.left, 7)
    rs.setOutput(sides.right, 7)    
end
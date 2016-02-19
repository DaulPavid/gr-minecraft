--[[
  Created by DaulPavid
  MIT License, etc.
--]]

local comp = require 'component'
local net  = require 'internet'
local sides = require 'sides'
local event = require 'event'

local offset = 4
local mid_offset = 2
local fft_size = 16
local timeout = 10

local dir = {
  sides.north,
  sides.east,
  sides.south
}

function grabRSTable()
  local rs_table = {}
  for c in comp.list('red') do
    local rs = comp.proxy(c)
    local id = rs.getInput(sides.west)
    rs_table[id] = rs
  end
  return rs_table
end

function setCol(c, index, val)
  if (index == 2) then
    val = val + mid_offset
  else
    val = val + offset
  end
  c.setOutput(dir[index], val)
end

function setState(rs_table, vector)
  for i = 1, #rs_table do
    for j = 1, 3 do
      local index = 3*(i-1) + j
      setCol(rs_table[i], j, vector[index])
    end
  end 
end

function main()
  local con = net.open('127.0.0.1', 9001)
  con:setTimeout(timeout)

  if (con) then
    local rs_table = grabRSTable()

    while (true) do
      local data = con:read(fft_size)

      if (data == nil) then
        break
      end

      local data_array = {}
      for i = 1, fft_size do
        data_array[i] = string.byte(data, i)
      end
      
      setState(rs_table, data_array)      
    end
  else
    print('Connection failed...')
  end

  print('Program terminated...')  
end

main()

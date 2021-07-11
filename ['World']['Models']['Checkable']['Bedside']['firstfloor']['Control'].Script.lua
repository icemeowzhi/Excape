local Obj= script.Parent
allowContact = false
Raycast = require(localPlayer.Local.Raycast.Raycast)
worldVar = require(world.Global.WorldVars)
script.Parent.Parent.shovel.Item:SetActive(false)

testForBedside = function()
	if not(Raycast:getResult().HitObject==nil) then
		--print(Raycast:getResult().HitObject)
		if Raycast:getResult().HitObject.Name=="firstfloor" then 
			--print(Raycast:getResult().HitObject)
			if (allowContact == false) then
				allowContact = true
			end	
		else
			if (allowContact == true) then
				allowContact = false
			end	
		end
	else
		allowContact = false
	end
end

Raycast:addFunc(testForBedside)

Input.OnKeyDown:Connect(function()              --Input.OnKeyDown  函数在有按键被按下时触发
    if (Input.GetPressKeyData(Enum.KeyCode.Mouse0) == Enum.KeyState.KeyStatePress )then --Input.GetPressKeyData（）的作用是获取某个按键的状态  Enum.KeyCode.Mouse0--鼠标左键
		--print(Raycast:getResult().HitObject)
		--print(allowContact)
		if allowContact then
			if worldVar.openBedside == false then 
			
				print("打开啦！111")
				script.Parent.Position=script.Parent.Parent.End1.Position
				if not(script.Parent.Parent.shovel.Item == nil) then
					script.Parent.Parent.shovel.Item:SetActive(true)
				end
				--script.Parent.Parent.Shovel.Position = script.Parent.Parent.End1.Position
				worldVar.openBedside=true

			else
			
				print("关上啦！222")
				script.Parent.Position=script.Parent.Parent.Start1.Position
				if not(script.Parent.Parent.shovel.Item == nil) then
					script.Parent.Parent.shovel.Item:SetActive(false)
				end
				
				--script.Parent.Parent.Shovel.Position = script.Parent.Parent.Start1.Position
				worldVar.openBedside=false
			
			end	
		end
    end
end)
--[[
changeStatus = function(...)
	if Input.GetPressKeyData(Enum.KeyCode.Mouse0) == 
		Enum.KeyState.KeyStatePress then  --获取mouse1的按键状态
		
			print("Triggered")
			
			if worldVar.openBedside == false then 
			
				print("打开啦！111")
				script.Parent.Parent.firstfloor.Position=script.Parent.Parent.End1.Position
				worldVar.openBedside=true

			else
			
				print("关上啦！222")
				script.Parent.Parent.firstfloor.Position=script.Parent.Parent.Start1.Position
				worldVar.openBedside=false
			
			end	
	end
end
]]
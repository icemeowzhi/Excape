local Obj= script.Parent.Cube
local Obj1=script.Parent
show = false
Obj1.SurfaceGUI.Text:SetActive(false)
Raycast = require(localPlayer.Local.Raycast.Raycast)

testForShow = function()
	if not(Raycast:getResult().HitObject==nil) then
		if Raycast:getResult().HitObject.Name=="Item" then 
			if not(Raycast:getResult().HitObject.ID == nil) then
				if Raycast:getResult().HitObject.ID.Value == "A3" then
					if (show == false) then
						show = true
						Obj1.SurfaceGUI.Text:SetActive(true) 
					end					
				end
			end
		else
			if (show == true) then
				show = false
				Obj1.SurfaceGUI.Text:SetActive(false) 
			end	
		end
	else
		show = false
		Obj1.SurfaceGUI.Text:SetActive(false) 
	end
end

Raycast:addFunc(testForShow)

--[[
Obj.OnDetectedPlayerEnter:Connect(function(HitObject)    --玩家进入检测区域
	if(HitObject.ClassName == 'PlayerInstance')  then
		Obj1.SurfaceGUI.Text:SetActive(true)              --展示文字
	end
end)
Obj.OnDetectedPlayerLeave:Connect(function(HitObject)      --玩家走出检测区域
	if(HitObject.ClassName == 'PlayerInstance')  then  
		wait(3)       --等3秒是因为有些区域检测过小。这样能让玩家看清楚   秒数还有待调整
		Obj1.SurfaceGUI.Text:SetActive(false)            --关闭文字
	end
end)
]]


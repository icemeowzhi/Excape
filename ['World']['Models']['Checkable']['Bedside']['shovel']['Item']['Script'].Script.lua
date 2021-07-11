--[[

local Obj= script.Parent.Cube
local Obj1=script.Parent
Obj1.SurfaceGUI.Text:SetActive(false)

Obj.OnDetectedPlayerEnter:Connect(function(HitObject)    --玩家进入检测区域
	if(HitObject.ClassName == 'PlayerInstance'  and script.Parent.Parent.Position==script.Parent.Parent.Parent.End1.Position)  then
		Obj1.SurfaceGUI.Text:SetActive(true)              --展示文字
	end
end)
Obj.OnDetectedPlayerLeave:Connect(function(HitObject)      --玩家走出检测区域
	if(HitObject.ClassName == 'PlayerInstance'and script.Parent.Parent.Position==script.Parent.Parent.Parent.End1.Position)  then  
		wait(3)       --等3秒是因为有些区域检测过小。这样能让玩家看清楚   秒数还有待调整
		Obj1.SurfaceGUI.Text:SetActive(false)            --关闭文字
	end
end)
]]
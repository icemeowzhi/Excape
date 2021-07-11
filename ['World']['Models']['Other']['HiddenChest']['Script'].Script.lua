local Obj= script.Parent.HiddenChest_Cube
local Obj1=script.Parent
Obj1.SurfaceGUI.Text:SetActive(false)

Obj.OnDetectedPlayerEnter:Connect(function(HitObject)    --玩家进入检测区域
	if(HitObject.ClassName == 'PlayerInstance')  then
		Obj1.SurfaceGUI.Text:SetActive(true)              --展示文字
		--Obj1.SurfaceGUI.Text1:SetActive(true)
	end
end)
Obj.OnDetectedPlayerLeave:Connect(function(HitObject)      --玩家走出检测区域
	if(HitObject.ClassName == 'PlayerInstance')  then  
		wait(5)       --等3秒是因为有些区域检测过小。这样能让玩家看清楚   秒数还有待调整
		Obj1.SurfaceGUI.Text:SetActive(false)            --关闭文字
		--Obj1.SurfaceGUI.Text1:SetActive(false)
	end
end)
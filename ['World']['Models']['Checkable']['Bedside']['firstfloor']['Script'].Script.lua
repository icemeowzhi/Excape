--[[

local obj=script.Parent.Parent
local Boolvalue=obj.Boolvalue
Input.OnKeyDown:Connect(function()
    if Input.GetPressKeyData(Enum.KeyCode.Mouse0) == 1 then
        --获取鼠标在屏幕上的像素位置并从摄像机向该位置打一条射线
        local mouseHit = Input.GetMouseScreenPos()
        local Ray = world.CurrentCamera:ScreenPointToRay(Vector3(mouseHit.x, mouseHit.y, 0))
        --假设射线上的20米为击中点，若中间无物体阻隔则其为最终的击中点
        local HitPosition = Ray:GetPoint(20)
        --进行射线检测，判定中间是否有阻隔，若有则将其设为击中点
        local HitResults = Physics:RaycastAll(Ray.Origin, Ray.Origin + Ray.Direction*20, false)
        for i,v in pairs(HitResults.HitObjectAll) do
			--print(v)    
			--print( v.Block)
            if not v.Block  then   --and HitObject==obj
                if Boolvalue==false then
					world.Collide1.firstfloor.Position=world.G_Camera_Iron_01_Instance.End1.Position
					Boolvalue=true
					break
				else
					world.Collide1.firstfloor.Position=world.G_Camera_Iron_01_Instance.Start1.Position
					Boolvalue=false
					break
				end
            end 
        end
      
    end
end)
]]
--[[
--点击button_main按钮，触发图片
btn.OnClick:Connect(function()
	 btn.Figure:SetActive(true)
	 btn.Button_leave:SetActive(true)
end)
--点击离开按钮，关闭gui
btn.Button_leave.OnClick:Connect(function()
	 btn.Figure:SetActive(false)
	 btn.Button_leave:SetActive(false)
end)
--]]

local Obj= script.Parent
local btn=Obj.ScreenGUI_iron.Button_main
local fin=btn.Figure
local thisAudio=script.Parent
allowContact = false
Camera = localPlayer.Local.ConstraintFree.Cube.GameCamera

--
--让Button_main按钮透明化
btn:SetActive(false)
btn.Figure:SetActive(false)
btn.Button_leave:SetActive(false)
--

btn:SetActive(false)
btn.Figure:SetActive(false)
btn.Button_leave:SetActive(false)
--[[
Input.OnKeyDown:Connect(function()              --Input.OnKeyDown  函数在有按键被按下时触发
    if Input.GetPressKeyData(Enum.KeyCode.Mouse0) == 1 then --Input.GetPressKeyData（）的作用是获取某个按键的状态  Enum.KeyCode.Mouse0--鼠标左键
        --获取鼠标在屏幕上的像素位置并从摄像机向该位置打一条射线
        local mouseHit = Input.GetMouseScreenPos()
        local Ray = world.CurrentCamera:ScreenPointToRay(Vector3(mouseHit.x, mouseHit.y, 0))
        --假设射线上的20米为击中点，若中间无物体阻隔则其为最终的击中点
        local HitPosition = Ray:GetPoint(20)
        --进行射线检测，判定中间是否有阻隔，若有则将其设为击中点
        local HitResults = Physics:RaycastAll(Ray.Origin, Ray.Origin + Ray.Direction*20, false)  --参数：起点、终点、是否检测显示射线
        --print(HitResults:HasHit())
		--print(HitResults.HitObject)
	
		for i,v in pairs(HitResults.HitObjectAll) do                 --循环击中点
            --这里是满足条件，打开GUI
			if v.Block and HitResults.HitObject.Name=="Collider3_IronCabinet" then    --v.Block是？？射线是否触碰的bool值？
                btn:SetActive(true)
				btn.Figure:SetActive(true)
				btn.Button_leave:SetActive(true)
				print("button_interview出现了！")
				
				Camera.CursorLock = false                            --鼠标是否锁定在屏幕中心   报错，提示Camera为nil
				Camera.EnableMouseDrag = false                       --鼠标是否可以控制相机
				Camera.CursorDisPlay = true                          --是否显示鼠标
				
				btn.Button_leave.OnClick:Connect(function()          --点×关闭
				btn:SetActive(false)
				btn.Figure:SetActive(false)
				btn.Button_leave:SetActive(false)
				Camera.CursorLock = true                            
				Camera.EnableMouseDrag = true                       
				Camera.CursorDisPlay = false
				print("button_interview关闭了！")
				end)

                break
            end
        end
        
      
    end
end)
]]


Raycast = require(localPlayer.Local.Raycast.Raycast)

testForPuzzle = function()
	if not(Raycast:getResult().HitObject==nil) then
		if Raycast:getResult().HitObject.Name=="Item" then 
			--print(allowContact)
			if not(Raycast:getResult().HitObject.ID ==nil) then
				if Raycast:getResult().HitObject.ID.Value =="A10"  then
					if (allowContact == false) then
						allowContact = true
					end						
				end
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

Raycast:addFunc(testForPuzzle)

Input.OnKeyDown:Connect(function()              --Input.OnKeyDown  函数在有按键被按下时触发
    if Input.GetPressKeyData(Enum.KeyCode.Mouse0) == Enum.KeyState.KeyStatePress then --Input.GetPressKeyData（）的作用是获取某个按键的状态  Enum.KeyCode.Mouse0--鼠标左键
		if allowContact then
			btn:SetActive(true)
			btn.Figure:SetActive(true)
			btn.Button_leave:SetActive(true)
			print("button_interview出现了！")
				
			Camera.CursorLock = false                            --鼠标是否锁定在屏幕中心   报错，提示Camera为nil
			Camera.EnableMouseDrag = false                       --鼠标是否可以控制相机
			Camera.CursorDisplay = true                          --是否显示鼠标
		end
    end
end)

		btn.Button_leave.OnClick:Connect(function()          --点×关闭
			btn:SetActive(false)
			btn.Figure:SetActive(false)
			btn.Button_leave:SetActive(false)
				
			Camera.CursorLock = true                            
			Camera.EnableMouseDrag = true                       
			Camera.CursorDisplay = false 
			print("button_interview关闭了！")
		end)
		

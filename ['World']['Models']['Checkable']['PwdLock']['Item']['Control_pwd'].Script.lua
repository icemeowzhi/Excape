
local Obj= script.Parent
local btn=Obj.ScreenGUI_pwd.Button_main
local fin=btn.Figure
local thisAudio=script.Parent
--让Button_main按钮透明化
btn:SetActive(false)
btn.Figure:SetActive(false)
Obj.ScreenGUI_pwd.Button_leave:SetActive(false)
allowContact = false
Camera = localPlayer.Local.ConstraintFree.Cube.GameCamera
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
			if v.Block and HitResults.HitObject.Name=="PwdLock_Cube" then    
                btn:SetActive(true)
				btn.Figure:SetActive(true)
				btn.Button_leave:SetActive(true)
				print("button_interview出现了！")
				Camera.EnableMouseDrag = false
				Camera.CursorLock = false                            --鼠标是否锁定在屏幕中心   报错，提示Camera为nil
				--Camera.EnableMouseDrag = false                       --鼠标是否可以控制相机
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
			if not(Raycast:getResult().HitObject.ID ==nil) then
				if Raycast:getResult().HitObject.ID.Value =="A22"  then
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
    if Input.GetPressKeyData(Enum.KeyCode.Mouse0) ==  Enum.KeyState.KeyStatePress  then --Input.GetPressKeyData（）的作用是获取某个按键的状态  Enum.KeyCode.Mouse0--鼠标左键
		if allowContact then
			btn:SetActive(true)
			btn.Figure:SetActive(true)
			btn.Parent.Button_leave:SetActive(true)
			print("button_interview出现了！")
			Camera.EnableMouseDrag = false
			Camera.CursorLock = false                            --鼠标是否锁定在屏幕中心   报错，提示Camera为nil
			--Camera.EnableMouseDrag = false                       --鼠标是否可以控制相机
			Camera.CursorDisplay = true                          --是否显示鼠标
				
			btn.Parent.Button_leave.OnClick:Connect(function()          --点×关闭
				btn:SetActive(false)
				btn.Figure:SetActive(false)
				btn.Parent.Button_leave:SetActive(false)
			
				Camera.CursorLock = true                            
				Camera.EnableMouseDrag = true                       
				Camera.CursorDisplay = false  
				print("button_interview关闭了！")
			end)
		end
    end
end)

while true do    --密码是437
wait()
if _G.btn4 ==true then
	if _G.btn3 ==true then
		if _G.btn7 ==true then
		print("成功出逃")
		world.Models.Wall.Door.Position = script.Parent.End_Door.Position
		world.Models.Wall.Door.Rotation = script.Parent.End_Door.Rotation
		world.Models.Wall.BlackWall.Cube_Black.Position = script.Parent.End_Cube_Black.Position
		world.Models.Wall.BlackWall.Cube_Black.Rotation = script.Parent.End_Cube_Black.Rotation
		end
	end
end
if script.Parent.ScreenGUI_pwd.Count.Value ==3 then    --每输入三位，重置一次

_G.btn1=false
_G.btn2=false
_G.btn3=false
_G.btn4=false
_G.btn5=false
_G.btn6=false
_G.btn7=false
_G.btn8=false
_G.btn9=false
script.Parent.ScreenGUI_pwd.Count.Value=0
end

end



--[[
--触碰发生时：
Obj.OnCollisionBegin:Connect(function(HitObject)
	if(HitObject.ClassName == 'PlayerInstance') then
		btn:SetActive(true)   --按钮出现
		print("button_pwd出现了！")
	end
end)
--触碰结束
Obj.OnCollisionEnd:Connect(function(HitObject)
	if(HitObject.ClassName == 'PlayerInstance') then 
		btn:SetActive(false)
		
		print("button_pwd关闭了！") -- 按钮关闭
	end
end)

--点击button_main按钮，触发图片
btn.OnClick:Connect(function()
	 btn.Figure:SetActive(true)
	 Obj.ScreenGUI_pwd.Button_leave:SetActive(true)
	 print("密码界面打开了")
end)
--点击离开按钮，关闭gui
Obj.ScreenGUI_pwd.Button_leave.OnClick:Connect(function()
	 btn.Figure:SetActive(false)
	 Obj.ScreenGUI_pwd.Button_leave:SetActive(false)
end)
--]]

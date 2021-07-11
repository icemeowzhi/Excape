local timetext = script.Parent.Text                --拿到目标Text
local sec = 600                                    --初始值   最后改为600
local second
local minute = 10
Camera = localPlayer.Local.ConstraintFree.Cube.GameCamera
local  Start=localPlayer.Local.ScreenGUI_Begin.Figure_Start
Camera = localPlayer.Local.ConstraintFree.Cube.GameCamera          --获取到摄像机

function CountDown()       --用于终止的函数
	sec = sec - 1
	if sec == 0 then
	--游戏结束
	localPlayer.Health  = 0
	--GameOver的GUI
	
	Start:SetActive(true)                         --显示游戏封面
	Camera.CursorLock = false                            --鼠标是否锁定在屏幕中心 
	Camera.EnableMouseDrag = false                       --鼠标是否可以控制相机
	Camera.CursorDisplay = true                           --是否显示鼠标
	sec = 600                                               --重新设置时间
	end
	
end

--if world.CountDown.Start.Value==1  then                    --开始游戏后才计时  考虑使用全局变量  或者检测封面的激活状态？函数
while wait(1) do
	

	CountDown()
	if sec < 600 and sec >= 540 then
		
		second = sec % 60
		minute = 9
		if second < 10 then
			timetext.Text = tostring(minute)..':'..'0'..tostring(second)
		else 
			timetext.Text = tostring(minute)..':'..tostring(second)
		end
	end
	
	if sec < 540 and sec >= 480 then
		
		second = sec % 60
		minute = 8
		if second < 10 then
			timetext.Text = tostring(minute)..':'..'0'..tostring(second)
		else 
			timetext.Text = tostring(minute)..':'..tostring(second)
		end
	end
	
	if sec < 480 and sec >= 420 then
		
		second = sec % 60
		minute = 7
		if second < 10 then
			timetext.Text = tostring(minute)..':'..'0'..tostring(second)
		else 
			timetext.Text = tostring(minute)..':'..tostring(second)
		end
	end
	
	if sec < 420 and sec >= 360 then
		
		second = sec % 60
		minute = 6
		if second < 10 then
			timetext.Text = tostring(minute)..':'..'0'..tostring(second)
		else 
			timetext.Text = tostring(minute)..':'..tostring(second)
		end
	end
	
	if sec < 360 and sec >= 300 then
		
		second = sec % 60
		minute = 5
		if second < 10 then
			timetext.Text = tostring(minute)..':'..'0'..tostring(second)
		else 
			timetext.Text = tostring(minute)..':'..tostring(second)
		end
	end
	if sec < 300 and sec >= 240 then
		
		second = sec % 60
		minute = 4
		if second < 10 then
			timetext.Text = tostring(minute)..':'..'0'..tostring(second)
		else 
			timetext.Text = tostring(minute)..':'..tostring(second)
		end
	end
	
	if sec < 240 and sec >= 180 then
		
		second = sec % 60
		minute = 3
		if second < 10 then
			timetext.Text = tostring(minute)..':'..'0'..tostring(second)
		else 
			timetext.Text = tostring(minute)..':'..tostring(second)
		end
	end
	if sec < 180 and sec >= 120 then
		
		second = sec % 60
		minute = 2
		if second < 10 then
			timetext.Text = tostring(minute)..':'..'0'..tostring(second)
		else 
			timetext.Text = tostring(minute)..':'..tostring(second)
		end
	end
	if sec < 120 and sec >= 60 then
		second = sec % 60
		minute = 1
		if second < 10 then
			timetext.Text = tostring(minute)..':'..'0'..tostring(second)
		else 
			timetext.Text = tostring(minute)..':'..tostring(second)
		end
	end
	if sec < 60 and sec >= 0 then
		second = sec % 60
		minute = 0
		if second < 10 then
			timetext.Text = tostring(minute)..':'..'0'..tostring(second)
		else 
			timetext.Text = tostring(minute)..':'..tostring(second)
		end
	end
end
--end
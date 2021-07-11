local  Start=script.Parent.Figure_Start
local  About=script.Parent.Figure_About
local  btnstar=script.Parent.Figure_Start.Start
local  btnabout=script.Parent.Figure_Start.About
local  btnleave=script.Parent.Figure_About.Figure.Button_leave
Camera = localPlayer.Local.ConstraintFree.Cube.GameCamera          --获取到摄像机

Camera.CursorLock = false                            --鼠标是否锁定在屏幕中心 
Camera.EnableMouseDrag = false                       --鼠标是否可以控制相机
Camera.CursorDisplay = true                           --是否显示鼠标

btnstar.OnClick:Connect(function()
print("开始游戏")
--world.CountDown.Start.Value =1
Start:SetActive(false)
Camera.CursorLock = true                            --鼠标是否锁定在屏幕中心 
Camera.EnableMouseDrag = true                       --鼠标是否可以控制相机
Camera.CursorDisplay = false                           --是否显示鼠标
end)




btnabout.OnClick:Connect(function()
print("点开帮助")
About:SetActive(true)
end)


btnleave.OnClick:Connect(function()
print(1111)                           --点击不上...
About:SetActive(false)
end)
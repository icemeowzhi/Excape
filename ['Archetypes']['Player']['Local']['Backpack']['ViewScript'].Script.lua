initScript=require(world.ObjViewer.InitScript)

--ViewBtn = script.Parent.TestView
CloseViewBtn = script.Parent.CloseView


CloseViewBtn.Visible = false
--[[
ViewBtn.OnClick:Connect(function()
	initScript:Init1(true)
	CloseViewBtn.Visible = true
	ViewBtn.Visible = false
	end)
	]]
	
CloseViewBtn.OnClick:Connect(function()
	initScript:Back1(true)
	--ViewBtn.Visible = true
	CloseViewBtn.Visible = false
end)
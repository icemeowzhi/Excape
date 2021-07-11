_G.btn4=false
local Button=script.Parent
Button.OnClick:Connect(function()
	_G.btn4=true
	print("选中4")
	script.Parent.Parent.Parent.Parent.Parent.Count.Value =script.Parent.Parent.Parent.Parent.Parent.Count.Value+1
	
end)

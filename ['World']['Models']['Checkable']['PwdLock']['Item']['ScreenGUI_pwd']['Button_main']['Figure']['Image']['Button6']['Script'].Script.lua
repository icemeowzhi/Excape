_G.btn6=false
local Button=script.Parent
Button.OnClick:Connect(function()
	_G.btn6=true
	print("选中6")
	script.Parent.Parent.Parent.Parent.Parent.Count.Value =script.Parent.Parent.Parent.Parent.Parent.Count.Value+1
end)

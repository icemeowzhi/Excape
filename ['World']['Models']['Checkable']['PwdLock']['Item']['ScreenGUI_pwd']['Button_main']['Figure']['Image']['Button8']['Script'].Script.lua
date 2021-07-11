_G.btn8=false
local Button=script.Parent
Button.OnClick:Connect(function()
	_G.btn8=true
	print("选中8")
	script.Parent.Parent.Parent.Parent.Parent.Count.Value =script.Parent.Parent.Parent.Parent.Parent.Count.Value+1
end)

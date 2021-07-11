_G.btn3=false
local Button=script.Parent
Button.OnClick:Connect(function()
	_G.btn3=true
	print("选中3")
	script.Parent.Parent.Parent.Parent.Parent.Count.Value =script.Parent.Parent.Parent.Parent.Parent.Count.Value+1
end)

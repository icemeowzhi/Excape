_G.btn9=false
local Button=script.Parent
Button.OnClick:Connect(function()
	_G.btn9=true
	print("选中9")
	script.Parent.Parent.Parent.Parent.Parent.Count.Value =script.Parent.Parent.Parent.Parent.Parent.Count.Value+1
end)

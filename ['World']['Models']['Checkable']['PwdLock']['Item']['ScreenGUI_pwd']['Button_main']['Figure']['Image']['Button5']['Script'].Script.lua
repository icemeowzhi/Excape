_G.btn5=false
local Button=script.Parent
Button.OnClick:Connect(function()
	_G.btn5=true
	print("选中5")
	script.Parent.Parent.Parent.Parent.Parent.Count.Value =script.Parent.Parent.Parent.Parent.Parent.Count.Value+1
end)

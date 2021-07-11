_G.btn7=false
local Button=script.Parent
Button.OnClick:Connect(function()
	_G.btn7=true
	print("选中7")
	script.Parent.Parent.Parent.Parent.Parent.Count.Value =script.Parent.Parent.Parent.Parent.Parent.Count.Value+1
end)

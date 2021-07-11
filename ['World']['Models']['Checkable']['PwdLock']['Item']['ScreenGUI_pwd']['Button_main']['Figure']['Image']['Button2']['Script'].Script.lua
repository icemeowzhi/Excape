_G.btn2=false
local Button=script.Parent
Button.OnClick:Connect(function()
	_G.btn2=true
	print("选中2")
	print(count)
	script.Parent.Parent.Parent.Parent.Parent.Count.Value =script.Parent.Parent.Parent.Parent.Parent.Count.Value+1
end)

_G.btn1=false
local Button=script.Parent
Button.OnClick:Connect(function()
	_G.btn1=true
	print("选中1")
	script.Parent.Parent.Parent.Parent.Parent.Count.Value =script.Parent.Parent.Parent.Parent.Parent.Count.Value+1   --层级太多了
end)

_G.btn7=false
local Button=script.Parent
Button.OnClick:Connect(function()
	-- 白砖变红砖
	 if Button.Color~=Color(255,0,0,255)then
		Button.HoverColor=Color(255,0,0,255)
		Button.PressedColor=Color(255,0,0,255)
		Button.Color=Color(255,0,0,255)
		_G.btn7=true
	-- 红砖变白砖
	 else 
		Button.HoverColor=Color(255,255,255,255)
		Button.PressedColor=Color(255,0,0,255)
		Button.Color=Color(255,255,255,255)
		_G.btn7=false
	 end
end)
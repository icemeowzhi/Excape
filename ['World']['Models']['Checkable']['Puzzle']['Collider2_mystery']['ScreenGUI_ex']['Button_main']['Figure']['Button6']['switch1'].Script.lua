local Button=script.Parent
_G.btn6=false
Button.OnClick:Connect(function()
	-- 白砖变红砖
	 if Button.Color~=Color(255,0,0,255)then
		Button.HoverColor=Color(255,0,0,255)
		Button.PressedColor=Color(255,0,0,255)
		Button.Color=Color(255,0,0,255)
		_G.btn6=true
		print(_G.btn6)
	-- 红砖变白砖
	 else 
		Button.HoverColor=Color(255,255,255,255)
		Button.PressedColor=Color(255,0,0,255)
		Button.Color=Color(255,255,255,255)
		_G.btn6=false
	 end
end)
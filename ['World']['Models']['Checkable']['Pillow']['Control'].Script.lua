Raycast = require(localPlayer.Local.Raycast.Raycast)
moved = false
allowMove = false
movePillow = function()
	if not(Raycast:getResult().HitObject==nil) then
		if Raycast:getResult().HitObject.Name=="Pillow" then 
			if (allowMove == false) then
				allowMove = true
			end					
		else
			if (allowMove == true) then
				allowMove = false
			end	
		end
	else
		allowMove = false
	end
end

Raycast:addFunc(movePillow)

Input.OnKeyDown:Connect(function()
	
	if Input.GetPressKeyData(Enum.KeyCode.Mouse0) == Enum.KeyState.KeyStatePress
	then
		if allowMove and( not moved )then
			script.Parent.Position = script.Parent.Parent.End_pillow.Position
			moved = true			
		end
	end	

end)
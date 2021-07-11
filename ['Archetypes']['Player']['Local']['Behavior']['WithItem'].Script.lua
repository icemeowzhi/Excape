local ItemTable = world.Global.ItemInfo
local radius = 2
local radiusVec = Vector3(0,0,radius)
constant = require(script.Parent.Parent.Parent.PlayerConstants)
worldVar = require(world.Global.WorldVars)
initScript=require(world.ObjViewer.InitScript)
closeViewBtn = localPlayer.Local.Backpack.CloseView
renderPickUp = false
renderCheck = false
renderContact = false
player = localPlayer
checkable = false
pickable = false
contactable = false
constant.denyCheak = false

Raycast = require(localPlayer.Local.Raycast.Raycast)

withItem = function()
	if not(Raycast:getResult().HitObject==nil) then
		if Raycast:getResult().HitObject.Name == "Item" then
			IDCol = ItemTable:GetColumn("ID")
			--print(IDCol)
			for i,v in ipairs(IDCol) do
				if not(Raycast:getResult().HitObject.ID == nil) then
					if v == Raycast:getResult().HitObject.ID.Value then
						checkable = ItemTable:GetCell("Checkable",i)
						contactable = ItemTable:GetCell("Contactable",i)
						pickable = ItemTable:GetCell("Pickable",i)
					end				
				end
			end
			
			if (constant.AllowContact == false) and contactable then
				constant.AllowContact = true
			end				
			
			if (constant.AllowCheck == false) and checkable then
				constant.AllowCheck = true
			end			
		
			if (constant.AllowPickUp == false) and pickable then
				constant.AllowPickUp = true
			end
		else
			if constant.AllowContact ==true then
				constant.AllowContact = false
			end		
			if constant.AllowCheck ==true then
				constant.AllowCheck = false
			end
			if constant.AllowPickUp ==true then
				constant.AllowPickUp = false
			end			
			
		end
	else
		constant.AllowContact = false
		constant.AllowCheck = false
		constant.AllowPickUp = false
	end
	
	if constant.AllowContact and (not constant.denyCheak) then
		if renderContact == false then
			renderContact = true
			--some render code
			localPlayer.Local.ScreenGUI.ContactMessage.Visible  = true
		end
	else
		if renderContact == true then
			renderContact = false
			--some derender code
			localPlayer.Local.ScreenGUI.ContactMessage.Visible  = false
		end
	end
	
	if constant.AllowCheck and (not constant.denyCheak)then
		if renderCheck == false then
			renderCheck = true
			--some render code
			localPlayer.Local.ScreenGUI.CheckMessage.Visible  = true
		end
	else
		if renderCheck == true then
			renderCheck = false
			--some derender code
			localPlayer.Local.ScreenGUI.CheckMessage.Visible  = false
		end
	end

	if constant.AllowPickUp and (not constant.denyCheak) then
		if renderPickUp == false then
			renderPickUp = true
			--some render code
			localPlayer.Local.ScreenGUI.PickMessage.Visible  = true
		end
	else
		if renderPickUp == true then
			renderPickUp = false
			--some derender code
			localPlayer.Local.ScreenGUI.PickMessage.Visible  = false
		end
	end
end

Raycast:addFunc(withItem)

Input.OnKeyDown:Connect(function()
	if Input.GetPressKeyData(Enum.KeyCode.Mouse1) == Enum.KeyState.KeyStatePress
	then
		if constant.AllowPickUp then
			if not(Raycast:getResult().HitObject.ID ==nil) then
				player:BroadcastEvent("PickUp" ,Raycast:getResult().HitObject.ID.Value ,Raycast:getResult().HitObject.Num.Value)
				if Raycast:getResult().HitObject.ID.Value == "A4" then
					world.Models.Checkable.Bedside.firstfloor.Shovel:Destroy()
				end
				Raycast:getResult().HitObject:Destroy()
				constant.AllowPickUp = false				
			end
		end
	end
	
	if Input.GetPressKeyData(Enum.KeyCode.Mouse0) == Enum.KeyState.KeyStatePress
	then
		if constant.AllowCheck and (not constant.denyCheak) then
			worldVar.CheckModel = Raycast:getResult().HitObject
			if Raycast:getResult().HitObject.ID.Value == "A4" then
				worldVar.CheckModel = world.Models.Checkable.Bedside.firstfloor.Shovel
			end
			player.Local.ConstraintFree.Cube.GameCamera.EnableMouseDrag = false
			initScript:Init1(true)
			print(worldVar.CheckModel.PathToWorld)
			closeViewBtn.Visible = true
			constant.AllowCheck = false
			constant.denyCheak = true
		end
	end	

end)

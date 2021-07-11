worldVar = require(world.Global.WorldVars)
Root = script.Parent

--model = Root.Model
model = Root.Model:GetChildByIndex(1)
--print(model.PathToWorld)


modelRotateX = 0
modelRotateY = 0
modelRotateZ = 0
--model.Visible = false

--实现逻辑

Input.OnKeyDown:Connect(function()
	if Input.GetPressKeyData(Enum.KeyCode.Mouse0) == Enum.KeyState.KeyStatePress
	--and FocusInGameWindow
	--and MouseInGameWindow
	then
		if not (Root.Model:GetChildByIndex(1) == nil) then
			model = Root.Model:GetChildByIndex(1)
		end
		anchor = Input.GetMouseScreenPos()
	end
	if Input.GetPressKeyData(Enum.KeyCode.Mouse1) == Enum.KeyState.KeyStatePress
	then
		if not (Root.Model:GetChildByIndex(1) == nil) then
			model.Rotation = EulerDegree(0,0,0)
			modelRotateX = 0
			modelRotateY = 0
			modelRotateZ = 0
			print(Root.Model:GetChildByIndex(1).PathToWorld)
		end
	end
end)


Input.OnKeyHold:Connect(function()
	if Input.GetPressKeyData(Enum.KeyCode.Mouse0) == Enum.KeyState.KeyStateHold 
	then
		if not (Root.Model:GetChildByIndex(1) == nil) then
			--因为逻辑问题，点击第一次报错是正常现象
			pointerPOS = Input.GetMouseScreenPos()
			result = Vector2(pointerPOS.X-anchor.X,pointerPOS.Y-anchor.Y)
			azis = Vector3(0,-(pointerPOS.X-anchor.X),(pointerPOS.Y-anchor.Y))
			raw = EulerDegree.FromAngleAxis(azis,result.Magnitude/2)
			RotationX = raw.X + modelRotateX
			RotationY = raw.Y + modelRotateY
			RotationZ = raw.Z + modelRotateZ
			model.Rotation = EulerDegree(RotationX,RotationY,RotationZ)
		end
	end
end)

Input.OnKeyUp:Connect(function()
	if Input.GetPressKeyData(Enum.KeyCode.Mouse0) == Enum.KeyState.KeyStateRelease
	then
		if not (Root.Model:GetChildByIndex(1) == nil) then
			--因为逻辑问题，点击第一次报错是正常现象
			modelRotateX = model.Rotation.X
			modelRotateY = model.Rotation.Y
			modelRotateZ = model.Rotation.Z
		end
	end
end)

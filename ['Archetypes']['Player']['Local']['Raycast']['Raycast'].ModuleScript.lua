Raycast = {}
funcList = {}
local radius = 10
local radiusVec = Vector3(0,0,radius)
local constant = require(script.Parent.Parent.Parent.PlayerConstants)
local worldVar = require(world.Global.WorldVars)
local isDebugging = true
local result = nil

raycast = function()
	if constant.Raycast then
	--[[
	--这是我的代码qwq
		playerPos = script.Parent.Parent.ConstraintFree.Cube.GameCamera.Position
		playerFacingAngleX = script.Parent.Parent.ConstraintFree.Cube.GameCamera.Rotation.X
		playerFacingAngleY = script.Parent.Parent.ConstraintFree.Cube.GameCamera.Rotation.Y
		
		playerFacingVecXZ = radiusVec:Rotate(Vector3.Up,playerFacingAngleY)
		playerFacingVecY = radiusVec:Rotate(Vector3.Right,playerFacingAngleX)
		
		targetVecX = playerPos.X + playerFacingVecXZ.X
		targetVecY = playerPos.Y + playerFacingVecY.Y
		targetVecZ = playerPos.Z + playerFacingVecXZ.Z
		targetVec = Vector3(targetVecX,targetVecY,targetVecZ)
		
		result = Physics:Raycast(playerPos,targetVec,isDebugging)
		]]
		
		--这是大佬的代码qwq
		mouseHit = Input.GetMouseScreenPos()
		ray = world.CurrentCamera:ScreenPointToRay(Vector3(mouseHit.x, mouseHit.y, 0))
		hitPosition = ray:GetPoint(radius)
		result = Physics:Raycast(ray.Origin, hitPosition, isDebugging)
		--print(result.HitObject)
		
		for i,v in ipairs(funcList) do 
			v()	
		end
	end
end

world.OnRenderStepped:Connect(raycast)


function Raycast:addFunc(func) 
	funcList[constant.raycastIndex] = func
	constant.raycastIndex = constant.raycastIndex + 1
end

function Raycast:getResult() 
	return result
end

function Raycast:setDebugMode(bool) 
	isDebugging = bool
end

return Raycast
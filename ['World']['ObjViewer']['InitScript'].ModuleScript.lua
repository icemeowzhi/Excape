InitScript = {}
worldVar = require(world.Global.WorldVars)
playerVar= require(localPlayer.PlayerConstants)

function InitScript:Init1(debuging)
	if debuging then
		origionalModel = worldVar.CheckModel
		Root = script.Parent
		Root.ViewCamera.CameraMode = Enum.CameraMode.Custom
		Root.ViewCamera.Position = Vector3(-100,0,0)
		Root.ViewCamera.Rotation = EulerDegree(0,270,0)
		world.CurrentCamera = Root.ViewCamera
		cloned = origionalModel:CloneNode(world.ObjViewer.Model,true)
		--cloned.Name = "ClonedModel"
		cloned.Position = Vector3(-102,0,0)
		cloned.Rotation = EulerDegree(0,0,0)
		cloned.Visible = true
		worldVar.CheckModelClone = cloned
		print(worldVar.CheckModelClone.PathToWorld)
		print("debuging")
	else
		InitScript:Init()
	end
end
function InitScript:Init()
	Root = script.Parent
	Root.ViewCamera.CameraMode = Enum.CameraMode.Custom
	Root.ViewCamera.Position = Vector3(-95,0,0)
	Root.ViewCamera.Rotation = EulerDegree(0,270,0)
	world.CurrentCamera = Root.ViewCamera
	model = world.Global.Amodel
	model.Visible = true
	model.Position = Vector3(-105,0,0)

end
function InitScript:Back()
	model.Visible = false
	world.CurrentCamera = localPlayer.Local.ConstraintFree.Cube.GameCamera
end

function InitScript:Back1(debuging)
	if debuging then
		cloned.Visible = false
		cloned:Destroy()
		world.CurrentCamera = localPlayer.Local.ConstraintFree.Cube.GameCamera
		world.CurrentCamera.EnableMouseDrag = true
		playerVar.denyCheak = false
		print("debuging")
	end
end

return InitScript
Constant = require (script.Parent.PlayerConstants)
local Player = script.Parent
local GUI = Player.Local.ScreenGUI
local Joystick = GUI.Joystick
world.CurrentCamera=Player.Local.ConstraintFree.Cube.GameCamera
local Camera=world.CurrentCamera
local Mode = Camera.CameraMode
Camera.LookAt = Player

local ForwardKey = Enum.KeyCode.W
local BackKey = Enum.KeyCode.S
local LeftKey = Enum.KeyCode.A
local RightKey = Enum.KeyCode.D
local JumpKey = Enum.KeyCode.Space

local MoveForward = 0
local MoveBack = 0
local MoveLeft = 0
local MoveRight = 0
Constant.AllowMove = true

--获取按键盘时的移动方向最终取值
function GetMovement()
	MoveForward = Input.GetPressKeyData(ForwardKey)>0 and 1 or 0
	MoveBack = Input.GetPressKeyData(BackKey)>0 and -1 or 0
	MoveLeft = Input.GetPressKeyData(LeftKey)>0 and 1 or 0
	MoveRight = Input.GetPressKeyData(RightKey)>0 and -1 or 0
	if Player.State==Enum.CharacterState.Died then
		MoveForward=0
		MoveBack=0
		MoveLeft=0
		MoveRight=0
	end
end

--移动逻辑
function Move(Dir)
	Dir.y = 0
	if Player.State==Enum.CharacterState.Died then
		Dir=Vector2.Zero
	end
	if Dir.Magnitude>0 then
		if Mode==1 and Camera.Distance>=0 or Mode==4 then
			Player:FaceToDir(Dir, 4*math.pi)
		end
		Player:MoveTowards(Vector2(Dir.x,Dir.z).Normalized)
	else
		Player:MoveTowards(Vector2.Zero)
	end
end

--玩家死亡时的逻辑
function PlayerDie()
	Player:MoveTowards(Vector2(0, 0))
	Player:Die()
	local RespawnTime=Player.RespawnTime
	wait(RespawnTime)
	Player:Reset()
end
Player.OnDead:Connect(PlayerDie)

--每个渲染帧处理操控逻辑
function MainControl()
	if Player.Health<=0 then	
		Player:Die()
		return
	end
	if Input.GetPressKeyData(JumpKey)>0 then
		if Player.IsOnGround and Player.State~=Enum.CharacterState.Died then
			Player:Jump()
			return
		end
	end
	Camera=world.CurrentCamera
	Mode = Camera.CameraMode
	local Forward = (Mode==1 and Camera.Distance>=0 or Mode==4) and Camera.Forward or Player.Forward 
	Forward.y=0
	local Right = Vector3(0,1,0):Cross(Forward)
	local Horizontal = Joystick.Horizontal
	local Vertical = Joystick.Vertical
	local Dir = Vector3.Zero
	if Horizontal~=0 or Vertical~=0 then
		Dir = Right*Horizontal+Forward*Vertical
	else
		if Constant.AllowMove then
			GetMovement()
			Dir = Forward*(MoveForward+MoveBack)-Right*(MoveLeft+MoveRight)
		end
	end
	Move(Dir)
end
world.OnRenderStepped:Connect(MainControl)


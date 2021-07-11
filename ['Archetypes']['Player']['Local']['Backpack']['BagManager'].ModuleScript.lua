--local PlayerControl = require(localPlayer.PlayerControlScript)
local Constant = require (script.Parent.Parent.Parent.PlayerConstants)
local BagManager = {}
local print = function()end
local GridManager = require(localPlayer.Local.Backpack.GridManager)

if (world.CurrentCamera == nil) then
	world.CurrentCamera = localPlayer.Local.ConstraintFree.Cube.GameCamera
end

local Camera = world.CurrentCamera
local Opened = false
function BagManager:Init(_row, _col, _stepGap, _archetype)
	self.Root = localPlayer.Local.Backpack
	self.GridRoot = self.Root.BagPanel.BackgroundImg.ItemPanel
	self.Panel = self.Root.BagPanel.BackgroundImg
	
	
	self.ExitBtn = self.Root.BagPanel.BackgroundImg.Exit
	
	self.ExitBtn.OnClick:Connect(function()    --在点击退出按钮的时候触发
		if Opened then
			Opened = false
			Constant.AllowMove = true
			self:Cloth()
			Camera.CursorLock = true           --鼠标是否锁定在屏幕中心
			Camera.EnableMouseDrag = true      --鼠标是否可以控制相机
			Camera.CursorDisplay = false       --是显示鼠标
		end
	end)
	Input.OnKeyDown:Connect(function()
		if Input.GetPressKeyData(Enum.KeyCode.Tab) == Enum.KeyState.KeyStatePress
		then
			if not Opened then
				Opened = true
				Constant.AllowMove = false
				self:Open()
				Camera.CursorLock = false
				Camera.EnableMouseDrag = false
				Camera.CursorDisplay = true
			end
		end
	end)
	
	GridManager:Init(self.GridRoot, _row, _col, _stepGap, _archetype)
	self:Cloth()
end

function BagManager:Open()
	self.Panel.Visible = true
	GridManager:OnOpen()
end

function BagManager:Cloth()
	self.Panel.Visible = false
	GridManager:OnCloth()
end

function BagManager:OnDrop(_id, _num, _index)
	print("OnDrop", _id, _num, _index)
	local item = world:CreateInstance("Item", "Item",world, localPlayer.Position + localPlayer.Forward * 4 + Vector3.Up * .25)
	world:CreateObject("StringValueObject","ID",item).Value = _id
	world:CreateObject("IntValueObject","Num",item).Value = tonumber(_num and _num or 1)
end

function BagManager:OnUse(_id, _num, _index)
	print("OnUse", _id, _num, _index)
end

return BagManager
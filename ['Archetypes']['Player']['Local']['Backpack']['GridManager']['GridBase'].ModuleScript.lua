local GridBase = {}


local ItemList = require(ItemListModule)

local print = function()end

GridBase.__index = GridBase
function GridBase:new(_grid, _Index, _BtnCallBack)
	local o = {}
	setmetatable(o, self)
	o._isAvailable 				= true
	o._isSelected 				= false
	
	o.Grid 						= _grid
	o.Icon 						= _grid.Icon
	o.SelectionOutline 			= _grid.SelectionOutline
	o.TNum						= _grid.TNum
	o.Btn						= _grid.Btn
	o.ID						= _grid.Btn.ID
	o.Num 						= _grid.Btn.Num
	o.Index 					= _grid.Btn.Index
	
	o.UseFunc					= nil
	o.DropFunc					= nil
	
	o.Index.Value 				= _Index
	o.Grid.Visible 				= true
	o.Icon.Visible 				= false
	o.SelectionOutline.Visible 	= false
	o.TNum.Visible 				= false
	o.Btn.Visible 				= false
	
	o.Btn.OnClick:Connect(function()
		_BtnCallBack(o)
	end)
	
	o:Refresh()
	return o
end

--格子转换为不可拾起
function GridBase:Delete()
	self.Btn.OnClick:Clear()
	self = nil
end

--填充这个格子
function GridBase:SetPadding(_id, _num)
	
	self.ID.Value = _id
	self.Num.Value = _num
	
	--self:Refresh()
	return self
end

--置空这个格子
function GridBase:SetEmpty()
	self.ID.Value = ""
	self.Num.Value = 0
	
	self._isSelected = false
	
	--self:Refresh()
	return self
end

--设为不可用
function GridBase:SetAvailable(_isAvailable)
	if _isAvailable then
		self._isAvailable = true
	else
		self._isAvailable = false
	end
	
	--self:Refresh()
	return self
end

--检查是否可用
function GridBase:IsAvailable()
	return self._isAvailable
end

--设为选中状态
function GridBase:SetSelected(_isSelected)
	if self._isAvailable then
		self._isSelected = _isSelected
	else
		self._isSelected = false
	end
	
	--self:Refresh()
	return self
end

--刷新Ui
function GridBase:Refresh()
	if self._isAvailable then
		if self:GetID() == "" then
			self.Grid.Image = ResourceManager.GetTexture("Backpack/Empty_BG")
			self.Icon.Visible = false
			self.TNum.Visible = false
			self.Btn.Visible = false
		else
			self.Grid.Image = ResourceManager.GetTexture("Backpack/Available_BG")
			self.TNum.Visible = true
			self.Btn.Visible = true
			if ItemList[self:GetID()]then
			--print(self.Index.Value, ItemList[self:GetID()].Icon)
				self.Icon.Visible = true
				self.Icon.Image = ResourceManager.GetTexture("Backpack/Icon/"..ItemList[self:GetID()].Icon)
				self.TNum.Text = self.Num.Value
			else
			
				--test code
				self.Icon.Visible = false
				self.TNum.Text = self.Num.Value
				--
			end
		end
	else
		self.Icon.Visible = false
		self.Grid.Image = ResourceManager.GetTexture("Backpack/Unavailable_BG")
		self.TNum.Visible = false
		self.Btn.Visible = false
	end
	
	if self._isSelected then
		self.SelectionOutline.Visible = true
	else
		self.SelectionOutline.Visible = false
	end
	
	self.Icon.Size = Vector2.One * - 20
end

--使用
function GridBase:Use()
	print("xxxxxxxxUse",self:GetID())
	if self:GetNum() > 0 then
		return ItemList[self:GetID()].UseFunc
	end
end

--丢弃
function GridBase:Drop()
	print("xxxxxxxxDrop",self:GetID())
	if self:GetNum() > 0 then
		return ItemList[self:GetID()].DropFunc
	end
end

function GridBase:GetID()
	return self.ID.Value
end

function GridBase:GetNum()
	return self.Num.Value
end

function GridBase:GetIndex()
	return self.Index.Value
end

return GridBase
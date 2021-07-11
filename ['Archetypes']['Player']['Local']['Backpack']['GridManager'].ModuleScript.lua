local GridManager = {}

local GridBase = require(localPlayer.Local.Backpack.GridManager.GridBase)
local ItemList = require(ItemListModule)
local BackpackData = require(localPlayer.Local.Backpack.BackpackData)
local ItemDescription = localPlayer.Local.Backpack.BagPanel.BackgroundImg.ItemDescription
local ItemName = localPlayer.Local.Backpack.BagPanel.BackgroundImg.ItemName
local ItemTable = world.Global.ItemInfo
--local print = function()end

function GridManager:Init(_gridRoot, _row, _col, _stepGap, _archetype)
	--self.DropBtn = _gridRoot.Parent.Drop
	--self.UseBtn = _gridRoot.Parent.Use
	--chesk panel size
	local _panelSize = _gridRoot.FinalSize
	local _gridMarginSize = _panelSize.x / _col
	local TMP_PaddingLenth = _gridMarginSize - (_stepGap * 2)
	local _gridPaddingSize =  TMP_PaddingLenth > 0 and Vector2.One * TMP_PaddingLenth or Vector2.One * _gridMarginSize.x * .9
	_gridRoot.ScrollRange = _row * _gridMarginSize
	--create grid
	self.GridList = {}
	--for i,v in ipairs(_gridRoot) do
		--v:Destroy()
	--end
	for i = 1, _row do
		for j = 1, _col do
			local TMP_grid = world:CreateInstance(_archetype, "Grid_"..i.."_"..j, _gridRoot)
			TMP_grid.Size = _gridPaddingSize
			TMP_grid.AnchorsX = Vector2.One * (.5 / _col) * (j * 2 - 1)
			TMP_grid.Offset = Vector2(0, _gridMarginSize * (.5 - i))
			table.insert(self.GridList, {Grid = TMP_grid, Pos = Vector2(i, j), instance = nil})
		end
	end
	--Bind button
	for i,v in ipairs(self.GridList) do
		local _instance = GridBase:new(v.Grid, i, self.OnClickBtn)
		_instance:SetEmpty()
		v.instance = _instance
	end
	--[[
	self.DropBtn.OnClick:Connect(function()
		local DropFunc = self:TryToDrop()
		if DropFunc then
			BackpackData.DropFunction[DropFunc](GridManager:GetCurSelected():GetIndex())
		end
	end)
	self.UseBtn.OnClick:Connect(function()
		local UseFunc = self:TryToUse()
		if UseFunc then
			BackpackData.UseFunction[UseFunc](GridManager:GetCurSelected():GetIndex())
		end
	end)
	]]
	--Inituial database
	BackpackData:Init(_row * _col)	
	
	--Currently Selected
	self.CurSelected = nil
	
	--test code
	--------------------------------------------------
	BackpackData:PickUpItem("A10", 1)
	BackpackData:PickUpItem("A11", 1)
	BackpackData:PickUpItem("A12", 1)
	--BackpackData:Dump()
	---------------------------------------------------
	self:Refresh()
end

--点击道具格子时
function GridManager.OnClickBtn(_instnce)			--可优化性能
	print("OnClick", _instnce:GetIndex(), _instnce:GetID(), _instnce:GetNum())
	--排他性
	for i,v in ipairs(GridManager.GridList) do
		v.instance:SetSelected(false)
	end
	_instnce:SetSelected(true)
	GridManager:SetCurSelected(_instnce)
	IDCol = ItemTable:GetColumn("ID")
	--print(IDCol)
	for i,v in ipairs(IDCol) do
		if v == _instnce:GetID() then
			--print(i,v)
			ItemName.Text = ItemTable:GetCell("Name",i)
			ItemDescription.Text = ItemTable:GetCell("Description",i)
			--print(ItemName)
			--print(ItemDescription)
			
		end
	end
	--print(_instnce)
	GridManager:Refresh()
end

--储存当前选中格子
function GridManager:SetCurSelected(_grid)
	if not _grid then
		self.CurSelected = nil
		return
	end
	if _grid:IsAvailable() then
		self.CurSelected = _grid
	else
		self.CurSelected = nil
	end
end

--访问当前选中的格子
function GridManager:GetCurSelected()
	return self.CurSelected
end

--尝试使用
function GridManager:TryToUse()
	if self:GetCurSelected() then
		return self:GetCurSelected():Use()
	end
end

--尝试丢弃
function GridManager:TryToDrop()
	if self:GetCurSelected() then
		return self:GetCurSelected():Drop()
	end
end

--刷新
function GridManager:Refresh()			--可优化性能
	for i,v in ipairs(self.GridList) do
		local data = BackpackData.DataBase[i] 
		if data.ID == "None" then
			v.instance:SetEmpty()
		else
			v.instance:SetPadding(data.ID, data.Num)
		end
		v.instance:Refresh()
	end
end

function GridManager:OnOpen()
	
end

function GridManager:OnCloth()
	
end

return GridManager
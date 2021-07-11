local BackpackData = {}

--DataBase:
--{
--	[1] = {ID = xx, Num = vv},
--	[2] = {ID = xx, Num = vv}
--	...
--}

local print = function()end

--初始化_num个数据格子
function BackpackData:Init(_num)
	self.DataBase = {}
	self.Capacity = _num
	for i = 1, _num do
		self.DataBase[i] = {ID = "None", Num = 0}
	end
end

--在指定位置设置数据
function BackpackData:AddItem(_id, _num, _index)
	self.DataBase[_index] = {ID = _id, Num = _num}
end

--删除数据
function BackpackData:DeletItem(_index)
	self.DataBase[_index] = {ID = "None", Num = 0}
end

--改变数据
function BackpackData:ChangeItem(_index, _num, _id)
	self.DataBase[_index] = {ID = _id, Num = _num}
end

--找到第一个ID为_id的数据
function BackpackData:FindFirstItemByGivenId(_id)
	for i,v in ipairs(self.DataBase) do
		if v.ID == _id then
			return i,v
		end
	end
end

--知道到最后一个ID为_id的数据
function BackpackData:FindLastItemByGivenId(_id)
	for i = #self.DataBase, 1, -1 do
		if self.DataBase[i].ID == _id then
			return i, self.DataBase[i]
		end
	end
end

--找到指定位置的数据
function BackpackData:FindItemByGivenIndex(_index)
	_index = tonumber(_index)
	return self.DataBase[_index]
end

--找到所有ID为_id的数据
function BackpackData:FindAllItemsByGivenId(_id)
	local res = {}
	for i,v in ipairs(self.DataBase) do
		if v.ID == _id then
			table.insert(res, v)
		end
	end
	return res
end

--找到第一个空格
function BackpackData:FindFirstEmptySlot()
	for i = 1, self.Capacity do
		if self.DataBase[i].ID == "None" then
			return i
		end
	end
end

--命令：消耗指定数量的_id
function BackpackData:ConsumeByID(_id, _coumsumeCount)
	_coumsumeCount = _coumsumeCount or 1
	_coumsumeCount = tonumber(_coumsumeCount)
	local slot = self:FindLastItemByGivenId(_id)
	if not slot then return end
	if slot.Num > _coumsumeCount then
		slot.Num = slot.Num - _coumsumeCount
	else
	end
	
	self:RefreshGUI()
end

--命令：消耗某个格子下的数据
function BackpackData:ConsumeByIndex(_index, _coumsumeCount)
	if not _index then return end
	_coumsumeCount = _coumsumeCount or 1
	_coumsumeCount = tonumber(_coumsumeCount)
	local slot = self.DataBase[_index]
	if slot.Num > _coumsumeCount then
		slot.Num = slot.Num - _coumsumeCount
	else
		self:DeletItem(_index)
	end
	
	self:RefreshGUI()
end

--打印调试信息
function BackpackData:Dump()
	print("=============BackpackData===========")
	print("Total: ",self.Capacity)
	for i,v in ipairs(self.DataBase) do
		print(i, v.ID, v.Num)
	end
end

--刷新UI
function BackpackData:RefreshGUI()
	self:Dump()
	require(localPlayer.Local.Backpack.GridManager):Refresh()
end

--拾起道具
function BackpackData:PickUpItem(_id, _num)
	local EmptySlot = self:FindFirstEmptySlot()
	if EmptySlot then
		_num = tonumber(_num)
		print(type(_id), type(_num))
		self:AddItem(_id, _num, EmptySlot)
	end
	
	self:RefreshGUI()
end

--使用道具函数表
BackpackData.UseFunction = {
	Normal = function(...)
		print("Hear Use",...)
		local id, count = ...
		BackpackData:ConsumeByIndex(id, count)
	end
}

--丢弃道具函数表
BackpackData.DropFunction = {
	Normal = function(...)
		print("Drop Use",...)
		local index, count = ...
		local id = BackpackData.DataBase[index].ID
		count = count or BackpackData.DataBase[index].Num
		BackpackData:ConsumeByIndex(index, count)
		require(localPlayer.Local.Backpack.BagManager):OnDrop(id, count)
	end
}

localPlayer.Local.Backpack.BackpackData.PickUp:Connect(function(...)
	BackpackData:PickUpItem(...)
end)

localPlayer.Local.Backpack.BackpackData.Drop:Connect(function(...)
	BackpackData:ConsumeByIndex(...)
	local id, count = ...
	require(localPlayer.Local.Backpack.BagManager):OnDrop(id, count)
end)


return BackpackData
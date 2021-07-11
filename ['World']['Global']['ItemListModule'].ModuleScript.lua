local ItemList = {}

local tmpItemList = ItemInfo:GetRows()
for i,v in pairs(tmpItemList) do
	ItemList[v.ID] = v
end
tmpItemList = nil

return ItemList
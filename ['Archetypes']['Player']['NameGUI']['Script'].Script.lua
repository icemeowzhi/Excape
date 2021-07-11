Namebar=script.Parent.NameBar
NameGUI=script.Parent
HealthGUI=script.Parent.Parent.HealthGUI.Health
player=script.Parent.Parent
while true do
	Namebar:SetActive(player.DisplayName)
	Namebar.Text=player.Name
	
	if HealthGUI==nil or  HealthGUI.ActiveSelf==false then
		NameGUI.Position=player.Position+Vector3(0,1.9,0)
	else
		NameGUI.Position=player.Position+Vector3(0,2.0,0)
	end
	if Namebar:GetClosestTeam()~=world.Players and Namebar:GetClosestTeam()~=nil then
		Namebar.Color=Namebar:GetClosestTeam().TeamColor
	end
	wait(0.001)
end
local Interior

CreateThread(function()
	while true do
		Citizen.Wait(200)

		local interior = GetInteriorFromEntity(PlayerPedId())
		if interior ~= 0 and (not Interior or Interior.id ~= interior) then
			local coords, hash = GetInteriorInfo(interior)
			if hash == `slb2k11_container_col_office` then
				Interior = {
					position = coords,
					rotation = vec4(GetInteriorRotation(interior)),
					id = interior
				}
			elseif Interior then
				Interior = nil
			end
		elseif interior == 0 then
			Interior = nil
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(0)
		if Interior then
			-- container logic
		end
	end
end)
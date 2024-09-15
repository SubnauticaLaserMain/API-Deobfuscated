local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")


-- thanks for Dark Dex team about this. THANK YOU
local function GiveOwnGlobals(Func, Script)
	local Fenv = {}
    local RealFenv = {script = Script}
    local FenvMt = {}
    function FenvMt:__index(b)
        if RealFenv[b] == nil then
            return getfenv()[b]
        else
            return RealFenv[b]
        end
    end
	
	function FenvMt:__newindex(b, c)
        if RealFenv[b] == nil then
            getfenv()[b] = c
        else
            RealFenv[b] = c
        end
    end
        
	setmetatable(Fenv, FenvMt)

	print(Func, Fenv)

	print(Func, Fenv)

    setfenv(Func, Fenv)

    return Func
end



-- Create Storage
local function a()
	
		local function HandlePlacement(e)
			print(e, e)
			local success, errorMessage = pcall(function()
				e.Parent = game:GetService("CoreGui")
			end)

			if (not success) and (errorMessage:find("cannot access 'CoreGui' (lacking capability Plugin)")) then
				e.Parent = game:GetService("Players").LocalPlayer:WaitForChild('PlayerGui') or game:GetService("StarterGui")
				warn("Your Executor: '" .. (identifyexecutor and identifyexecutor() or 'Unknown!') .. "' dose not have primissions to the CoreGui. this can make the API Detectable! be carefull!")

				pcall(function()
					SendRobloxPrompt:Fire("WARNING", "Your Executor: '" .. (identifyexecutor and identifyexecutor() or 'Unknown!') .. "' dose not have primissions to the CoreGui. this can make the API Detectable! be carefull!")
				end)


				return
			end

			if (not success) then
				print(errorMessage .. ' was an error from ServerScriptAPI!')
			end

			return
		end

		local FolderForStorting = Instance.new("Folder")


		HandlePlacement(FolderForStorting)


		local FolderForCore = Instance.new("Folder", FolderForStorting)
		local FolderForCoreStorage = Instance.new("Folder", FolderForStorting)
		local GamesModuleStorageCore = Instance.new("Folder", FolderForCoreStorage)

		GamesModuleStorageCore.Name = 'GameModuleCore';
		FolderForStorting.Name = 'ServerScriptAPI-SourceCode';
		FolderForCore.Name = 'CoreScripts';
		FolderForCoreStorage.Name = 'CoreStorage';

		-- Function to load script
		function loadScript(script)
			if script then
				if typeof(script) == 'Instance' and (script.ClassName == 'LocalScript' or script.ClassName == 'Script') then
					local Func = assert(loadstring(script.Source, '=' .. script:GetFullName()))
					print(tostring(Func), tostring(script))
					local OwnGlobal = GiveOwnGlobals(Func, script);

					return task.spawn(OwnGlobal)
				end
			end
		end

		
		local CoreScriptForBreakIn = Instance.new("LocalScript", FolderForCore)
		CoreScriptForBreakIn.Name = 'CoreScript/Games-BreakIn-(Story)';
		CoreScriptForBreakIn.Source = [[
local API = {}

local a, b = pcall(function()
	-- Lobby Script
	if game.PlaceId == 3851622790 then
		print(script:WaitForChild('Break In (Story)'))

		print(script:WaitForChild('Break In (Story)', 10):FindFirstChild('InitBreakInScript'):Fire(true))

		-- .InitBreakInScript:Fire()
	elseif game.PlaceId == 4620170611 then
		script:WaitForChild('Break In (Story)', 10):FindFirstChild('In-Game'):WaitForChild('InitBreakInScript', 10):Fire(true)
	end
end)

if not a then
	warn(b .. ' came from ' .. script:GetFullName())
end
		]]

		-- loadScript(CoreScriptForBreakIn)

		local BreakIn1_Folder = Instance.new("Folder", CoreScriptForBreakIn)
		BreakIn1_Folder.Name = 'Break In (Story)'


		local InGameBreakIn1 = Instance.new("Folder", BreakIn1_Folder)
		InGameBreakIn1.Name = 'In-Game';


		local InLobbyBreakIn1 = Instance.new("Folder", BreakIn1_Folder)
		InLobbyBreakIn1.Name = 'Lobby';




		local GetBreakIn1_EventsFolder = Instance.new("BindableFunction", BreakIn1_Folder)
		GetBreakIn1_EventsFolder.Name = 'GetEventsFolder';
		GetBreakIn1_EventsFolder.OnInvoke = function()
			local ReplicatedStorage = game:GetService('ReplicatedStorage')

			if ReplicatedStorage:WaitForChild('RemoteEvents', 60) then
				return ReplicatedStorage:WaitForChild('RemoteEvents', 60)
			else
				warn('Missing RemoteEvents FOLDER!')
				return nil
			end
		end



		local EquipBreakIn1_Skin = Instance.new("BindableEvent", InLobbyBreakIn1)
		EquipBreakIn1_Skin.Name = 'EquipRole'

		local EquipBreakIn1_RoleCoreScript = Instance.new("LocalScript", EquipBreakIn1_Skin)
		EquipBreakIn1_RoleCoreScript.Name = 'EquipRole-Script';
		EquipBreakIn1_RoleCoreScript.Source = [[
local EventsFolder = script.Parent.Parent.Parent:WaitForChild('GetEventsFolder'):Invoke();




script.Parent.Event:Connect(function(Role, isKid, isCharacterEquipped)
	print('1 is ' .. tostring(Role), ' 2 is ' .. tostring(isKid), '3 is ' .. tostring(isCharacterEquipped))



	local MethodsTable = {
		-- Sort by Names
		['The Officer'] = {
			[1] = 'Gun',
			[3] = isCharacterEquipped or false,
			[4] = true
		},

		['The Swat'] = {
			[1] = 'SwatGun',
			[3] = isCharacterEquipped or false,
			[4] = true,
		},

		['The Figther'] = {
			[1] = 'Sword',
			[3] = isCharacterEquipped or false,
			[4] = true,
		},

		['The Hungry'] = {
			[1] = 'Chips',
			[2] = isKid,
			[3] = isCharacterEquipped or false,
			[4] = false,
		},

		['The Stealthy'] = {
			[1] = 'TeddyBloxpin',
			[2] = isKid,
			[3] = isCharacterEquipped or false,
			[4] = false,
		},

		['The Protector'] = {
			[1] = 'Bat',
			[2] = isKid,
			[3] = isCharacterEquipped or false,
			[4] = false,
		},

		['The Medic'] = {
			[1] = 'MedKit',
			[2] = isKid,
			[3] = isCharacterEquipped or false,
			[4] = false,
		},



		-- Sort By Items
		['Gun'] = {
			[1] = 'Gun',
			[3] = isCharacterEquipped or false,
			[4] = true,
		},

		['SwatGun'] = {
			[1] = 'SwatGun',
			[3] = isCharacterEquipped or false,
			[4] = true,
		},


		-- Just wanna clarafy
		['Sword'] = {
			[1] = 'Sword',
			[3] = isCharacterEquipped or false,
			[4] = true,
		},

		['ToySword'] = {
			[1] = 'Sword',
			[3] = isCharacterEquipped or false,
			[4] = true,
		},

		-- Kids
		['Chips'] = {
			[1] = 'Chips',
			[2] = isKid,
			[3] = isCharacterEquipped or false,
			[4] = false,
		},

		['TeddyBloxpin'] = {
			[1] = 'TeddyBloxpin',
			[2] = isKid,
			[3] = isCharacterEquipped or false,
			[4] = false,
		},

		['Bat'] = {
			[1] = 'Bat',
			[2] = isKid,
			[3] = isCharacterEquipped or false,
			[4] = false,
		},

		['MedKit'] = {
			[1] = 'MedKit',
			[2] = isKid,
			[3] = isCharacterEquipped or false,
			[4] = false,
		},
	}


	local Role = MethodsTable[Role]


	if Role then
		for i, v in Role do
			print(i, v)
		end
	end


	if Role then
		if Role[4] == true then
			local l, o = table.unpack({
				[1] = Role[1],
				[2] = Role[3]
			})


			EventsFolder:WaitForChild('OutsideRole'):FireServer(l, o)
		elseif Role[4] == false then
			local A, B, C = table.unpack(Role)


			EventsFolder:WaitForChild('MakeRole'):FireServer(A, B, C)
		end	
	end
end)



--if not a then
--	print(`[ERROR]: Error while calling for changing Role: ` .. tostring(b))
--end
		]]


		local InitBreakIn1ExploitRemote = Instance.new("BindableEvent", BreakIn1_Folder)
		InitBreakIn1ExploitRemote.Name = 'InitBreakInScript';


		local BreakIn1_ScriptInit = Instance.new("LocalScript", BreakIn1_Folder)
		BreakIn1_ScriptInit.Name = 'BreakInScriptInit-CoreScript';
		BreakIn1_ScriptInit.Source = [[
local InitGameFiles = script.Parent:WaitForChild('InitBreakInScript', 10)

print('From ' .. script.Name .. ' found InitGame: ' .. tostring(InitGameFiles))

InitGameFiles.Event:Connect(function(isLobby)
	if isLobby == true then
		local lobbyEquipRole = script.Parent:WaitForChild('Lobby', 60):WaitForChild('EquipRole', 60):Fire('Police', true, true);
	end
end)
		]]



		loadScript(EquipBreakIn1_RoleCoreScript)
		loadScript(BreakIn1_ScriptInit)




		local GiveToolBindableFunction = Instance.new("BindableEvent", InGameBreakIn1)
		GiveToolBindableFunction.Name = 'GiveItemFunction'


		local GiveWeaponBindableFunction = Instance.new("BindableEvent", InGameBreakIn1)
		GiveWeaponBindableFunction.Name = 'GiveWeaponFunction'


		local GiveFoodBindableFunction = Instance.new("BindableEvent", InGameBreakIn1)
		GiveFoodBindableFunction.Name = 'GiveFoodFunction'



		local CoreGameScriptsStorage = Instance.new("Folder", InGameBreakIn1)
		CoreGameScriptsStorage.Name = 'Core-Game-Scripts-Storage';


		local CoreItemScript = Instance.new("Script", CoreGameScriptsStorage)
		CoreItemScript.Name = 'Client-GiveItem-Giver';
		CoreItemScript.Source = [[
local GiveWeaponFunction = script.Parent.Parent:WaitForChild('GiveWeaponFunction')
local GiveItemFunction = script.Parent.Parent:WaitForChild('GiveItemFunction')
local GiveFoodFunction = script.Parent.Parent:WaitForChild('GiveFoodFunction')
local EventsFolder = script.Parent.Parent.Parent:WaitForChild('GetEventsFolder'):Invoke()


print(GiveFoodFunction, GiveFoodFunction.Name, GiveFoodFunction.ClassName, typeof(GiveFoodFunction.Event))

GiveFoodFunction.Event:Connect(function(food)
	print('GOT HERE LINE 1')
	local foodsTable = {
		'Apple',
		'Cookie',
		'BloxyCola',
		'Chips',
		'Lollipop',
		'Pizza1',
		'Pizza2',
		'Pizza3',
		'Chips',
		'EpicPizza',
		'ExpiredBloxyCola',
	}

	if table.find(foodsTable, food) then
		local FoodItem = food;

		EventsFolder:WaitForChild('GiveTool'):FireServer(food)
	else
		warn("[GiveFoodFunction]: Food: " .. food .. " is not a supported Food Item. If this item is a food in the game, please report it to the Developers.")
	end
end)


GiveItemFunction.Event:Connect(function(item)
	local itemsTable = {
		'Cure',
		'MedKit',
		'TeddyBloxpin',
		'Key',
		''
	}
end)

GiveWeaponFunction.Event:Connect(function(weapon)
	local weaponTable = {
		'Bat',
		'LinkedSword',
		''
	}
end)
		]]



		loadScript(CoreItemScript)



		local InGameInitRemote = Instance.new("BindableEvent", InGameBreakIn1)
		InGameInitRemote.Name = 'InitBreakInScript'


		local InitScriptRemote = Instance.new("Script", InGameBreakIn1)
		InitScriptRemote.Name = 'Init-BreakIn-In-Game-ClientScript';
		InitScriptRemote.Source = [[
local InitBreakInScript = script.Parent:WaitForChild('Init-BreakIn-In-Game-ClientScript')


InitBreakInScript.Event:Connect(function()
	print('IS INGAME')
end)
		]]


		local HouseRemotesFolder = Instance.new("Folder", InGameBreakIn1)
		HouseRemotesFolder.Name = 'House'


		local BasementRemoteStorage = Instance.new("Folder", HouseRemotesFolder)
		BasementRemoteStorage.Name = 'Basement'


		local GetNoteCodeEvent = Instance.new("BindableFunction")
		GetNoteCodeEvent.Name = 'GetNoteCode'
		GetNoteCodeEvent.Parent = BasementRemoteStorage
		GetNoteCodeEvent.OnInvoke = function()
			local Storage = workspace:WaitForChild('CodeNote', 10)
			if Storage then
				local SurfaceGui = Storage:WaitForChild('SurfaceGui', 10)
				if SurfaceGui then
					local Code = SurfaceGui:WaitForChild('TextLabel', 10)
					if Code then
						return Code.Text
					end
				end
			end
			return nil
		end



		local GetNoteObject = Instance.new("BindableFunction", BasementRemoteStorage)
		GetNoteObject.Name = 'GetNoteObject'
		GetNoteObject.OnInvoke = function()
			local Storage = workspace:WaitForChild('CodeNote', 10)

			if Storage then
				return Storage
			end
		end


		local GetWeaponsContainer = Instance.new("BindableFunction", BasementRemoteStorage)
		GetWeaponsContainer.Name = 'GetBasementWeaponsStorage'
		GetWeaponsContainer.OnInvoke = function()
			
		end


		local UnlockBasementDoor = Instance.new("BindableEvent", BasementRemoteStorage)
		UnlockBasementDoor.Name = 'UnlockBasementDoor'
		UnlockBasementDoor.Event:Connect(function()
			local Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
			local Backpack = Players.LocalPlayer:WaitForChild('Backpack')
			local Key


			if Backpack then
				Key = Backpack:FindFirstChild('Key')
			end


			if Character then
				local Humanoid = Character:FindFirstChildOfClass('Humanoid')

				if Humanoid then
					if not Key then
						Key = Character:FindFirstChild('Key')
					end

					if not Key then
						if GiveToolBindableFunction and typeof(GiveToolBindableFunction) == 'Instance' and GiveToolBindableFunction.ClassName == 'BindableEvent' then
							GiveToolBindableFunction:Fire('Key')
						end

						Key = Backpack:FindFirstChild('Key') or Character:FindFirstChild('Key')

						if Key and Key.Parent == Backpack then
							local a, b = pcall(function()
								Humanoid:EquipTool(Key)
							end)

							if not a then
								Key.Parent = Character
							end
						end
					end
				end
			end

			task.wait(0.5)

			game:GetService("ReplicatedStorage").RemoteEvents.UnlockDoor:FireServer()
		end)


		local ActivateBasementLights = Instance.new("BindableEvent", BasementRemoteStorage)
		ActivateBasementLights.Name = 'ActivateBasementLights'
		ActivateBasementLights.Event:Connect(function()
			game:GetService("ReplicatedStorage").RemoteEvents.BasementMission:FireServer()
		end)


		local GetAtticItem = Instance.new("BindableEvent", HouseRemotesFolder)
		GetAtticItem.Name = 'AtticItem'
		GetAtticItem.Event:Connect(function()
			local args = {
				[1] = 1
			}

			game:GetService("ReplicatedStorage").RemoteEvents.BloxyPack:FireServer(unpack(args))
		end)
	

		local DoCatteryFunction = Instance.new("BindableEvent", HouseRemotesFolder)
		DoCatteryFunction.Name = 'CatteryEvent'
		DoCatteryFunction.Event:Connect(function()
			local args = {
				[1] = 244,
				[2] = true
			}

			game:GetService("ReplicatedStorage").RemoteEvents.DoDialogue:FireServer(unpack(args))


			game:GetService("ReplicatedStorage").RemoteEvents.Cattery:FireServer()
		end)


		local DoCatHeal = Instance.new("BindableEvent", HouseRemotesFolder)
		DoCatHeal.Name = 'CatHeal'
		DoCatHeal.Event:Connect(function()
			local EventsFolder = GetBreakIn1_EventsFolder:Fire()

			if EventsFolder then
				local CatHeal = EventsFolder:WaitForChild('Energy')

				if CatHeal then
					CatHeal:FireServer('Cat')
				end
			end
		end)


		local DOPCCameraEvent = Instance.new("BindableEvent", HouseRemotesFolder)
		-- ^ Corrected variable name from DoPCCameraEvent to DOPCCameraEvent
		DOPCCameraEvent.Name = 'PCScreenEvent'
		DOPCCameraEvent.Event:Connect(function()
			local args = {
				[1] = 1,
				[2] = "Completed"
			}

			game:GetService("ReplicatedStorage").RemoteEvents.PCCamera:FireServer(unpack(args))
		end)



		local SewerFolder = Instance.new("Folder", HouseRemotesFolder)
		SewerFolder.Name = 'Sewer'



		-- [Warning]: this Event is beeing worked on, please wait while the developer finishes it, Thank You!
		local SendPlayerIntoSewerWater = Instance.new("BindableEvent", SewerFolder)
		SendPlayerIntoSewerWater.Name = 'DrownPlayer'
		SendPlayerIntoSewerWater.Event:Connect(function(player)
			local EventsFolder = GetBreakIn1_EventsFolder:Fire()
			warn('This Event is beeing worked and Tested on, whould not recomend using it right now, if it dosent work, please dont ask the developer, he is working hard on it, Thank you for your support!')

			if EventsFolder then
				local DrownRemote = EventsFolder:WaitForChild('ToxicDrown')

				if DrownRemote then
					DrownRemote:FireServer(player)
				end
			end
		end)


		local PickupMoneyEvent = Instance.new("BindableEvent", HouseRemotesFolder)
		PickupMoneyEvent.Name = 'PickupMoney'
		
		local PickupMoneyScript = Instance.new("Script", PickupMoneyEvent)
		PickupMoneyScript.Name = 'PickupMoneyEventScript'
		PickupMoneyScript.Source = [[
local Workspace = game:GetService("Workspace")
local fireclick = fireclickdetector
local firetouch = firetouchinterest
local executor = (identifyexecutor and identifyexecutor()) or 'Unknown'
local Platform = (function()
	local success, result = pcall(function()
		return game:GetService("UserInputService"):GetPlatform()
	end)

	
	if (not success) and (result:find("'GetPlatform' (lacking capability RobloxScript)")) then
		warn("[ServerScriptAPI]: Error while getting Platform. The current Executor: '" .. (identifyexecutor and identifyexecutor() or 'Unknown') .. "' cannot use GetPlatform, cannot identify if the Executor can use 'fireclickdetector' or not.")

		return nil
	end

	if (not success) then
		warn("[ServerScriptAPI]: Error: " .. tostring(result))

		return nil
	end

	return result
end)()


script.Parent.Event:Connect(function()
	if Workspace:FindFirstChild('Money2') or Workspace:FindFirstChild('Money3') or Workspace:FindFirstChild('Money') then
		local Money = Workspace:FindFirstChild('Money2') or Workspace:FindFirstChild('Money3') or Workspace:FindFirstChild('Money')


		-- Evon is a free Android Executor, and, i'm adding support for it, since, i use it often
		-- Android Executors dosent suppot 'fireclickdetector' since, android isent meant to have a mouse
		-- So, we using 'firetouchinterest' instead, to fire the TouchDetector! - as i call it.
		if (executor and executor:find('Evon')) or (Platform and (Platform.Name == 'Android' or Platform.Name == 'IOS' or Platform.Name == 'None')) then
			if Money and Money:FindFirstChild('TouchInterest') then
				firetouch(Money:FindFirstChild('TouchInterest'))
			end

		-- exspecting that Wave Executor's identity is 'Wave'
		-- Windows Executors should support 'fireclickdetector'
		elseif (executor and (executor:find('Nezur') or executor:find('Wave'))) or (Platform and (Platform.Name == 'Windows' or Platform.Name == 'UWP')) then
			local clickDetector = Money and Money:FindFirstChild('ClickDetector')

			if clickDetector then
				fireclick(clickDetector)
			end
		else
			warn('Cannot pickup money! Reason: Platform is not Supported: ' .. (Platform and Platform.Name or 'Unknown'))
		end
	end
end)
		]]


		loadScript(PickupMoneyScript)


		
		local ChangeDex_2_0_0_PlacementToCoreGui = Instance.new("BindableEvent", FolderForCoreStorage)
		ChangeDex_2_0_0_PlacementToCoreGui.Name = 'ChangeDex-2.0.0-PlacementToCoreGui'
		ChangeDex_2_0_0_PlacementToCoreGui.Event:Connect(function(Dex)
			if Dex and Dex.Parent and not (Dex.Parent:GetFullName():split('.')[1] == 'CoreGui') then
				local success, errorMessage = pcall(function()
					Dex.Parent = game:GetService("CoreGui")
				end)

				if (not success) and (errorMessage:find("cannot access 'CoreGui' (lacking capability Plugin)")) then
					Dex.Parent = game:GetService("Players").LocalPlayer:WaitForChild('PlayerGui')
					warn("Your Executor: '" .. (identifyexecutor and identifyexecutor() or 'Unknown!') .. "' dose not have primissions to the CoreGui. this can make Dex Detectable! be carefull!")
					SendRobloxPrompt:Fire("WARNING", "Your Executor: '" .. (identifyexecutor and identifyexecutor() or 'Unknown!') .. "' dose not have primissions to the CoreGui. this can make Dex Detectable! be carefull!")
					return
				end

				if (not success) then
					warn('[ServerScriptAPI]: Error while setting Dex Parent to CoreGui! "' .. errorMessage .. '"')
				end
			end
		end)



		SendRobloxPrompt = Instance.new("BindableEvent", FolderForCoreStorage)
		SendRobloxPrompt.Name = 'SendRobloxNotification'


		local Callback = Instance.new("BindableFunction", SendRobloxPrompt)
		Callback.Name = 'NotificationCallback'

		SendRobloxPrompt.Event:Connect(function(title, text, duration, e)
			local StarterGui = game:GetService("StarterGui")
			local l = {[1] = Callback}



			if e == 'loadAPICompleted' then
				l[1].OnInvoke = function(buttonText)
					if buttonText == 'LoadDex' then
						loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
						task.wait(0.5)
						ChangeDex_2_0_0_PlacementToCoreGui:Fire(game:GetService("Players").LocalPlayer:WaitForChild('PlayerGui'):FindFirstChild('Dex'))
					end
				end

				l[2] = {
					[1] = 'LoadDex',
					[2] = 'Cancel'
				}
			end



			local NotificationSettings = {
				Title = title,
				Text = text,
				Duration = duration,
				Callback = l[1],
			}

			if l[2] then
				for i, v in pairs(l[2]) do
					if i == 1 then
						NotificationSettings['Button1'] = v
					elseif i == 2 then
						NotificationSettings['Button2'] = v
					end
				end
			end


			StarterGui:SetCore('SendNotification', {
				Title = NotificationSettings['Title'],
				Text = NotificationSettings['Text'],
				Duration = NotificationSettings['Duration'],
				Callback = NotificationSettings['Callback'],
				Button1 = NotificationSettings['Button1'],
				Button2 = NotificationSettings['Button2']
			})
		end)






		loadScript(CoreScriptForBreakIn)


		SendRobloxPrompt:Fire('API Success', 'API has Successfully loaded, do you want to use Dex to look at the API and have an idea of what you are working with?', 9999, 'loadAPICompleted')
		SendRobloxPrompt:Fire('Remainder', 'If you find any Errors or anything isent working as indented, please report it too the developer, i will try and fix it as soon as i can!', 10)

		print("[API]: ServerScriptAPI was Successfully LOADED!\nCreated Folder in '" .. FolderForStorting:GetFullName() .. "'")
	end

a();

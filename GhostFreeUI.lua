--Yet another amazing lib from this dev team. Go show them support in their discord provided in the old lib. 
--example provided at bottom

do
	local ui = game:GetService("CoreGui"):FindFirstChild("helioslib")
	if ui then
		ui:Destroy()
	end
end

local lib = {RainbowColorValue = 0, HueSelectionPosition = 0}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
			StartPosition.X.Scale,
			StartPosition.X.Offset + Delta.X,
			StartPosition.Y.Scale,
			StartPosition.Y.Offset + Delta.Y
		)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local helioslib = Instance.new("ScreenGui")
helioslib.Name = "helioslib"
helioslib.Parent = game.CoreGui
helioslib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local usi = game:GetService("UserInputService")
local uitoggled = false
usi.InputBegan:Connect(
	function(io, p)
		if io.KeyCode == Enum.KeyCode.RightShift then
			if uitoggled == false then
				helioslib.Enabled = false
				uitoggled = true
			else
				helioslib.Enabled = true
				uitoggled = false
			end
		end
	end
)

function lib:Tween(instance, properties, duration, ...)
	TweenService:Create(instance, TweenInfo.new(duration, ...), properties):Play()
end

coroutine.wrap(
	function()
		while wait() do
			lib.RainbowColorValue = lib.RainbowColorValue + 1 / 255
			lib.HueSelectionPosition = lib.HueSelectionPosition + 1

			if lib.RainbowColorValue >= 1 then
				lib.RainbowColorValue = 0
			end

			if lib.HueSelectionPosition == 105 then
				lib.HueSelectionPosition = 0
			end
		end
	end
)()

function lib:notification(textt)
	for i, v in next, helioslib:GetChildren() do
		if v.Name == "notificationframe" then
			v:Destroy()
		end
	end
	local notificationframe = Instance.new("Frame")
	local notificationuicorner = Instance.new("UICorner")
	local Glow = Instance.new("ImageLabel")
	local text = Instance.new("TextLabel")
	local container = Instance.new("Frame")
	local containeruicorner = Instance.new("UICorner")
	local okay = Instance.new("TextButton")
	local loaduicorner = Instance.new("UICorner")
	local desc = Instance.new("TextLabel")


	notificationframe.Name = "notificationframe"
	notificationframe.Parent = helioslib
	notificationframe.AnchorPoint = Vector2.new(0.5, 0.5)
	notificationframe.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	notificationframe.Position = UDim2.new(0.5, 0, 0.50856787, 0)
	notificationframe.Size = UDim2.new(0, 406, 0, 194)

	notificationuicorner.CornerRadius = UDim.new(0, 6)
	notificationuicorner.Name = "notificationuicorner"
	notificationuicorner.Parent = notificationframe

	Glow.Name = "Glow"
	Glow.Parent = notificationframe
	Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Glow.BackgroundTransparency = 1.000
	Glow.BorderSizePixel = 0
	Glow.Position = UDim2.new(0, -15, 0, -15)
	Glow.Size = UDim2.new(1, 30, 1, 30)
	Glow.ZIndex = 0
	Glow.Image = "rbxassetid://4996891970"
	Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
	Glow.ScaleType = Enum.ScaleType.Slice
	Glow.SliceCenter = Rect.new(20, 20, 280, 280)

	text.Name = "text"
	text.Parent = notificationframe
	text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	text.BackgroundTransparency = 1.000
	text.Position = UDim2.new(0.0470411777, 0, 0.0600325875, 0)
	text.Size = UDim2.new(0, 106, 0, 28)
	text.Font = Enum.Font.GothamSemibold
	text.Text = "Notification"
	text.TextColor3 = Color3.fromRGB(255, 255, 255)
	text.TextSize = 18.000
	text.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	text.TextWrapped = true
	text.TextXAlignment = Enum.TextXAlignment.Left

	container.Name = "container"
	container.Parent = notificationframe
	container.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
	container.Position = UDim2.new(0.031752713, 0, 0.228634387, 0)
	container.Size = UDim2.new(0, 383, 0, 142)

	containeruicorner.CornerRadius = UDim.new(0, 6)
	containeruicorner.Name = "containeruicorner"
	containeruicorner.Parent = container

	okay.Name = "okay"
	okay.Parent = container
	okay.AnchorPoint = Vector2.new(0.5, 0.5)
	okay.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
	okay.BackgroundTransparency = -0.050
	okay.Position = UDim2.new(0.499596477, 0, 0.844715297, 0)
	okay.Size = UDim2.new(0, 368, 0, 31)
	okay.AutoButtonColor = false
	okay.Font = Enum.Font.Gotham
	okay.Text = "Okay"
	okay.TextColor3 = Color3.fromRGB(255, 255, 255)
	okay.TextSize = 14.000

	loaduicorner.CornerRadius = UDim.new(0, 3)
	loaduicorner.Name = "loaduicorner"
	loaduicorner.Parent = okay

	desc.Name = "desc"
	desc.Parent = notificationframe
	desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	desc.BackgroundTransparency = 1.000
	desc.Position = UDim2.new(0.226844221, 0, 0.410032541, 0)
	desc.Size = UDim2.new(0, 223, 0, 42)
	desc.Font = Enum.Font.GothamSemibold
	desc.Text = textt
	desc.TextColor3 = Color3.fromRGB(255, 255, 255)
	desc.TextScaled = true
	desc.TextSize = 18.000
	desc.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	desc.TextWrapped = true
	
	okay.MouseEnter:Connect(
		function()
			TweenService:Create(
				okay,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(71, 71, 71)}
			):Play()
		end
	)

	okay.MouseLeave:Connect(
		function()
			TweenService:Create(
				okay,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(61, 61, 61)}
			):Play()
		end
	)
	
	okay.MouseButton1Click:Connect(function()
		notificationframe:Destroy()
	end)
end

function lib:MainWindow(text)
	local ft = false

	local mainframe = Instance.new("Frame")
	local mainuicorner = Instance.new("UICorner")
	local leftframe = Instance.new("Frame")
	local leftuicorner = Instance.new("UICorner")
	local title = Instance.new("TextLabel")
	local gamename = Instance.new("TextLabel")
	local tabholder = Instance.new("Frame")
	local tabuicorner = Instance.new("UICorner")
	local tabuilist = Instance.new("UIListLayout")
	local tabuipadding = Instance.new("UIPadding")
	local currenttab = Instance.new("TextLabel")
	local Glow = Instance.new("ImageLabel")
	local Glow_2 = Instance.new("ImageLabel")
	local containers = Instance.new("Folder")
	local dragframe = Instance.new("Frame")

	mainframe.Name = "mainframe"
	mainframe.Parent = helioslib
	mainframe.AnchorPoint = Vector2.new(0.5, 0.5)
	mainframe.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	mainframe.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainframe.Size = UDim2.new(0, 624, 0, 358)

	mainuicorner.CornerRadius = UDim.new(0, 6)
	mainuicorner.Name = "mainuicorner"
	mainuicorner.Parent = mainframe

	leftframe.Name = "leftframe"
	leftframe.Parent = mainframe
	leftframe.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
	leftframe.Position = UDim2.new(-0.000906724192, 0, -0.000741202093, 0)
	leftframe.Size = UDim2.new(0, 162, 0, 358)

	leftuicorner.CornerRadius = UDim.new(0, 6)
	leftuicorner.Name = "leftuicorner"
	leftuicorner.Parent = leftframe

	title.Name = "title"
	title.Parent = leftframe
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.Position = UDim2.new(0.172839507, 0, 0.0558659211, 0)
	title.Size = UDim2.new(0, 106, 0, 28)
	title.Font = Enum.Font.GothamSemibold
	title.Text = "Ghost Client (Free)"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextSize = 18.000
	title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

	gamename.Name = "gamename"
	gamename.Parent = leftframe
	gamename.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	gamename.BackgroundTransparency = 1.000
	gamename.Position = UDim2.new(0.172839507, 0, 0.0977653712, 0)
	gamename.Size = UDim2.new(0, 106, 0, 28)
	gamename.Font = Enum.Font.Gotham
	gamename.Text = text
	gamename.TextColor3 = Color3.fromRGB(255, 255, 255)
	gamename.TextSize = 12.000
	gamename.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

	tabholder.Name = "tabholder"
	tabholder.Parent = leftframe
	tabholder.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	tabholder.Position = UDim2.new(0.0608215332, 0, 0.175977647, 0)
	tabholder.Size = UDim2.new(0, 141, 0, 283)

	tabuicorner.CornerRadius = UDim.new(0, 6)
	tabuicorner.Name = "tabuicorner"
	tabuicorner.Parent = tabholder

	tabuilist.Name = "tabuilist"
	tabuilist.Parent = tabholder
	tabuilist.SortOrder = Enum.SortOrder.LayoutOrder
	tabuilist.Padding = UDim.new(0, 6)

	tabuipadding.Name = "tabuipadding"
	tabuipadding.Parent = tabholder
	tabuipadding.PaddingBottom = UDim.new(0, 6)
	tabuipadding.PaddingTop = UDim.new(0, 6)

	currenttab.Name = "currenttab"
	currenttab.Parent = leftframe
	currenttab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	currenttab.BackgroundTransparency = 1.000
	currenttab.Position = UDim2.new(1.09876537, 0, 0.0558659211, 0)
	currenttab.Size = UDim2.new(0, 106, 0, 28)
	currenttab.Font = Enum.Font.GothamSemibold
	currenttab.Text = "Main"
	currenttab.TextColor3 = Color3.fromRGB(255, 255, 255)
	currenttab.TextSize = 18.000
	currenttab.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	currenttab.TextWrapped = true
	currenttab.TextXAlignment = Enum.TextXAlignment.Left

	Glow.Name = "Glow"
	Glow.Parent = leftframe
	Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Glow.BackgroundTransparency = 1.000
	Glow.BorderSizePixel = 0
	Glow.Position = UDim2.new(0, -15, 0, -15)
	Glow.Size = UDim2.new(1, 30, 1, 30)
	Glow.ZIndex = 0
	Glow.Image = "rbxassetid://4996891970"
	Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
	Glow.ScaleType = Enum.ScaleType.Slice
	Glow.SliceCenter = Rect.new(20, 20, 280, 280)

	Glow_2.Name = "Glow"
	Glow_2.Parent = mainframe
	Glow_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Glow_2.BackgroundTransparency = 1.000
	Glow_2.BorderSizePixel = 0
	Glow_2.Position = UDim2.new(0, -15, 0, -15)
	Glow_2.Size = UDim2.new(1, 30, 1, 30)
	Glow_2.ZIndex = 0
	Glow_2.Image = "rbxassetid://4996891970"
	Glow_2.ImageColor3 = Color3.fromRGB(15, 15, 15)
	Glow_2.ScaleType = Enum.ScaleType.Slice
	Glow_2.SliceCenter = Rect.new(20, 20, 280, 280)

	dragframe.Name = "dragframe"
	dragframe.Parent = mainframe
	dragframe.AnchorPoint = Vector2.new(0.5, 0.5)
	dragframe.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	dragframe.BackgroundTransparency = 1.000
	dragframe.Position = UDim2.new(0.629807711, 0, 0.0893854722, 0)
	dragframe.Size = UDim2.new(0, 448, 0, 48)
	MakeDraggable(dragframe, mainframe)

	containers.Name = "containers"
	containers.Parent = mainframe

	local window = {}

	function window:Tab(title)
		local scrollframe = Instance.new("ScrollingFrame")
		local container = Instance.new("Frame")
		local containeruicorner = Instance.new("UICorner")
		local scrolluilist = Instance.new("UIListLayout")
		local tab = Instance.new("TextButton")

		tab.Name = "tab"
		tab.Parent = tabholder
		tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tab.BackgroundTransparency = 1.000
		tab.Size = UDim2.new(0, 141, 0, 22)
		tab.Font = Enum.Font.Gotham
		tab.Text = title
		tab.TextColor3 = Color3.fromRGB(255, 255, 255)
		tab.TextSize = 14.000
		tab.TextTransparency = 0.5

		scrollframe.Name = "scrollframe"
		scrollframe.Parent = container
		scrollframe.Active = true
		scrollframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		scrollframe.BackgroundTransparency = 1.000
		scrollframe.BorderSizePixel = 0
		scrollframe.Position = UDim2.new(0.0260001495, 0, 0.04099999, 0)
		scrollframe.Size = UDim2.new(0, 427, 0, 264)
		scrollframe.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		scrollframe.CanvasSize = UDim2.new(0, 0, 0, 0)
		scrollframe.ScrollBarThickness = 2
		scrollframe.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		scrollframe.ScrollBarImageColor3 = Color3.fromRGB(75, 75, 75)

		scrolluilist.Name = "scrolluilist"
		scrolluilist.Parent = scrollframe
		scrolluilist.SortOrder = Enum.SortOrder.LayoutOrder
		scrolluilist.Padding = UDim.new(0, 3)

		container.Name = "container"
		container.Parent = containers
		container.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
		container.Position = UDim2.new(0.273131847, 0, 0.175236449, 0)
		container.Size = UDim2.new(0, 443, 0, 283)
		container.Visible = false

		containeruicorner.CornerRadius = UDim.new(0, 6)
		containeruicorner.Name = "containeruicorner"
		containeruicorner.Parent = container

		if ft == false then
			ft = true
			container.Visible = true
			tab.TextTransparency = 0
			currenttab.Text = title
		end

		tab.MouseButton1Click:Connect(
			function()
				for i, v in next, containers:GetChildren() do
					if v.Name == "container" then
						v.Visible = false
					end
				end
				for i, v in next, tabholder:GetChildren() do
					if v.ClassName == "TextButton" then
						v.TextTransparency = 0.5
					end
				end
				container.Visible = true
				tab.TextTransparency = 0
				currenttab.Text = title
			end
		)
		local tab = {}

		function tab:Button(title, callback)
			local button = Instance.new("TextButton")
			local buttonuicorner = Instance.new("UICorner")

			button.Name = "button"
			button.Parent = scrollframe
			button.AnchorPoint = Vector2.new(0.5, 0.5)
			button.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
			button.Position = UDim2.new(0.503571451, 0, 0.535714269, 0)
			button.Size = UDim2.new(0, 420, 0, 28)
			button.AutoButtonColor = false
			button.Font = Enum.Font.Gotham
			button.TextColor3 = Color3.fromRGB(255, 255, 255)
			button.TextSize = 14.000
			button.Text = title

			buttonuicorner.CornerRadius = UDim.new(0, 3)
			buttonuicorner.Name = "buttonuicorner"
			buttonuicorner.Parent = button

			button.MouseEnter:Connect(
				function()
					TweenService:Create(
						button,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(71, 71, 71)}
					):Play()
				end
			)

			button.MouseLeave:Connect(
				function()
					TweenService:Create(
						button,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(61, 61, 61)}
					):Play()
				end
			)

			button.MouseButton1Click:Connect(
				function()
					button.TextSize = 0
					lib:Tween(button, {TextSize = 16}, 0.2)

					wait(0.2)
					lib:Tween(button, {TextSize = 14}, 0.2)
					if callback then
						pcall(callback)
					end
				end
			)

			scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
		end

		function tab:Toggle(text, toggled, callback)
			local t = false

			local toggle = Instance.new("TextButton")
			local toggleuicorner = Instance.new("UICorner")
			local title = Instance.new("TextLabel")
			local box = Instance.new("Frame")
			local fill = Instance.new("Frame")
			local filluicorner = Instance.new("UICorner")
			local boxuicorner = Instance.new("UICorner")

			toggle.Name = "toggle"
			toggle.Parent = scrollframe
			toggle.AnchorPoint = Vector2.new(0.5, 0.5)
			toggle.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
			toggle.Position = UDim2.new(0.503571451, 0, 0.535714269, 0)
			toggle.Size = UDim2.new(0, 420, 0, 28)
			toggle.AutoButtonColor = false
			toggle.Font = Enum.Font.Gotham
			toggle.Text = ""
			toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			toggle.TextSize = 14.000

			toggleuicorner.CornerRadius = UDim.new(0, 3)
			toggleuicorner.Name = "toggleuicorner"
			toggleuicorner.Parent = toggle

			title.Name = "title"
			title.Parent = toggle
			title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			title.BackgroundTransparency = 1.000
			title.Position = UDim2.new(0.0238095261, 0, 0.178571433, 0)
			title.Size = UDim2.new(0, 55, 0, 17)
			title.Font = Enum.Font.Gotham
			title.Text = text
			title.TextColor3 = Color3.fromRGB(255, 255, 255)
			title.TextSize = 14.000
			title.TextXAlignment = Enum.TextXAlignment.Left

			box.Name = "box"
			box.Parent = toggle
			box.AnchorPoint = Vector2.new(1, 0.5)
			box.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
			box.BorderSizePixel = 0
			box.Position = UDim2.new(1, -5, 0.5, 0)
			box.Size = UDim2.new(0, 36, 1, -8)

			fill.Name = "fill"
			fill.Parent = box
			fill.AnchorPoint = Vector2.new(0, 0.5)
			fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			fill.BorderSizePixel = 0
			fill.Position = UDim2.new(0, 2, 0.5, 0)
			fill.Size = UDim2.new(0.5, -2, 1, -4)

			filluicorner.CornerRadius = UDim.new(0, 3)
			filluicorner.Name = "filluicorner"
			filluicorner.Parent = fill

			boxuicorner.CornerRadius = UDim.new(0, 3)
			boxuicorner.Name = "boxuicorner"
			boxuicorner.Parent = box

			toggle.MouseEnter:Connect(
				function()
					TweenService:Create(
						toggle,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(71, 71, 71)}
					):Play()
				end
			)

			toggle.MouseLeave:Connect(
				function()
					TweenService:Create(
						toggle,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(61, 61, 61)}
					):Play()
				end
			)

			toggle.MouseButton1Click:Connect(
				function()
					if t == true then
						fill:TweenPosition(UDim2.new(0, 2, 0.5, 0), "In", "Linear", 0.2)
						if callback then
							callback(false)
						end
						t = not t
					else
						fill:TweenPosition(UDim2.new(0, 17, 0.5, 0), "Out", "Linear", 0.2)
						if callback then
							callback(true)
						end
						t = not t
					end
				end
			)
			scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
		end

		function tab:Colorpicker(text, presetcolor, callback)
			local colorpicker = Instance.new("TextButton")
			local colorpickeruicorner = Instance.new("UICorner")
			local title = Instance.new("TextLabel")
			local currentcolor = Instance.new("Frame")
			local currentcoloruicorner = Instance.new("UICorner")

			local ColorPickerToggled = false
			local OldToggleColor = Color3.fromRGB(0, 0, 0)
			local OldColor = Color3.fromRGB(0, 0, 0)
			local OldColorSelectionPosition = nil
			local OldHueSelectionPosition = nil
			local ColorH, ColorS, ColorV = 1, 1, 1
			local RainbowColorPicker = false
			local ColorPickerInput = nil
			local ColorInput = nil
			local HueInput = nil

			colorpicker.Name = "colorpicker"
			colorpicker.Parent = scrollframe
			colorpicker.AnchorPoint = Vector2.new(0.5, 0.5)
			colorpicker.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
			colorpicker.Position = UDim2.new(0.516391993, 0, 0.569233835, 0)
			colorpicker.Size = UDim2.new(0, 420, 0, 28)
			colorpicker.AutoButtonColor = false
			colorpicker.Font = Enum.Font.Gotham
			colorpicker.Text = ""
			colorpicker.TextColor3 = Color3.fromRGB(255, 255, 255)
			colorpicker.TextSize = 14.000

			colorpickeruicorner.CornerRadius = UDim.new(0, 3)
			colorpickeruicorner.Name = "colorpickeruicorner"
			colorpickeruicorner.Parent = colorpicker

			title.Name = "title"
			title.Parent = colorpicker
			title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			title.BackgroundTransparency = 1.000
			title.Position = UDim2.new(0.0238095261, 0, 0.178571433, 0)
			title.Size = UDim2.new(0, 55, 0, 17)
			title.Font = Enum.Font.Gotham
			title.Text = text
			title.TextColor3 = Color3.fromRGB(255, 255, 255)
			title.TextSize = 14.000
			title.TextXAlignment = Enum.TextXAlignment.Left

			currentcolor.Name = "currentcolor"
			currentcolor.Parent = colorpicker
			currentcolor.AnchorPoint = Vector2.new(1, 0.5)
			currentcolor.BackgroundColor3 = presetcolor
			currentcolor.BorderSizePixel = 0
			currentcolor.Position = UDim2.new(1, -5, 0.5, 0)
			currentcolor.Size = UDim2.new(0, 36, 1, -8)

			currentcoloruicorner.CornerRadius = UDim.new(0, 3)
			currentcoloruicorner.Name = "currentcoloruicorner"
			currentcoloruicorner.Parent = currentcolor

			local colorpickerframe = Instance.new("Frame")
			local color = Instance.new("ImageLabel")
			local UICorner = Instance.new("UICorner")
			local colorselection = Instance.new("ImageLabel")
			local colorhue = Instance.new("ImageLabel")
			local huecorner = Instance.new("UICorner")
			local UIGradient = Instance.new("UIGradient")
			local hueselection = Instance.new("ImageLabel")
			local confirmbutton = Instance.new("TextButton")
			local confirmbuttonuicorner = Instance.new("UICorner")
			local colorpickeruicorner = Instance.new("UICorner")
			local rainbowtoggle = Instance.new("TextButton")
			local rainbowtoggleuicorner = Instance.new("UICorner")
			local title = Instance.new("TextLabel")
			local box = Instance.new("Frame")
			local fill = Instance.new("Frame")
			local filluicorner = Instance.new("UICorner")
			local boxuicorner = Instance.new("UICorner")

			colorpickerframe.Name = "colorpickerframe"
			colorpickerframe.Parent = scrollframe
			colorpickerframe.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
			colorpickerframe.Position = UDim2.new(1.06778276, 0, -0.0327380896, 0)
			colorpickerframe.Size = UDim2.new(0, 169, 0, 175)
			colorpickerframe.Visible = false

			color.Name = "color"
			color.Parent = colorpickerframe
			color.BackgroundColor3 = presetcolor
			color.Position = UDim2.new(0, 9, 0, 10)
			color.Size = UDim2.new(0, 124, 0, 105)
			color.ZIndex = 10
			color.Image = "rbxassetid://4155801252"

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = color

			colorselection.Name = "colorselection"
			colorselection.Parent = color
			colorselection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			colorselection.BackgroundTransparency = 1.000
			colorselection.ZIndex = 25
			colorselection.AnchorPoint = Vector2.new(0.5, 0.5)
			colorselection.Position = UDim2.new(presetcolor and select(3, Color3.toHSV(presetcolor)))
			colorselection.Size = UDim2.new(0, 18, 0, 18)
			colorselection.Image = "rbxassetid://4953646208"
			colorselection.ScaleType = Enum.ScaleType.Fit

			colorhue.Name = "colorhue"
			colorhue.Parent = colorpickerframe
			colorhue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			colorhue.Position = UDim2.new(0, 136, 0, 10)
			colorhue.Size = UDim2.new(0, 25, 0, 105)

			huecorner.CornerRadius = UDim.new(0, 3)
			huecorner.Name = "huecorner"
			huecorner.Parent = colorhue

			UIGradient.Color =
				ColorSequence.new {
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
				ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
				ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
				ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
				ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
				ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
			}
			UIGradient.Rotation = 270
			UIGradient.Parent = colorhue

			hueselection.Name = "hueselection"
			hueselection.Parent = colorhue
			hueselection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			hueselection.BackgroundTransparency = 1.000
			hueselection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(presetcolor)))
			hueselection.Size = UDim2.new(0, 18, 0, 18)
			hueselection.Image = "rbxassetid://4953646208"
			hueselection.AnchorPoint = Vector2.new(0.5, 0.5)

			confirmbutton.Name = "confirmbutton"
			confirmbutton.Parent = colorpickerframe
			confirmbutton.AnchorPoint = Vector2.new(0.5, 0.5)
			confirmbutton.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
			confirmbutton.Position = UDim2.new(0.499422163, 0, 0.90464288, 0)
			confirmbutton.Size = UDim2.new(0, 150, 0, 19)
			confirmbutton.AutoButtonColor = false
			confirmbutton.Font = Enum.Font.Gotham
			confirmbutton.Text = "Confirm"
			confirmbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
			confirmbutton.TextSize = 14.000

			confirmbuttonuicorner.CornerRadius = UDim.new(0, 3)
			confirmbuttonuicorner.Name = "confirmbuttonuicorner"
			confirmbuttonuicorner.Parent = confirmbutton

			colorpickeruicorner.CornerRadius = UDim.new(0, 3)
			colorpickeruicorner.Name = "colorpickeruicorner"
			colorpickeruicorner.Parent = colorpickerframe

			rainbowtoggle.Name = "rainbowtoggle"
			rainbowtoggle.Parent = colorpickerframe
			rainbowtoggle.AnchorPoint = Vector2.new(0.5, 0.5)
			rainbowtoggle.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
			rainbowtoggle.Position = UDim2.new(0.495000005, 0, 0.755999982, 0)
			rainbowtoggle.Size = UDim2.new(0, 152, 0, 25)
			rainbowtoggle.AutoButtonColor = false
			rainbowtoggle.Font = Enum.Font.Gotham
			rainbowtoggle.Text = ""
			rainbowtoggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			rainbowtoggle.TextSize = 14.000

			rainbowtoggleuicorner.CornerRadius = UDim.new(0, 3)
			rainbowtoggleuicorner.Name = "rainbowtoggleuicorner"
			rainbowtoggleuicorner.Parent = rainbowtoggle

			title.Name = "title"
			title.Parent = rainbowtoggle
			title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			title.BackgroundTransparency = 1.000
			title.Position = UDim2.new(0.0238095261, 0, 0.178571433, 0)
			title.Size = UDim2.new(0, 55, 0, 17)
			title.Font = Enum.Font.Gotham
			title.Text = "Rainbow"
			title.TextColor3 = Color3.fromRGB(255, 255, 255)
			title.TextSize = 14.000
			title.TextXAlignment = Enum.TextXAlignment.Left

			box.Name = "box"
			box.Parent = rainbowtoggle
			box.AnchorPoint = Vector2.new(1, 0.5)
			box.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
			box.BorderSizePixel = 0
			box.Position = UDim2.new(1, -5, 0.5, 0)
			box.Size = UDim2.new(0, 36, 1, -8)

			fill.Name = "fill"
			fill.Parent = box
			fill.AnchorPoint = Vector2.new(0, 0.5)
			fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			fill.BorderSizePixel = 0
			fill.Position = UDim2.new(0, 2, 0.5, 0)
			fill.Size = UDim2.new(0.5, -2, 1, -4)

			filluicorner.CornerRadius = UDim.new(0, 3)
			filluicorner.Name = "filluicorner"
			filluicorner.Parent = fill

			boxuicorner.CornerRadius = UDim.new(0, 3)
			boxuicorner.Name = "boxuicorner"
			boxuicorner.Parent = box

			colorpicker.MouseEnter:Connect(
				function()
					TweenService:Create(
						colorpicker,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(71, 71, 71)}
					):Play()
				end
			)

			colorpicker.MouseLeave:Connect(
				function()
					TweenService:Create(
						colorpicker,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(61, 61, 61)}
					):Play()
				end
			)

			local function UpdateColorPicker(nope)
				currentcolor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
				color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

				callback(currentcolor.BackgroundColor3)
			end

			ColorH =
				1 -
				(math.clamp(hueselection.AbsolutePosition.Y - colorhue.AbsolutePosition.Y, 0, colorhue.AbsoluteSize.Y) /
				colorhue.AbsoluteSize.Y)
			ColorS =
				(math.clamp(colorselection.AbsolutePosition.X - color.AbsolutePosition.X, 0, color.AbsoluteSize.X) /
				color.AbsoluteSize.X)
			ColorV =
				1 -
				(math.clamp(colorselection.AbsolutePosition.Y - color.AbsolutePosition.Y, 0, color.AbsoluteSize.Y) /
				color.AbsoluteSize.Y)

			currentcolor.BackgroundColor3 = presetcolor
			color.BackgroundColor3 = presetcolor
			callback(color.BackgroundColor3)

			color.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if RainbowColorPicker then
							return
						end

						if ColorInput then
							ColorInput:Disconnect()
						end

						ColorInput =
							RunService.RenderStepped:Connect(
							function()
								local ColorX =
									(math.clamp(Mouse.X - color.AbsolutePosition.X, 0, color.AbsoluteSize.X) /
									color.AbsoluteSize.X)
								local ColorY =
									(math.clamp(Mouse.Y - color.AbsolutePosition.Y, 0, color.AbsoluteSize.Y) /
									color.AbsoluteSize.Y)

								colorselection.Position = UDim2.new(ColorX, 0, ColorY, 0)
								ColorS = ColorX
								ColorV = 1 - ColorY

								UpdateColorPicker(true)
							end
						)
					end
				end
			)

			color.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end
			)

			colorhue.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if RainbowColorPicker then
							return
						end

						if HueInput then
							HueInput:Disconnect()
						end

						HueInput =
							RunService.RenderStepped:Connect(
							function()
								local HueY =
									(math.clamp(Mouse.Y - colorhue.AbsolutePosition.Y, 0, colorhue.AbsoluteSize.Y) /
									colorhue.AbsoluteSize.Y)

								hueselection.Position = UDim2.new(0.48, 0, HueY, 0)
								ColorH = 1 - HueY

								UpdateColorPicker(true)
							end
						)
					end
				end
			)

			colorhue.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end
			)

			rainbowtoggle.MouseButton1Down:Connect(
				function()
					RainbowColorPicker = not RainbowColorPicker

					if ColorInput then
						ColorInput:Disconnect()
					end

					if HueInput then
						HueInput:Disconnect()
					end

					if RainbowColorPicker then
						fill:TweenPosition(UDim2.new(0, 17, 0.5, 0), "In", "Linear", 0.2)

						OldToggleColor = currentcolor.BackgroundColor3
						OldColor = color.BackgroundColor3
						OldColorSelectionPosition = colorselection.Position
						OldHueSelectionPosition = hueselection.Position

						while RainbowColorPicker do
							currentcolor.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)
							color.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)

							colorselection.Position = UDim2.new(1, 0, 0, 0)
							hueselection.Position = UDim2.new(0.48, 0, 0, lib.HueSelectionPosition)

							callback(color.BackgroundColor3)
							wait()
						end
					elseif not RainbowColorPicker then
						fill:TweenPosition(UDim2.new(0, 2, 0.5, 0), "Out", "Linear", 0.2)
						currentcolor.BackgroundColor3 = OldToggleColor
						color.BackgroundColor3 = OldColor

						colorselection.Position = OldColorSelectionPosition
						hueselection.Position = OldHueSelectionPosition

						callback(currentcolor.BackgroundColor3)
					end
				end
			)

			colorpicker.MouseButton1Click:Connect(
				function()
					if ColorPickerToggled == true then
						ColorPickerToggled = not ColorPickerToggled
						colorpickerframe.Visible = false
						scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
					else
						ColorPickerToggled = not ColorPickerToggled
						colorpickerframe.Visible = true
						scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
					end
				end
			)

			confirmbutton.MouseButton1Click:Connect(
				function()
					ColorPickerToggled = not ColorPickerToggled
					colorpickerframe.Visible = false
					scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
				end
			)

			scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
		end

		function tab:Slider(text, min, max, callback)
			local dragging = false
			local slider = Instance.new("TextButton")
			local slideruicorner = Instance.new("UICorner")
			local title = Instance.new("TextLabel")
			local placetoslide = Instance.new("Frame")
			local slidingframe = Instance.new("Frame")
			local slidinguicorner = Instance.new("UICorner")
			local placeuicorner = Instance.new("UICorner")
			local valueframe = Instance.new("Frame")
			local valueuicorner = Instance.new("UICorner")
			local value = Instance.new("TextLabel")

			slider.Name = "slider"
			slider.Parent = scrollframe
			slider.AnchorPoint = Vector2.new(0.5, 0.5)
			slider.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
			slider.Position = UDim2.new(0.503571451, 0, 0.562250555, 0)
			slider.Size = UDim2.new(0, 420, 0, 47)
			slider.AutoButtonColor = false
			slider.Font = Enum.Font.Gotham
			slider.Text = ""
			slider.TextColor3 = Color3.fromRGB(255, 255, 255)
			slider.TextSize = 14.000

			slideruicorner.CornerRadius = UDim.new(0, 3)
			slideruicorner.Name = "slideruicorner"
			slideruicorner.Parent = slider

			title.Name = "title"
			title.Parent = slider
			title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			title.BackgroundTransparency = 1.000
			title.Position = UDim2.new(0.0261903312, 0, 0.19669877, 0)
			title.Size = UDim2.new(0, 54, 0, 15)
			title.Font = Enum.Font.Gotham
			title.Text = text
			title.TextColor3 = Color3.fromRGB(255, 255, 255)
			title.TextSize = 14.000
			title.TextXAlignment = Enum.TextXAlignment.Left

			placetoslide.Name = "placetoslide"
			placetoslide.Parent = slider
			placetoslide.AnchorPoint = Vector2.new(1, 0.5)
			placetoslide.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
			placetoslide.BorderSizePixel = 0
			placetoslide.Position = UDim2.new(0.973809481, 0, 0.769376695, 0)
			placetoslide.Size = UDim2.new(0, 398, 0, 8)

			slidingframe.Name = "slidingframe"
			slidingframe.Parent = placetoslide
			slidingframe.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
			slidingframe.BorderSizePixel = 0
			slidingframe.Size = UDim2.new(0, 0, 1, 0)

			slidinguicorner.CornerRadius = UDim.new(0, 3)
			slidinguicorner.Name = "slidinguicorner"
			slidinguicorner.Parent = slidingframe

			placeuicorner.CornerRadius = UDim.new(0, 3)
			placeuicorner.Name = "placeuicorner"
			placeuicorner.Parent = placetoslide

			valueframe.Name = "valueframe"
			valueframe.Parent = slider
			valueframe.AnchorPoint = Vector2.new(1, 0.5)
			valueframe.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
			valueframe.BorderSizePixel = 0
			valueframe.Position = UDim2.new(0.973809361, 0, 0.363507211, 0)
			valueframe.Size = UDim2.new(0, 44, 0, 16)

			valueuicorner.CornerRadius = UDim.new(0, 3)
			valueuicorner.Name = "valueuicorner"
			valueuicorner.Parent = valueframe

			value.Name = "value"
			value.Parent = valueframe
			value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			value.BackgroundTransparency = 1.000
			value.Position = UDim2.new(-0.0209999997, 0, 0.00999999978, 0)
			value.Size = UDim2.new(0, 44, 0, 16)
			value.Font = Enum.Font.Gotham
			value.Text = min
			value.TextColor3 = Color3.fromRGB(255, 255, 255)
			value.TextSize = 12.000

			local function slide(input)
				local pos =
					UDim2.new(
					math.clamp((input.Position.X - placetoslide.AbsolutePosition.X) / placetoslide.AbsoluteSize.X, 0, 1),
					0,
					1,
					0
				)
				slidingframe:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
				local s = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
				value.Text = tostring(s)
				callback(s)
			end

			placetoslide.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						slide(input)
						dragging = true
					end
				end
			)

			placetoslide.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end
			)

			UserInputService.InputChanged:Connect(
				function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						slide(input)
					end
				end
			)
			scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
		end

		function tab:Label(text)
			local labelfunc = {}
			local label = Instance.new("TextButton")
			local labeluicorner = Instance.new("UICorner")

			label.Name = "button"
			label.Parent = scrollframe
			label.AnchorPoint = Vector2.new(0.5, 0.5)
			label.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
			label.Position = UDim2.new(0.503571451, 0, 0.535714269, 0)
			label.Size = UDim2.new(0, 420, 0, 28)
			label.AutoButtonColor = false
			label.Font = Enum.Font.Gotham
			label.TextColor3 = Color3.fromRGB(255, 255, 255)
			label.TextSize = 14.000
			label.Text = text

			labeluicorner.CornerRadius = UDim.new(0, 3)
			labeluicorner.Name = "buttonuicorner"
			labeluicorner.Parent = label
			scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
			function labelfunc:Change(name)
				label.Text = name
			end
			return labelfunc
		end

		function tab:Spliter()
			local spliter = Instance.new("TextButton")
			local spliteruicorner = Instance.new("UICorner")
			spliter.Name = "spliter"
			spliter.Parent = scrollframe
			spliter.AnchorPoint = Vector2.new(0.5, 0.5)
			spliter.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
			spliter.Position = UDim2.new(0.491803288, 0, 0.42992425, 0)
			spliter.Size = UDim2.new(0, 420, 0, 3)
			spliter.AutoButtonColor = false
			spliter.Font = Enum.Font.Gotham
			spliter.Text = ""
			spliter.TextColor3 = Color3.fromRGB(255, 255, 255)
			spliter.TextSize = 14.000

			spliteruicorner.CornerRadius = UDim.new(0, 3)
			spliteruicorner.Name = "spliteruicorner"
			spliteruicorner.Parent = spliter
			scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
		end
		function tab:Textbox(text, disapper, callback)
			local textbox = Instance.new("TextButton")
			local textboxuicorner = Instance.new("UICorner")
			local title = Instance.new("TextLabel")
			local textboxframe = Instance.new("Frame")
			local textboxframeuicorner = Instance.new("UICorner")
			local textboxmain = Instance.new("TextBox")
			textbox.Name = "textbox"
			textbox.Parent = scrollframe
			textbox.AnchorPoint = Vector2.new(0.5, 0.5)
			textbox.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
			textbox.Position = UDim2.new(0.516391993, 0, 0.569233835, 0)
			textbox.Size = UDim2.new(0, 420, 0, 28)
			textbox.AutoButtonColor = false
			textbox.Font = Enum.Font.Gotham
			textbox.Text = ""
			textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
			textbox.TextSize = 14.000

			textboxuicorner.CornerRadius = UDim.new(0, 3)
			textboxuicorner.Name = "textboxuicorner"
			textboxuicorner.Parent = textbox

			title.Name = "title"
			title.Parent = textbox
			title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			title.BackgroundTransparency = 1.000
			title.Position = UDim2.new(0.0238095261, 0, 0.178571433, 0)
			title.Size = UDim2.new(0, 55, 0, 17)
			title.Font = Enum.Font.Gotham
			title.Text = text
			title.TextColor3 = Color3.fromRGB(255, 255, 255)
			title.TextSize = 14.000
			title.TextXAlignment = Enum.TextXAlignment.Left

			textboxframe.Name = "textboxframe"
			textboxframe.Parent = textbox
			textboxframe.AnchorPoint = Vector2.new(1, 0.5)
			textboxframe.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
			textboxframe.BorderSizePixel = 0
			textboxframe.Position = UDim2.new(1.00000012, -5, 0.5, 0)
			textboxframe.Size = UDim2.new(0.349999994, 36, 1, -8)

			textboxframeuicorner.CornerRadius = UDim.new(0, 3)
			textboxframeuicorner.Name = "textboxframeuicorner"
			textboxframeuicorner.Parent = textboxframe

			textboxmain.Name = "textboxmain"
			textboxmain.Parent = textboxframe
			textboxmain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textboxmain.BackgroundTransparency = 1.000
			textboxmain.Size = UDim2.new(0, 182, 0, 20)
			textboxmain.Font = Enum.Font.Gotham
			textboxmain.Text = ""
			textboxmain.TextColor3 = Color3.fromRGB(255, 255, 255)
			textboxmain.TextSize = 14.000

			textboxmain.FocusLost:Connect(
				function(ep)
					if ep then
						if #textboxmain.Text > 0 then
							callback(textboxmain.Text)
							if disapper then
								textboxmain.Text = ""
							end
						end
					end
				end
			)

			scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
		end

		function tab:Dropdown(name, list, callback)
			local d = false
			local dropdown = Instance.new("TextButton")
			local dropdownuicorner = Instance.new("UICorner")
			local title = Instance.new("TextLabel")
			local arrow = Instance.new("ImageLabel")

			dropdown.Name = "dropdown"
			dropdown.Parent = scrollframe
			dropdown.AnchorPoint = Vector2.new(0.5, 0.5)
			dropdown.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
			dropdown.Position = UDim2.new(0.503571451, 0, 0.535714269, 0)
			dropdown.Size = UDim2.new(0, 420, 0, 28)
			dropdown.AutoButtonColor = false
			dropdown.Font = Enum.Font.Gotham
			dropdown.Text = ""
			dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
			dropdown.TextSize = 14.000

			dropdownuicorner.CornerRadius = UDim.new(0, 3)
			dropdownuicorner.Name = "dropdownuicorner"
			dropdownuicorner.Parent = dropdown

			title.Name = "title"
			title.Parent = dropdown
			title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			title.BackgroundTransparency = 1.000
			title.Position = UDim2.new(0.0238095261, 0, 0.178571433, 0)
			title.Size = UDim2.new(0, 55, 0, 17)
			title.Font = Enum.Font.Gotham
			title.Text = name
			title.TextColor3 = Color3.fromRGB(255, 255, 255)
			title.TextSize = 14.000
			title.TextXAlignment = Enum.TextXAlignment.Left

			arrow.Name = "arrow"
			arrow.Parent = dropdown
			arrow.AnchorPoint = Vector2.new(1, 0.5)
			arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			arrow.BackgroundTransparency = 1.000
			arrow.Position = UDim2.new(0.99249202, -3, 0.5, 0)
			arrow.Rotation = 90.000
			arrow.Size = UDim2.new(0, 21, 0, 22)
			arrow.Image = "http://www.roblox.com/asset/?id=5728209609"
			arrow.SliceScale = 2.000

			local dropdownframe = Instance.new("TextButton")
			local dropdownframeuicorner = Instance.new("UICorner")
			local dropdownscrollframe = Instance.new("ScrollingFrame")
			local dropscrolluilist = Instance.new("UIListLayout")

			dropdownframe.Name = "dropdownframe"
			dropdownframe.Parent = scrollframe
			dropdownframe.AnchorPoint = Vector2.new(0.5, 0.5)
			dropdownframe.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
			dropdownframe.Position = UDim2.new(0.491803288, 0, 0.744318187, 0)
			dropdownframe.Size = UDim2.new(0, 420, 0, 95)
			dropdownframe.AutoButtonColor = false
			dropdownframe.Font = Enum.Font.Gotham
			dropdownframe.Text = ""
			dropdownframe.TextColor3 = Color3.fromRGB(255, 255, 255)
			dropdownframe.TextSize = 14.000
			dropdownframe.Visible = false

			dropdownframeuicorner.CornerRadius = UDim.new(0, 3)
			dropdownframeuicorner.Name = "dropdownframeuicorner"
			dropdownframeuicorner.Parent = dropdownframe

			dropdownscrollframe.Name = "dropdownscrollframe"
			dropdownscrollframe.Parent = dropdownframe
			dropdownscrollframe.Active = true
			dropdownscrollframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			dropdownscrollframe.BackgroundTransparency = 1.000
			dropdownscrollframe.BorderSizePixel = 0
			dropdownscrollframe.Position = UDim2.new(0.0260001048, 0, 0.0936317816, 0)
			dropdownscrollframe.Size = UDim2.new(0, 403, 0, 79)
			dropdownscrollframe.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			dropdownscrollframe.CanvasSize = UDim2.new(0, 0, 0, 0)
			dropdownscrollframe.ScrollBarThickness = 2
			dropdownscrollframe.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			dropdownscrollframe.ScrollBarImageColor3 = Color3.fromRGB(71, 71, 71)

			dropscrolluilist.Name = "dropscrolluilist"
			dropscrolluilist.Parent = dropdownscrollframe
			dropscrolluilist.SortOrder = Enum.SortOrder.LayoutOrder
			dropscrolluilist.Padding = UDim.new(0, 3)

			for i, v in next, list do
				local item = Instance.new("TextButton")
				local itemuicorner = Instance.new("UICorner")
				item.Name = "item"
				item.Parent = dropdownscrollframe
				item.AnchorPoint = Vector2.new(0.5, 0.5)
				item.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
				item.Position = UDim2.new(0.491315126, 0, 0.177215189, 0)
				item.Size = UDim2.new(0, 396, 0, 28)
				item.AutoButtonColor = false
				item.Font = Enum.Font.Gotham
				item.Text = v
				item.TextColor3 = Color3.fromRGB(255, 255, 255)
				item.TextSize = 14.000

				itemuicorner.CornerRadius = UDim.new(0, 3)
				itemuicorner.Name = "itemuicorner"
				itemuicorner.Parent = item
				item.MouseEnter:Connect(
					function()
						TweenService:Create(
							item,
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(71, 71, 71)}
						):Play()
					end
				)

				item.MouseLeave:Connect(
					function()
						TweenService:Create(
							item,
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(61, 61, 61)}
						):Play()
					end
				)

				item.MouseButton1Click:Connect(
					function()
						TweenService:Create(
							arrow,
							TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{Rotation = 90}
						):Play()
						dropdownframe.Visible = false
						d = not d
						scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
						title.Text = name .. " - " .. v
					end
				)
				dropdownscrollframe.CanvasSize = UDim2.new(0, 0, 0, dropscrolluilist.AbsoluteContentSize.Y)
			end

			dropdown.MouseEnter:Connect(
				function()
					TweenService:Create(
						dropdown,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(71, 71, 71)}
					):Play()
				end
			)

			dropdown.MouseLeave:Connect(
				function()
					TweenService:Create(
						dropdown,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(61, 61, 61)}
					):Play()
				end
			)

			dropdown.MouseButton1Click:Connect(
				function()
					if d == true then
						TweenService:Create(
							arrow,
							TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{Rotation = 90}
						):Play()
						dropdownframe.Visible = false
						d = not d
						scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
					else
						TweenService:Create(
							arrow,
							TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{Rotation = 0}
						):Play()
						dropdownframe.Visible = true
						d = not d
						scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
					end
				end
			)

			scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrolluilist.AbsoluteContentSize.Y)
		end
		return tab
	end

	return window
end
return lib

--[[
local s = lib:MainWindow("cum.lua")

local ss = s:Tab("Tab 1")

ss:Button(
	"Button",
	function()
		print("Clicked!")
	end
)

ss:Toggle(
	"Toggle",
	false,
	function(t)
		print(t)
	end
)

ss:Colorpicker(
	"Colorpicker",
	Color3.fromRGB(59, 153, 253),
	function(t)
		print(t)
	end
)

ss:Slider(
	"Slider",
	0,
	100,
	function(t)
		print(t)
	end
)

ss:Spliter()

ss:Label(
	"Label"
)

ss:Textbox(
	"Textbox",
    true,
	function(t)
		print(t)
	end
)

ss:Dropdown(
	"Dropdown",
    {"Option 1","Option 2","Option 3","Option 4","Option 5"},
	function(t)
		print(t)
	end
)



s:Tab(
	"Tab 2"
)

]]

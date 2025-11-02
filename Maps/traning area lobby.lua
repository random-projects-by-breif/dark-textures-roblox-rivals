local TARGET_COLOR = Color3.fromRGB(52, 52, 55)
local LOBBY_PATH = workspace:WaitForChild("Lobby")
local SHOOTING_RANGE_PATH = LOBBY_PATH:WaitForChild("ShootingRange")
local CONTAINER_NAME = "Extra"
local function colorPart(part)
    if part:IsA("BasePart") and part.Name ~= CONTAINER_NAME then
        part.Color = TARGET_COLOR
    end
end
local function handleContainer(container)
    for _, descendant in ipairs(container:GetDescendants()) do
        colorPart(descendant)
    end
    container.DescendantAdded:Connect(colorPart)
end
local CONTAINER_PATH = SHOOTING_RANGE_PATH:WaitForChild(CONTAINER_NAME)
if CONTAINER_PATH and CONTAINER_PATH:IsA("Folder") then
    handleContainer(CONTAINER_PATH)
end

local TARGET_COLOR = Color3.fromRGB(52, 52, 55)
local CONTAINER_PATH = workspace.Lobby.ShootingRange.Extra

local function colorPart(part)
    if part:IsA("BasePart") then
        part.Color = TARGET_COLOR
    end
end
local function handleContainer(container)
    for _, descendant in ipairs(container:GetDescendants()) do
        colorPart(descendant)
    end
    container.DescendantAdded:Connect(colorPart)
end
if CONTAINER_PATH and CONTAINER_PATH:IsA("Folder") then
    handleContainer(CONTAINER_PATH)
end

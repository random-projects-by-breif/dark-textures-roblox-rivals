local TARGET_COLOR = Color3.fromRGB(52, 52, 55)
local ARENA_NAME = "Big Arena"
local workspace = game:GetService("Workspace")
local function colorPart(part)
    if part:IsA("BasePart") then
        part.Color = TARGET_COLOR
    end
end
local function handleArenaModel(arenaModel)
    for _, descendant in ipairs(arenaModel:GetDescendants()) do
        colorPart(descendant)
    end
    arenaModel.DescendantAdded:Connect(colorPart)
end
local arenaInitial = workspace:FindFirstChild(ARENA_NAME)
if arenaInitial and (arenaInitial:IsA("Model") or arenaInitial:IsA("BasePart")) then
    handleArenaModel(arenaInitial)
end
workspace.ChildAdded:Connect(function(child)
    if child.Name == ARENA_NAME and (child:IsA("Model") or child:IsA("BasePart")) then
        handleArenaModel(child)
    end
end)
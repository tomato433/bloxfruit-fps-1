-- High Quality Flag（画質向上）

local Lighting = game:GetService("Lighting")

Lighting.GlobalShadows = true
Lighting.FogEnd = 1000
Lighting.Brightness = 3
Lighting.ClockTime = 14
Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)

-- エフェクト強化
for _, v in pairs(game:GetDescendants()) do
    if v:IsA("ParticleEmitter") then
        v.Lifetime = NumberRange.new(1,3)
        v.Rate = v.Rate * 2
    elseif v:IsA("PointLight") or v:IsA("SpotLight") then
        v.Brightness = v.Brightness * 2
        v.Range = v.Range * 1.5
    end
end

-- 後から追加されるものにも適用
game.DescendantAdded:Connect(function(v)
    if v:IsA("ParticleEmitter") then
        v.Lifetime = NumberRange.new(1,3)
    elseif v:IsA("PointLight") or v:IsA("SpotLight") then
        v.Brightness = v.Brightness * 2
    end
end)

-- 最高画質設定
settings().Rendering.QualityLevel = Enum.QualityLevel.Level21

pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "High Quality",
        Text = "画質MAXにした！",
        Duration = 5
    })
end)

if GetLocale() ~= "zhCN" then
	return
end
local L

-----------------------
-- Sha of Anger --
-----------------------
L = DBM:GetModLocalization(691)

L:SetOptionLocalization({
	RangeFrame	= "距离监视（动态）：$spell:119622"
})

-----------------------
-- Salyis --
-----------------------
L = DBM:GetModLocalization(725)

--------------
-- Oondasta --
--------------
L = DBM:GetModLocalization(826)

L:SetOptionLocalization({
	RangeFrame	= "距离监视：$spell:137511"
})

---------------------------
-- Nalak, The Storm Lord --
---------------------------
L = DBM:GetModLocalization(814)

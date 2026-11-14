-- 泰坦重铸时光服-时光2-法师-旺仔芒果/椰奶冻-2026.11.13--
if GetLocale() ~= "zhCN" then
	return
end
local L

---------------------
-- A Brewing Storm --
---------------------
L = DBM:GetModLocalization("d517")

L:SetTimerLocalization({
	timerEvent	= "酿酒完成（大约的时间）"
})

L:SetOptionLocalization({
	timerEvent	= "为酿酒完成显示大约时间的计时器"
})

L:SetMiscLocalization({
	BrewStart		= "风暴开始了！准备好。",
	BorokhulaPull	= "该死了，你这个舌头分岔的滑溜爬虫！",
	BorokhulaAdds	= "呼叫援助！"
})

-----------------------
-- A Little Patience --
-----------------------
L = DBM:GetModLocalization("d589")

L:SetMiscLocalization({
	ScargashPull	= "你们这些联盟太弱了！"
})

---------------------------
-- Arena Of Annihilation --
---------------------------
L = DBM:GetModLocalization("d511")

-------------------------
-- Assault on Zan'vess --
-------------------------
L = DBM:GetModLocalization("d593")

L:SetMiscLocalization({
	TelvrakPull	= "赞斐斯永远不会倒下！"
})

------------------------------
-- Battle on the High Seas ---
------------------------------
L = DBM:GetModLocalization("d652")

-----------------------
-- Blood in the Snow --
-----------------------
L = DBM:GetModLocalization("d646")

-----------------------
-- Brewmoon Festival --
-----------------------
L = DBM:GetModLocalization("d539")

L:SetTimerLocalization({
	timerBossCD	= "%s接近"
})

L:SetOptionLocalization({
	timerBossCD	= "为下一次首领重生显示计时器"
})

L:SetMiscLocalization({
	RatEngage	= "是巢穴之母！小心，",
	BeginAttack	= "我们必须保卫村庄！",
	Yeti		= "巴塔利战争雪人",
	Qobi		= "战争使者阔毕"
})

------------------------------
-- Crypt of Forgotten Kings --
------------------------------
L = DBM:GetModLocalization("d504")

-----------------------
-- Dagger in the Dark --
-----------------------
L = DBM:GetModLocalization("d616")

L:SetTimerLocalization({
	timerAddsCD	= "呼叫小兵冷却"
})

L:SetOptionLocalization({
	timerAddsCD	= "为暗孵蜥蜴王呼叫小兵显示冷却计时器"
})

L:SetMiscLocalization({
	LizardLord	= "那些萨乌洛克在守护洞穴，我们来对付他们。"
})

----------------------------
-- Dark Heart of Pandaria --
----------------------------
L = DBM:GetModLocalization("d647")

L:SetMiscLocalization({
	summonElemental	= "我的元素们，消灭这些害虫！"
})

------------------------
-- Greenstone Village --
------------------------
L = DBM:GetModLocalization("d492")

--------------
-- Landfall --
--------------
L = DBM:GetModLocalization("Landfall")

L:SetGeneralLocalization({
	name = C_LFGInfo.GetDungeonInfo(UnitFactionGroup("player") == "Alliance" and 590 or 595).name
})

L:SetWarningLocalization({
	WarnAchFiveAlive	= "成就“五号还活着”失败"
})

L:SetOptionLocalization({
	WarnAchFiveAlive	= "警报：成就“五号还活着”失败"
})

----------------------------
-- The Secret of Ragefire --
----------------------------
L = DBM:GetModLocalization("d649")

L:SetMiscLocalization({
	XorenthPull	= "所有低等种族都是正统部落的敌人。",
	ElagloPull	= "蠢货！像你这种废物无法阻止正统的部落！"
})

----------------------
-- Theramore's Fall --
----------------------
L = DBM:GetModLocalization("d566")

--------------------------------
-- Troves of the Thunder King --
--------------------------------
L = DBM:GetModLocalization("d620")

----------------
-- Unga Ingoo --
----------------
L = DBM:GetModLocalization("d499")

------------------------
-- Warlock Green Fire --
------------------------
L = DBM:GetModLocalization("d594")

L:SetWarningLocalization({
	specWarnLostSouls		= "灵魂迷失！",
	specWarnEnslavePitLord	= "深渊领主 - 快奴役恶魔！"
})

L:SetTimerLocalization({
	timerLostSoulsCD	= "灵魂迷失冷却"
})

L:SetOptionLocalization({
	specWarnLostSouls		= "为灵魂迷失重生显示特别警告",
	specWarnEnslavePitLord	= "为需对深渊领主使用奴役恶魔时显示特别警告",
	timerLostSoulsCD		= "为下一次灵魂迷失重生显示冷却计时器"
})

L:SetMiscLocalization({
	LostSouls	= "面对注定灭亡的同侪灵魂，术士！"
})

-------------------------------
-- Finding Secret Ingredient --
-------------------------------
L = DBM:GetModLocalization("d745")

L:SetMiscLocalization({
	Clear	= "做得好！"
})

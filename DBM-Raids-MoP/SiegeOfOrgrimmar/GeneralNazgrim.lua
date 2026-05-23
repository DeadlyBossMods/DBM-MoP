local mod	= DBM:NewMod(850, "DBM-Raids-MoP", 1, 369)
local L		= mod:GetLocalizedStrings()

if mod:IsMop() then
	mod.statTypes = "normal10,normal25,heroic10,heroic25,lfr"
else
	mod.statTypes = "normal,heroic,mythic,lfr"
end

mod:SetRevision("@file-date-integer@")
mod:DisableHardcodedOptions()
mod:SetCreatureID(71515)
mod:SetEncounterID(1603)
mod:SetUsedIcons(8, 7, 6, 4, 2, 1)
mod:SetZone(1136)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 143872 143503 143420 143473 143502",
	"SPELL_CAST_SUCCESS 143589 143594 143593 143536 143474 143494",
	"SPELL_AURA_APPLIED 143494 143484 143480 143475 143638 143882",
	"SPELL_AURA_APPLIED_DOSE 143494",
	"SPELL_AURA_REMOVED 143494",
	"SPELL_DAMAGE 143873",
	"UNIT_DIED",
	"CHAT_MSG_MONSTER_YELL",
	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

--Nazgrim Core Abilities
local warnSunder					= mod:NewStackAnnounce(143494, 2, nil, "Tank|Healer")--Will add special warnings and such when know cd and stack count needed for swaps
local warnBonecracker				= mod:NewTargetAnnounce(143638, 2, nil, false)
local warnBattleStance				= mod:NewSpellAnnounce(143589, 2)
local warnDefensiveStanceSoon		= mod:NewAnnounce("warnDefensiveStanceSoon", 4, 143593, nil, nil, true)
local warnDefensiveStanceOver		= mod:NewEndAnnounce(143593, 1)
--Nazgrim Rage Abilities
local warnCoolingOff				= mod:NewTargetAnnounce(143484, 1, nil, false)
--Kor'kron Adds
local warnIronstorm					= mod:NewSpellAnnounce(143420, 3, nil, "Melee")
local warnAssasinsMark				= mod:NewTargetAnnounce(143480, 3, nil, false)
local warnEmpoweredChainHeal		= mod:NewCastAnnounce(143473, 4)
local warnHuntersMark				= mod:NewTargetAnnounce(143882, 3, nil, false)

--Nazgrim Core Abilities
local specWarnAdds					= mod:NewSpecialWarningSwitchCount(-7920, "-Healer", nil, nil, 1, 2, nil, nil, "killmob")
local specWarnSunder				= mod:NewSpecialWarningStack(143494, nil, 4, nil, nil, 1, 6, nil, nil, "stackhigh")
local specWarnSunderOther			= mod:NewSpecialWarningTaunt(143494, nil, nil, nil, 1, 2, nil, nil, "tauntboss")
local specWarnExecute				= mod:NewSpecialWarningDefensive(143502, nil, nil, nil, 1, 2, nil, nil, "defensive")
local specWarnBerserkerStance		= mod:NewSpecialWarningSpell(143594, "Dps")
local specWarnDefensiveStance		= mod:NewSpecialWarningReflect(143593, nil, nil, nil, 3, 2, nil, nil, "stopattack")
--Nazgrim Rage Abilities
local specWarnHeroicShockwave		= mod:NewSpecialWarningYou(143500, nil, nil, nil, 2, 19, nil, nil, "leapyou")
local yellHeroicShockwave			= mod:NewYell(143500)
local specWarnHeroicShockwaveAll	= mod:NewSpecialWarningTarget(143500, nil, nil, nil, 2, 2, nil, nil, "watchstep")
local specWarnKorkronBanner			= mod:NewSpecialWarningSwitch(143536, "Dps", nil, nil, 1, 2, nil, nil, "targetchange")
local specWarnRavager				= mod:NewSpecialWarningDodge(143872, nil, nil, nil, 2, 2, nil, nil, "watchstep")
local specWarnRavagerMove			= mod:NewSpecialWarningGTFO(143873, nil, nil, nil, 1, 8, nil, nil, "watchfeet")
local specWarnWarSong				= mod:NewSpecialWarningSpell(143503, nil, nil, nil, 2, 2, nil, nil, "aesoon")
--Kor'kron Adds
local specWarnIronstorm				= mod:NewSpecialWarningDodge(143420, nil, nil, nil, 2, 2, nil, nil, "watchstep")--Only needs to be interrupted if melee are near it
local specWarnEmpoweredChainHeal	= mod:NewSpecialWarningInterrupt(143473, "HasInterrupt", nil, nil, 1, 2, nil, nil, "kickcast")--Concerns everyone, if not interrupted will heal boss for a TON
local specWarnAssassinsMark			= mod:NewSpecialWarningYou(143480, nil, nil, nil, 1, 19, nil, nil, "fixateyou")
local yellAssassinsMark				= mod:NewYell(143480, nil, false)
local specWarnEarthShield			= mod:NewSpecialWarningDispel(143475, "MagicDispeller", nil, nil, 1, 2, nil, nil, "dispelboss")
local specWarnHealingTideTotem		= mod:NewSpecialWarningSwitch(143474, false, nil, nil, nil, nil, nil, nil, "attacktotem")--Not everyone needs to switch, should be turned on by assigned totem mashing people.
local specWarnHuntersMark			= mod:NewSpecialWarningYou(143882, nil, nil, nil, 1, 19, nil, nil, "fixateyou")
local yellHuntersMark				= mod:NewYell(143882, nil, false)

--Nazgrim Core Abilities
local timerAddsCD					= mod:NewNextCountTimer(45, -7920, nil, nil, nil, 1, "132349", nil, nil, 1, 4)
local timerSunder					= mod:NewTargetTimer(30, 143494, nil, "Tank|Healer")
local timerSunderCD					= mod:NewCDTimer(7.5, 143494, nil, "Tank", nil, 5, nil, DBM_COMMON_L.TANK_ICON)
local timerExecuteCD				= mod:NewCDTimer(18, 143502, nil, "Tank", nil, 5, nil, DBM_COMMON_L.TANK_ICON)
local timerBoneCD					= mod:NewCDTimer(30, 143638, nil, false, nil, 5)
local timerBattleStanceCD			= mod:NewNextTimer(60, 143589, nil, nil, nil, 6)
local timerBerserkerStanceCD		= mod:NewNextTimer(60, 143594, nil, nil, nil, 6)
local timerDefensiveStanceCD		= mod:NewNextTimer(60, 143593, nil, nil, nil, 6)
--Nazgrim Rage Abilities
local timerCoolingOff				= mod:NewBuffFadesTimer(15, 143484, nil, nil, nil, 5, nil, nil, nil, 2, 4)
--Kor'kron Adds
local timerEmpoweredChainHealCD		= mod:NewNextSourceTimer(6, 143473, nil, nil, nil, 4, nil, DBM_COMMON_L.INTERRUPT_ICON)

local berserkTimer					= mod:NewBerserkTimer(600)

mod:AddSetIconOption("SetIconOnAdds", -7920, false, 5, {7, 6, 4, 2, 1})
mod:AddInfoFrameOption(-7909)

--Upvales, don't need variables
local UnitName, UnitExists, UnitGUID = UnitName, UnitExists, UnitGUID
local spellName1, spellName2, spellName3, spellName4, sunder = DBM:GetSpellName(143500), DBM:GetSpellName(143536), DBM:GetSpellName(143503), DBM:GetSpellName(143872), DBM:GetSpellName(143494)
--Tables, can't recover
local dotWarned = {}
--Important, needs recover
mod.vb.addsCount = 0
mod.vb.defensiveActive = false
mod.vb.allForcesReleased = false

local updateInfoFrame
do
	local bossPower = 0
	local lines = {}
	local sortedLines = {}
	local function addLine(key, value)
		-- sort by insertion order
		lines[key] = value
		sortedLines[#sortedLines + 1] = key
	end
	updateInfoFrame = function()
		table.wipe(lines)
		table.wipe(sortedLines)
		if UnitExists("boss1") then
			bossPower = UnitPower("boss1")
		end
		if bossPower < 50 then
			addLine("|cFF088A08"..spellName1.."|r", bossPower)--Green
			addLine(spellName2, 50)
			addLine(spellName3, 70)
			addLine(spellName4, 100)
		elseif bossPower < 70 then
			addLine(spellName1, 25)
			addLine("|cFF088A08"..spellName2.."|r", bossPower)--Green (Would yellow be too hard to see on this?)
			addLine(spellName3, 70)
			addLine(spellName4, 100)
		elseif bossPower < 100 then
			addLine(spellName1, 25)
			addLine(spellName2, 50)
			addLine("|cFF088A08"..spellName3.."|r", bossPower)--Green (Maybe change to orange?)
			addLine(spellName4, 100)
		elseif bossPower == 100 then
			addLine(spellName1, 25)
			addLine(spellName2, 50)
			addLine(spellName3, 70)
			addLine("|cFFFF0000"..spellName4.."|r", bossPower)--Red (definitely work making this one red, it's really the only critically bad one)
		end
		if mod:IsMythic() then--Same on 10 heroic? TODO, get normal LFR and flex adds info verified
			if mod.vb.addsCount == 0 then
				addLine(L.nextAdds, L.mage..", "..L.rogue..", "..L.warrior)
			elseif mod.vb.addsCount == 1 then
				addLine(L.nextAdds, L.shaman..", "..L.rogue..", "..L.hunter)
			elseif mod.vb.addsCount == 2 then
				addLine(L.nextAdds, L.mage..", "..L.shaman..", "..L.warrior)
			elseif mod.vb.addsCount == 3 then
				addLine(L.nextAdds, L.mage..", "..L.rogue..", "..L.hunter)
			elseif mod.vb.addsCount == 4 then
				addLine(L.nextAdds, L.shaman..", "..L.rogue..", "..L.warrior)
			elseif mod.vb.addsCount == 5 then
				addLine(L.nextAdds, L.mage..", "..L.shaman..", "..L.hunter)
			elseif mod.vb.addsCount == 6 then
				addLine(L.nextAdds, L.rogue..", "..L.hunter..", "..L.warrior)
			elseif mod.vb.addsCount == 7 then
				addLine(L.nextAdds, L.mage..", "..L.shaman..", "..L.rogue)
			elseif mod.vb.addsCount == 8 then
				addLine(L.nextAdds, L.shaman..", "..L.hunter..", "..L.warrior)
			elseif mod.vb.addsCount == 9 then
				addLine(L.nextAdds, L.mage..", "..L.hunter..", "..L.warrior)
			else--Already had all 10 adds sets now we're just going to get no more adds (except for 10%)
				addLine("", "")
			end
		else--Not heroic
			if mod.vb.addsCount == 0 then
				addLine(L.nextAdds, L.mage..", "..L.warrior)
			elseif mod.vb.addsCount == 1 then
				addLine(L.nextAdds, L.shaman..", "..L.rogue)
			elseif mod.vb.addsCount == 2 then
				addLine(L.nextAdds, L.rogue..", "..L.warrior)
			elseif mod.vb.addsCount == 3 then
				addLine(L.nextAdds, L.mage..", "..L.shaman)
			elseif mod.vb.addsCount == 4 then
				addLine(L.nextAdds, L.shaman..", "..L.warrior)
			elseif mod.vb.addsCount == 5 then
				addLine(L.nextAdds, L.mage..", "..L.rogue)
			elseif mod.vb.addsCount == 6 then
				addLine(L.nextAdds, L.mage..", "..L.shaman..", "..L.rogue)
			elseif mod.vb.addsCount == 7 then
				addLine(L.nextAdds, L.shaman..", "..L.rogue..", "..L.warrior)
			elseif mod.vb.addsCount == 8 then
				addLine(L.nextAdds, L.mage..", "..L.shaman..", "..L.warrior)
			elseif mod.vb.addsCount == 9 then
				addLine(L.nextAdds, L.mage..", "..L.rogue..", "..L.warrior)
			else--Already had all 10 adds sets now we're just going to get no more adds (except for 10%)
				addLine("", "")
			end
		end
		return lines, sortedLines
	end
end

function mod:LeapTarget(targetname, uId)
	if not targetname then return end
	if targetname == UnitName("player") then
		specWarnHeroicShockwave:Show()
		specWarnHeroicShockwave:Play("leapyou")
		yellHeroicShockwave:Yell()
	else
		specWarnHeroicShockwaveAll:Show(targetname)
		specWarnHeroicShockwaveAll:Play("watchstep")
	end
end

function mod:OnCombatStart(delay)
	table.wipe(dotWarned)
	self.vb.addsCount = 0
	self.vb.defensiveActive = false
	self.vb.allForcesReleased = false
	timerAddsCD:Start(-delay, 1)
	berserkTimer:Start(-delay)
end

function mod:OnCombatEnd()
	self:UnregisterShortTermEvents()
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 143872 then
		specWarnRavager:Show()
		specWarnRavager:Play("watchstep")
	elseif spellId == 143503 then
		specWarnWarSong:Show()
		specWarnWarSong:Play("aesoon")
	elseif spellId == 143420 then
		if self:CheckBossDistance(args.sourceGUID, true, 17626, 13) then
			specWarnIronstorm:Show()
			specWarnIronstorm:Play("watchstep")
		else
			warnIronstorm:Show()
		end
	elseif spellId == 143473 then
		if self.Options.SpecWarn143473interrupt and self:CheckInterruptFilter(args.sourceGUID, false, true) then
			specWarnEmpoweredChainHeal:Show(args.sourceName)
			specWarnEmpoweredChainHeal:Play("kickcast")
		else
			warnEmpoweredChainHeal:Show()
		end
		timerEmpoweredChainHealCD:Start(args.sourceName, args.sourceGUID)
	elseif spellId == 143502 then
		timerExecuteCD:Start()
		if self:IsTanking("player", "boss1", nil, true) then--threat check instead of target because we may be helping dps adds
			specWarnExecute:Show()
			specWarnExecute:Play("defensive")
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 143589 then
		if self.vb.defensiveActive then
			self.vb.defensiveActive = false
			warnDefensiveStanceOver:Show()
		end
		self:UnregisterShortTermEvents()
		warnBattleStance:Show()
		timerBerserkerStanceCD:Start()
		if self.Options.InfoFrame then
			DBM.InfoFrame:SetHeader(args.spellName)
			DBM.InfoFrame:Show(5, "function", updateInfoFrame)
		end
	elseif spellId == 143594 then
		specWarnBerserkerStance:Show()
		timerDefensiveStanceCD:Start()
		warnDefensiveStanceSoon:Countdown(60, 5)
		if self.Options.InfoFrame then
			DBM.InfoFrame:SetHeader(args.spellName)
			DBM.InfoFrame:Show(5, "function", updateInfoFrame)
		end
	elseif spellId == 143593 then
		if not self.vb.allForcesReleased then
			self.vb.defensiveActive = true
			self:RegisterShortTermEvents(
				"SWING_DAMAGE",
				"SPELL_DAMAGE",
				"RANGE_DAMAGE",
				"SPELL_PERIODIC_DAMAGE"
			)
			table.wipe(dotWarned)
		end
		specWarnDefensiveStance:Show(args.sourceName)
		specWarnDefensiveStance:Play("stopattack")
		timerBattleStanceCD:Start()
		if self.Options.InfoFrame then
			DBM.InfoFrame:SetHeader(args.spellName)
			DBM.InfoFrame:Show(5, "function", updateInfoFrame)
		end
	elseif spellId == 143536 then
		specWarnKorkronBanner:Show()
		specWarnKorkronBanner:Play("targetchange")
		if self.Options.SetIconOnAdds then
			self:ScanForMobs(71626, 2, 8, 1, nil, 4)--banner
		end
	elseif spellId == 143474 then
		specWarnHealingTideTotem:Show()
		specWarnHealingTideTotem:Play("attacktotem")
	elseif spellId == 143494 then--Because it can miss, we start CD here instead of APPLIED
		timerSunderCD:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 143494 then
		local amount = args.amount or 1
		warnSunder:Show(args.destName, amount)
		timerSunder:Start(args.destName)
		if args:IsPlayer() then
			if amount >= 4 then--At this point the other tank SHOULD be clear.
				specWarnSunder:Show(amount)
				specWarnSunder:Play("stackhigh")
			end
		else--Taunt as soon as stacks are clear, regardless of stack count.
			if amount >= 3 and not DBM:UnitDebuff("player", args.spellName) and not UnitIsDeadOrGhost("player") then
				specWarnSunderOther:Show(args.destName)
				specWarnSunderOther:Play("tauntboss")
			end
		end
	elseif spellId == 143484 then
		warnCoolingOff:Show(args.destName)
		timerCoolingOff:Start()
	elseif spellId == 143480 then
		if args:IsPlayer() then
			specWarnAssassinsMark:Show()
			specWarnAssassinsMark:Play("fixateyou")
			yellAssassinsMark:Yell()
		else
			warnAssasinsMark:Show(args.destName)
		end
	elseif spellId == 143475 and not args:IsDestTypePlayer() then
		specWarnEarthShield:Show(args.destName)
		specWarnEarthShield:Play("dispelboss")
	elseif spellId == 143638 then
		warnBonecracker:CombinedShow(1.5, args.destName)
		timerBoneCD:DelayedStart(1.5)--Takes a while to get on all targets. 1.5 seconds in 10 man, not sure about 25 man yet
	elseif spellId == 143882 then
		if args:IsPlayer() then
			specWarnHuntersMark:Show()
			specWarnHuntersMark:Play("fixateyou")
			yellHuntersMark:Yell()
		else
			warnHuntersMark:Show(args.destName)
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 143494 then
		timerSunder:Cancel(args.destName)
	end
end

function mod:SPELL_DAMAGE(sourceGUID, _, _, _, destGUID, destName, _, _, spellId, spellName)
	if spellId == 143873 and destGUID == UnitGUID("player") and self:AntiSpam(3, 2) then
		specWarnRavagerMove:Show(spellName)
		specWarnRavagerMove:Play("watchfeet")
	elseif sourceGUID == UnitGUID("player") and destGUID == UnitGUID("boss1") and self:AntiSpam(3, 1) then--If you've been in LFR at all, you'll see that even 3 is generous. 8 is WAY too leaniant.
		if not DBM:UnitDebuff("player", sunder) and self.vb.defensiveActive then
			specWarnDefensiveStance:Show(destName)
			specWarnDefensiveStance:Play("stopattack")
		end
	end
end
mod.RANGE_DAMAGE = mod.SPELL_DAMAGE
mod.SWING_DAMAGE = mod.SPELL_DAMAGE

function mod:SPELL_PERIODIC_DAMAGE(sourceGUID, _, _, _, destGUID, destName, _, _, spellId)--Prevent spam on DoT
	if sourceGUID == UnitGUID("player") and destGUID == UnitGUID("boss1") and self:AntiSpam(3, 1) then
		if not DBM:UnitDebuff("player", sunder) and self.vb.defensiveActive and not dotWarned[spellId] then
			dotWarned[spellId] = true
			specWarnDefensiveStance:Show(destName)
			specWarnDefensiveStance:Play("stopattack")
		end
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 71519 then--Kor'kron Warshaman
		timerEmpoweredChainHealCD:Cancel(args.destName, args.destGUID)
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 143500 then--Faster than combat log by 0.3-0.5 seconds
		self:BossTargetScanner(71515, "LeapTarget", 0.05, 16)
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L.newForces1 or msg == L.newForces2 or msg == L.newForces3 or msg == L.newForces4 or msg == L.newForces5 then
		self:SendSync("Adds")
	elseif msg == L.allForces then
		self:SendSync("AllAdds")
	end
end

do
	local addsTable = {
		[71519] = 7,--Shaman
		[71517] = 6,--Arcweaver
		[71518] = 1,--Assassin
		[71516] = 2,--Iron Blade
		[71656] = 4,--Sniper (Heroic)
	}
	function mod:OnSync(msg)
		if not self:IsInCombat() then return end
		if msg == "Adds" and self:AntiSpam(10, 3) then
			self.vb.addsCount = self.vb.addsCount + 1
			specWarnAdds:Show(self.vb.addsCount)
			specWarnAdds:Play("killmob")
			if self.vb.addsCount < 10 then
				timerAddsCD:Start(nil, self.vb.addsCount+1)
			end
			if self.Options.SetIconOnAdds then
				if self:IsMythic() or self.vb.addsCount > 6 then--3 Adds
					self:ScanForMobs(71519, 2, 7, 3, addsTable, 15)
				else
					self:ScanForMobs(71519, 2, 7, 2, addsTable, 15)--2 adds
				end
			end
			if self.Options.InfoFrame then
				DBM.InfoFrame:Show(5, "function", updateInfoFrame)
			end
		elseif msg == "AllAdds" and self:AntiSpam(10, 4) then
			self.vb.allForcesReleased = true
			self.vb.defensiveActive = false
			self:UnregisterShortTermEvents()--Do not warn defensive stance below 10%
			--Icon setting not put here on purpose, so as not ot mess with existing adds (it's burn boss phase anyawys)
		end
	end
end

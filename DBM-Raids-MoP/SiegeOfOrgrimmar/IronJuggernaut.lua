local mod	= DBM:NewMod(864, "DBM-Raids-MoP", 1, 369)
local L		= mod:GetLocalizedStrings()

if mod:IsMop() then
	mod.statTypes = "normal10,normal25,heroic10,heroic25,lfr"
else
	mod.statTypes = "normal,heroic,mythic,lfr"
end

mod:SetRevision("@file-date-integer@")
mod:DisableHardcodedOptions()
mod:SetCreatureID(71466)
mod:SetEncounterID(1600)
mod:SetZone(1136)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 144483 144485",
	"SPELL_CAST_SUCCESS 146325",
	"SPELL_AURA_APPLIED 144467 146325 144459 144498",
	"SPELL_AURA_APPLIED_DOSE 144467",
	"SPELL_AURA_REFRESH 144459 146325",
	"SPELL_AURA_REMOVED 144467 146325",
	"SPELL_PERIODIC_DAMAGE 144218",
	"SPELL_PERIODIC_MISSED 144218",
	"RAID_BOSS_WHISPER",
	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

local warnDemolisherCanon		= mod:NewSpellAnnounce(144154, 1, nil, false)--This spell uses in both mode.
--Assault Mode
local warnBorerDrill			= mod:NewSpellAnnounce(144218, 4)
local warnLaserBurn				= mod:NewTargetAnnounce(144459, 2, nil, false)
local warnMortarCannon			= mod:NewSpellAnnounce(144316, 3, nil, false)--Could not get target scanning working.
local warnCrawlerMine			= mod:NewSpellAnnounce(144673, 3)
local warnIgniteArmor			= mod:NewStackAnnounce(144467, 2, nil, "Tank")--Seems redundant to count debuffs and warn for breath, so just do debuffs
local warnRicochet				= mod:NewSpellAnnounce(144356, 3, 144327)
--Siege Mode
local warnExplosiveTar			= mod:NewSpellAnnounce(144492, 3)
local warnCutterLaser			= mod:NewTargetAnnounce(146325, 4)--Not holding my breath this shows in combat log.

--Assault Mode
local specWarnIgniteArmor		= mod:NewSpecialWarningStack(144467, nil, 3, nil, nil, 1, 6, nil, nil, "stackhigh")
local specWarnIgniteArmorOther	= mod:NewSpecialWarningTaunt(144467, nil, nil, nil, 1, 2, nil, nil, "tauntboss")
local specWarnBorerDrill		= mod:NewSpecialWarningDodge(144218, false, nil, nil, 2)
local specWarnGTFO				= mod:NewSpecialWarningGTFO(144218, nil, nil, nil, 1, 8, nil, nil, "watchfeet")
--Siege Mode
local specWarnSeismicActivity	= mod:NewSpecialWarningSpell(144483, nil, nil, nil, 2, 2, nil, nil, "phasechange")
local specWarnShockPulse		= mod:NewSpecialWarningCount(144485, nil, nil, nil, 2, 2, nil, nil, "carefly")
local specWarnCutterLaser		= mod:NewSpecialWarningRun(146325, nil, nil, 2, 4, 2, nil, nil, "laserrun")
local yellCutterLaser			= mod:NewYell(146325)
local specWarnMortarBarrage		= mod:NewSpecialWarningSpell(144553, nil, nil, nil, 2, 2, nil, nil, "watchstep")

local timerDemolisherCanonCD	= mod:NewCDTimer(6.1, 144154, nil, false)--Spammy. off by default
--Assault Mode
local timerAssaultModeCD		= mod:NewNextTimer(62, 141395, nil, nil, "timerAssaultModeCD", 6)--141395 is correct timer text but it's wrong spellid, custom option text for real timer description
local timerIgniteArmor			= mod:NewTargetTimer(30, 144467, nil, "Tank|Healer")
local timerIgniteArmorCD		= mod:NewCDTimer(8.5, 144467, nil, "Tank", nil, 5, nil, DBM_COMMON_L.TANK_ICON)
local timerBorerDrillCD			= mod:NewCDTimer(15.7, 144218, nil, nil, nil, 3)
local timerCrawlerMineCD		= mod:NewCDTimer(30, 144673, nil, "Tank", nil, 5, nil, DBM_COMMON_L.TANK_ICON)
local timerRicochetCD			= mod:NewCDTimer(15, 144356, nil, nil, nil, 3, 144327, DBM_COMMON_L.HEROIC_ICON)
--Siege Mode
local timerSiegeModeCD			= mod:NewNextTimer(114, 84974, nil, nil, "timerSiegeModeCD", 6)--Wish spell name was a litlte shorter but still better than localizing
local timerCutterLaser			= mod:NewBuffFadesTimer(10, 146325)--Spell tooltip says 15 but combat log showed 10
local timerShockPulseCD			= mod:NewNextCountTimer(14.5, 144485, nil, nil, nil, 2)
local timerExplosiveTarCD		= mod:NewNextTimer(30, 144492, nil, nil, nil, 3)
local timerMortarBarrageCD		= mod:NewNextTimer(30, 144553, nil, nil, nil, 3, nil, DBM_COMMON_L.DEADLY_ICON)

local berserkTimer				= mod:NewBerserkTimer(600)

mod.vb.shockCount = 0
mod.vb.siegeMode = false
mod.vb.firstTar = false
mod.vb.firstMortar = false

function mod:OnCombatStart(delay)
	self.vb.shockCount = 0
	self.vb.siegeMode = false
	timerIgniteArmorCD:Start(9-delay)
	timerBorerDrillCD:Start(-delay)
	timerCrawlerMineCD:Start(-delay)
	timerSiegeModeCD:Start(120.5-delay)--First one longer than rest
	if self:IsMythic() then
		berserkTimer:Start(450-delay)
		timerRicochetCD:Start(-delay)
	else
		berserkTimer:Start(-delay)
	end
end


function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 144483 then--Siege mode transition
		self.vb.shockCount = 0
		self.vb.siegeMode = true
		self.vb.firstTar = false
		self.vb.firstMortar = false
		timerCrawlerMineCD:Cancel()
		timerBorerDrillCD:Cancel()
		timerRicochetCD:Cancel()
		specWarnSeismicActivity:Show()
		specWarnSeismicActivity:Play("phasechange")
		timerExplosiveTarCD:Start(4.8)
		timerShockPulseCD:Start(nil, 1)
		if self:IsMythic() then
			timerMortarBarrageCD:Start(20)
		end
		timerAssaultModeCD:Start()
	elseif spellId == 144485 then
		self.vb.shockCount = self.vb.shockCount + 1
		specWarnShockPulse:Show(self.vb.shockCount)
		specWarnShockPulse:Play("carefly")
		if self.vb.shockCount < 3 then
			timerShockPulseCD:Start(nil, self.vb.shockCount+1)
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 146325 then
		self:SendSync("LaserTarget", args.destGUID)
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 144467 then
		if self:AntiSpam(3, 1) then
			timerIgniteArmorCD:Start()
		end
		local uId = DBM:GetRaidUnitId(args.destName)
		if self:IsTanking(uId, "boss1") then
			local amount = args.amount or 1
			warnIgniteArmor:Show(args.destName, amount)
			timerIgniteArmor:Start(args.destName)
			if amount >= 3 then
				if args:IsPlayer() then
					specWarnIgniteArmor:Show(amount)
					specWarnIgniteArmor:Play("stackhigh")
				else
					specWarnIgniteArmorOther:Show(args.destName)
					specWarnIgniteArmorOther:Play("tauntboss")
				end
			end
		end
	elseif spellId == 146325 then
		self:SendSync("LaserTarget", args.destGUID)
	elseif spellId == 144459 then
		warnLaserBurn:CombinedShow(0.5, args.destName)
	elseif spellId == 144498 and args:IsPlayer() then
		specWarnGTFO:Show(args.spellName)
		specWarnGTFO:Play("watchfeet")
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED
mod.SPELL_AURA_REFRESH = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 144467 then
		timerIgniteArmor:Cancel(args.destName)
	elseif spellId == 146325 then
		self:SendSync("LaserTargetRemoved", args.destGUID)
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId, spellName)
	if spellId == 144218 and destGUID == UnitGUID("player") and self:AntiSpam(2.5, 2) then
		specWarnGTFO:Show(spellName)
		specWarnGTFO:Play("watchfeet")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:RAID_BOSS_WHISPER(msg)--It was actually CHAT_MSG_RAID_BOSS_EMOTE during test, but that was a bug, it'll probably be whisper next time
	if msg:find("spell:144918") then
		self:SendSync("LaserTarget", UnitGUID("player"))
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 145407 then
		warnMortarCannon:Show()
	elseif spellId == 144296 then--absolutely do NOT add 144218 to this. 144218 is an every 0.4 second periodic trigger that fires after 144296
		warnBorerDrill:Show()
		specWarnBorerDrill:Show()
		timerBorerDrillCD:Start()
	elseif spellId == 144673 then
		warnCrawlerMine:Show()
		if not self.vb.siegeMode then--These spawn during siege mode but random as all hell, there is no timer in this phase for these
			timerCrawlerMineCD:Start()
		end
	elseif spellId == 144198 then
		warnDemolisherCanon:Show()
		timerDemolisherCanonCD:Start()
	elseif spellId == 144492 then
		warnExplosiveTar:Show()
		if not self.vb.firstTar then
			self.vb.firstTar = true
			timerExplosiveTarCD:Start()
		end
	elseif spellId == 146359 then--Regeneration (Assault Mode power regen activation)
		--2 seconds slower than emote, but it's not pressing enough to matter so it's better localisation wise to do it this way
		timerMortarBarrageCD:Cancel()
		if self.vb.siegeMode == true then--don't start timer on pull regenerate, pull regenerate is 5 seconds longer than rest of them
			self.vb.siegeMode = false
			timerSiegeModeCD:Start()
		end
		--[[if self:IsMythic() then
			timerRicochetCD:Start(22)
		end--]]--TODO, verify consistency, as 22 seems odd and could have just been a delayed cast.
	elseif spellId == 144555 then
		specWarnMortarBarrage:Show()
		specWarnMortarBarrage:Play("watchstep")
		if not self.vb.firstMortar then
			self.vb.firstMortar = true
			timerMortarBarrageCD:Start()
		end
	elseif spellId == 144356 then
		warnRicochet:Show()
		timerRicochetCD:Start()
	end
end

function mod:OnSync(msg, guid)
	--Syncing used do to combat log range issues if raid is too spread out
	--It's easy to be out of range of combat log event
	--We also scan success and applied since we may be in range of one and not the other
	--We just watch both combat events and emote for good measure, so we grab SOMETHING and sync it
	if not self:IsInCombat() then return end
	if msg == "LaserTarget" and guid then
		local targetName = DBM:GetFullPlayerNameByGUID(guid)
		if targetName == UnitName("player") then
			timerCutterLaser:Start()
			specWarnCutterLaser:Show()
			specWarnCutterLaser:Play("laserrun")
			yellCutterLaser:Yell()
		else
			warnCutterLaser:Show(targetName)
		end
	elseif msg == "LaserTargetRemoved" and guid then
		timerCutterLaser:Cancel(DBM:GetFullPlayerNameByGUID(guid))
	end
end

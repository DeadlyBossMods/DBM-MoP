std = "lua51"
max_line_length = false
exclude_files = {
	".luacheckrc"
}
ignore = {
	"211", -- Unused local variable
	"211/L", -- Unused local variable "L"
	"211/CL", -- Unused local variable "CL"
	"212", -- Unused argument
	"213", -- Unused loop variable
	"231/_.*", -- unused variables starting with _
	"311", -- Value assigned to a local variable is unused
	"431", -- shadowing upvalue
	"542", -- An empty if branch
}
globals = {
	-- DBM
	"DBM",
	"DBM_CORE_L",

	-- Lua
	"bit.band",
	"table.wipe",
	"string.split",

	-- WoW
	"ALTERNATE_POWER_INDEX",
	"COMBATLOG_OBJECT_REACTION_HOSTILE",
	"GUILD_INTEREST_RP",
	"LOCALIZED_CLASS_NAMES_MALE",
	"RAID_CLASS_COLORS",

	"C_LFGInfo.GetDungeonInfo",
	"C_Scenario.GetInfo",
	"C_UIWidgetManager.GetIconAndTextWidgetVisualizationInfo",
	"Ambiguate",
	"EJ_GetCreatureInfo",
	"CheckInteractDistance",
	"GetCVar",
	"C_LFGInfo.GetDungeonInfo",
	"GetLocale",
	"GetPartyAssignment",
	"GetRaidRosterInfo",
	"GetTime",
	"GetWorldStateUIInfo",
	"InCombatLockdown",
	"SendChatMessage",
	"SetCVar",
	"SetRaidTarget",
	"UnitCastingInfo",
	"UnitClass",
	"UnitDetailedThreatSituation",
	"UnitExists",
	"UnitFactionGroup",
	"UnitGroupRolesAssigned",
	"UnitGUID",
	"UnitHealth",
	"UnitHealthMax",
	"UnitInRaid",
	"UnitIsDead",
	"UnitIsDeadOrGhost",
	"UnitIsFriend",
	"UnitIsUnit",
	"UnitName",
	"UnitPosition",
	"UnitPower",
	"UnitPowerMax",
}

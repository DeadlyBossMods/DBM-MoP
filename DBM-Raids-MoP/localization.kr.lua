if GetLocale() ~= "koKR" then
	return
end
local L

------------
-- The Stone Guard --
------------
L = DBM:GetModLocalization(679)

L:SetWarningLocalization({
	SpecWarnOverloadSoon		= "곧 %s - 생존기 준비 또는 수호자 이동!",
	specWarnBreakJasperChains	= "벽옥 석화 해제 가능 - 다른 대상과 멀리 떨어지세요!"
})

L:SetOptionLocalization({
	SpecWarnOverloadSoon		= "석화중이지 않은 수호자가 과부화되려고 할 때 특수 경고 보기",
	specWarnBreakJasperChains	= "$spell:130395 를 안전하게 해제할 수 있을 때 특수 경고 보기",
	InfoFrame					= "수호자 기력, 현재 석화상태, 석화 진행중인 수호자를 정보 창으로 보기"
})

L:SetMiscLocalization({
	Overload	= "과부하되기 직전입니다!"
})

------------
-- Feng the Accursed --
------------
L = DBM:GetModLocalization(689)

L:SetWarningLocalization({
	WarnPhase			= "%d 단계",
	specWarnBarrierNow	= "지금 무효화의 장벽 사용!"
})

L:SetOptionLocalization({
	WarnPhase			= "단계 전환 알림 보기",
	specWarnBarrierNow	= "$spell:115817 을 사용해야 할 때 특수 경고 보기(공격대 찾기 전용)",
	RangeFrame			= "지팡이의 혼 단계에서" .. DBM_CORE_L.AUTO_RANGE_OPTION_TEXT_SHORT:format("6")
})

L:SetMiscLocalization({
	Fire	= "오 고귀한 자여! 나와 함께 발라내자! 뼈에서 살을!",
	Arcane	= "오 세기의 현자여! 내게 비전의 지혜를 불어넣어라!",
	Nature	= "오 위대한 영혼이여! 내게 대지의 힘을 부여하라!",
	Shadow	= "과거의 위대한 영웅들이여! 너희의 방패를 빌려다오!"
})

-------------------------------
-- Gara'jal the Spiritbinder --
-------------------------------
L = DBM:GetModLocalization(682)

L:SetMiscLocalization({
	Pull		= "죽을 시간이다!"
})

----------------------
-- The Spirit Kings --
----------------------
L = DBM:GetModLocalization(687)

L:SetWarningLocalization({
	DarknessSoon	= "%d초 후 암흑의 방패"
})

L:SetTimerLocalization({
	timerUSRevive		= "불멸의 어둠 재형성",
	timerRainOfArrowsCD	= "%s"
})

L:SetOptionLocalization({
	DarknessSoon	= "$spell:117697 이전에 초읽기 알림 보기(5초 전부터)",
	timerUSRevive	= "$spell:117506 재형성 바 보기"
})

------------
-- Elegon --
------------
L = DBM:GetModLocalization(726)

L:SetWarningLocalization({
	specWarnDespawnFloor	= "6초 후 가운데 바닥 사라짐 - 낙사 주의!"
})

L:SetTimerLocalization({
	timerDespawnFloor	= "가운데 바닥 사라짐"
})

L:SetOptionLocalization({
	specWarnDespawnFloor	= "가운데 바닥이 사라짐 이전에 특수 경고 보기",
	timerDespawnFloor		= "가운데 바닥이 사라짐 바 보기"
})

------------
-- Will of the Emperor --
------------
L = DBM:GetModLocalization(677)

L:SetOptionLocalization({
	InfoFrame		= "$spell:116525 대상을 정보 창으로 보기",
	CountOutCombo	= "$journal:5673 횟수를 소리로 듣기<br/>알림: 초읽기 소리가 Corsica (Female)로 설정되어 있을때만 작동합니다.",
	ArrowOnCombo	= "$journal:5673 도중 이동해야 할 방향을 DBM 화살표로 보기<br/>알림: 방어전담이 우두머리 앞에 있고 나머지 공격대원이 뒤에 있을때를 기준으로 합니다."
})

L:SetMiscLocalization({
	Pull		= "기계가 윙윙거리며 동작하기 시작합니다! 아래층으로 가십시오!",--Emote
	Rage		= "황제의 분노가 온 언덕에 울려퍼진다.",--Yell
	Strength	= "황제의 힘이 벽감에 나타납니다!",--Emote
	Courage		= "황제의 용기가 벽감에 나타납니다!",--Emote
	Boss		= "거대한 모구 조형체 둘이 큰 벽감에 나타납니다!"--Emote
})

------------
-- Imperial Vizier Zor'lok --
------------
L = DBM:GetModLocalization(745)

L:SetWarningLocalization({
	warnEcho			= "메아리 생성",
	warnEchoDown		= "메아리 처치",
	specwarnAttenuation	= "%s : %s (%s)",
	specwarnPlatform	= "단상 이동!"
})

L:SetOptionLocalization({
	warnEcho			= "메아리 생성 알림 보기",
	warnEchoDown		= "메아리 처치 알림 보기",
	specwarnPlatform	= "단상 이동 특수 경고 보기",
	ArrowOnAttenuation	= "$spell:127834 활성화 중에 이동해야 될 방향을 DBM 화살표로 보기"
})

L:SetMiscLocalization({
	Platform	= "황실 장로 조르로크가 단상으로 날아갑니다!",
	Defeat		= "우리는 어두운 공허의 절망에 지지 않으리라. 우리가 죽는 것이 그분의 뜻이라면, 그대로 따르리라."
})

------------
-- Blade Lord Ta'yak --
------------
L = DBM:GetModLocalization(744)

-------------------------------
-- Garalon --
-------------------------------
L = DBM:GetModLocalization(713)

L:SetWarningLocalization({
	warnCrush		= "%s",
	specwarnUnder	= "보라색 원 바깥으로 나가세요!"
})

L:SetOptionLocalization({
	specwarnUnder	= "가랄론의 보라색 원 안에 있을때 특수 경고 보기",
})

L:SetMiscLocalization({
	UnderHim	= "있는 것을 감지하고",
	Phase2		= "장갑이 갈라지면서 쪼개지기"
})

----------------------
-- Wind Lord Mel'jarak --
----------------------
L = DBM:GetModLocalization(741)

------------
-- Amber-Shaper Un'sok --
------------
L = DBM:GetModLocalization(737)

L:SetWarningLocalization({
	warnReshapeLife				= "%s : >%s< (%d)",
	warnReshapeLifeTutor		= "1: 대상 차단/중첩 생성, 2: 본인 차단, 3: 체력/의지력 회복(주로 3단계에서 사용), 4: 피조물에서 탈출(1,2단계에서 사용)",
	warnAmberExplosion			= "주문시전 %2$s : >%1$s<",
	warnAmberExplosionAM		= "호박석 괴수가 호박석 폭발 시전 중 - 지금 차단!",--personal warning.
	warnInterruptsAvailable		= "%s의 호박석 폭발 차단 가능: >%s<",
	warnWillPower				= "현재 의지력 : %s",
	specwarnWillPower			= "의지력 낮음 - 피조물에서 탈출하거나 바닥을 드세요!",
	specwarnAmberExplosionYou	= "당신에게 %s 사용 - 2번으로 차단!",
	specwarnAmberExplosionAM	= "%s 시전: %s - 1번으로 차단!",
	specwarnAmberExplosionOther	= "%s 시전: %s - 1번으로 차단!"
})

L:SetTimerLocalization({
	timerDestabalize		= "불안정화 (%2$d) : %1$s",
	timerAmberExplosionAMCD	= "폭발 가능: 호박석 괴수"
})

L:SetOptionLocalization({
	warnReshapeLifeTutor		= "돌연변이 피조물 탑승시 피조물 능력 설명 보기",
	warnAmberExplosion			= "$spell:122398 시전 알림 보기(당신 포함)",
	warnAmberExplosionAM		= "호박석 괴수가 $spell:122402 을 시전할 때 개인 차단 알림 보기",
	warnInterruptsAvailable		= "누가 $spell:122402 을 차단할 수 있는지 알림 보기",
	warnWillPower				= "의지력이 80, 50, 30, 10, 4 일때 알림 보기",
	specwarnWillPower			= "피조물 탑승 도중 의지력이 낮을 때 특수 경고 보기",
	specwarnAmberExplosionYou	= "당신의 피조물이 $spell:122402 을 시전할때 차단 특수 경고 보기",
	specwarnAmberExplosionAM	= "호박석 괴수가 $spell:122402 을 시전할때 차단 특수 경고 보기",
	specwarnAmberExplosionOther	= "탑승자가 없는 피조물이 $spell:122398 을 시전할때 차단 특수 경고 보기",
	timerAmberExplosionAMCD		= "호박석 괴수의 다음 $spell:122402 바 보기",
	InfoFrame					= "의지력 정보를 정보 창으로 보기"
})

L:SetMiscLocalization({
	WillPower	= "의지력"
})

------------
-- Grand Empress Shek'zeer --
------------
L = DBM:GetModLocalization(743)

L:SetWarningLocalization({
	warnAmberTrap	= "호박석 덪 생성중 (%d/5)"
})

L:SetOptionLocalization({
	warnAmberTrap	= "$spell:125826 생성 과정 알림 보기",
	InfoFrame		= "$spell:125390 대상을 정보 창으로 보기"
})

L:SetMiscLocalization({
	PlayerDebuffs	= "시선 집중 대상",
	YellPhase3		= "변명은 이제 지겹다, 여제! 당장 이 멍청이들을 쓸어버리지 않으면 내가 몸소 널 죽이겠다!"
})

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("HoFTrash")

L:SetGeneralLocalization({
	name	= "공포의 심장: 일반구간"
})

------------
-- Protectors of the Endless --
------------
L = DBM:GetModLocalization(683)

L:SetWarningLocalization({
	warnGroupOrder		= "타락한 정수 순번 : %s 파티",
	specWarnYourGroup	= "타락한 정수 받을 차례입니다. 준비하세요!"
})

L:SetOptionLocalization({
	warnGroupOrder		= "$spell:118191 파티 순서 알림 보기(25인 전용)<br/>참고: 1파-5번/2파-2번/3파-2번/4파-2번, 그 후 1/2/2/2 순서대로 알립니다.",
	specWarnYourGroup	= "$spell:118191를 받을 차례가 된 경우 특수 경고 보기(25인 전용)",
	RangeFrame			= DBM_CORE_L.AUTO_RANGE_OPTION_TEXT:format(8, 111850) .. "<br/>(대상이 된 경우 모든 공격대원을 보임, 그 외에는 대상자만 보임)"
})

------------
-- Tsulong --
------------
L = DBM:GetModLocalization(742)

L:SetMiscLocalization{
	Victory	= "고맙다, 이방인이여. 날 자유롭게 해줘서."
}

-------------------------------
-- Lei Shi --
-------------------------------
L = DBM:GetModLocalization(729)

L:SetWarningLocalization({
	warnHideOver	= "%s 종료"
})

L:SetTimerLocalization({
	timerSpecialCD	= "숨기/저리 가! 가능 (%d)"
})

L:SetOptionLocalization({
	warnHideOver	= "$spell:123244 종료 알림 보기",
	timerSpecialCD	= "$spell:123244 또는 $spell:123461 대기시간 바 보기",
	RangeFrame		= DBM_CORE_L.AUTO_RANGE_OPTION_TEXT:format(3, 123121).."<br/>(숨기 중일때는 모든 공격대원 보임, 그 외에는 방어전담만 보임)"
})

L:SetMiscLocalization{
	Victory	= "아... 앗! 내가 무슨...? 혹시...? 너무... 흐릿해."
}

----------------------
-- Sha of Fear --
----------------------
L = DBM:GetModLocalization(709)

L:SetWarningLocalization({
	MoveForward					= "건너편으로 이동!",
	MoveRight					= "오른쪽으로 이동!",
	MoveBack					= "이전 위치로 이동!",
	specWarnBreathOfFearSoon	= "곧 공포 숨결 - 장벽 안으로 이동하세요!"
})

L:SetTimerLocalization({
	timerSpecialAbilityCD	= "다음 용오름/혼비백산/일격",
	timerSpoHudCD			= "혼비백산/용오름 가능",
	timerSpoStrCD			= "용오름/일격 가능",
	timerHudStrCD			= "혼비백산/일격 가능"
})

L:SetOptionLocalization({
	warnBreathOnPlatform		= "외부 정자에 있을 때도 $spell:119414 알림 보기<br/>(가급적 설정하지 않기를 권장합니다. 공격대 진행자용 설정입니다.)",
	specWarnBreathOfFearSoon	= "$spell:119414 전에 $spell:117964 효과가 없을 경우 특수 경고 보기",
	specWarnMovement			= "$spell:120047 활성화 중에 이동 경고 보기",
	timerSpecialAbility			= "다음 $spell:120519 또는 $spell:120629 또는 $spell:120672 바 보기"
})

--------------------------
-- Jin'rokh the Breaker --
--------------------------
L = DBM:GetModLocalization(827)

L:SetWarningLocalization({
	specWarnWaterMove	= "곧 %s - 전도성 물에서 빠지세요!"
})

L:SetOptionLocalization({
	specWarnWaterMove	= "$spell:138470 위에 있을 때 특수 경고 보기<br/>($spell:137313 이전 또는 $spell:138732 시간이 얼마 안 남았을때)"
})

--------------
-- Horridon --
--------------
L = DBM:GetModLocalization(819)

L:SetWarningLocalization({
	warnAdds				= "%s",
	warnOrbofControl		= "조종의 구슬 떨어짐",
	specWarnOrbofControl	= "조종의 구슬 떨어짐!"
})

L:SetTimerLocalization({
	timerDoor				= "다음 부족의 문 열림",
	timerAdds				= "다음 %s"
})

L:SetOptionLocalization({
	warnAdds				= "병력 등장시 알림 보기",
	warnOrbofControl		= "$journal:7092 떨어짐시 알림 보기",
	specWarnOrbofControl	= "$journal:7092 떨어짐시 특수 경고 보기",
	timerDoor				= "다음 부족의 문 열림 바 보기",
	timerAdds				= "다음 추가 병력 바 보기",
	SetIconOnAdds			= "추가 병력들에게 전술 목표 아이콘 설정"
})

L:SetMiscLocalization({
	newForces				= "병력들이 쏟아져",
	chargeTarget			= "꼬리를 바닥에 쿵쿵 내려칩니다!"
})

---------------------------
-- The Council of Elders --
---------------------------
L = DBM:GetModLocalization(816)

L:SetWarningLocalization({
	specWarnPossessed	= "%s : %s - 대상 전환!"
})

L:SetOptionLocalization({
	AnnounceCooldowns	= "공격대 생존기 사용을 위해 $spell:137166 횟수를 소리로 듣기<br/>(카즈라진의 빙의가 풀리면 초기화됨)"
})

------------
-- Tortos --
------------
L = DBM:GetModLocalization(825)

L:SetWarningLocalization({
	warnKickShell			= "%s 사용 : >%s< (%d 남음)",
	specWarnCrystalShell	= "%s 받으세요!"
})

L:SetOptionLocalization({
	specWarnCrystalShell	= "$spell:137633 없고 체력이 90% 이상인 경우 특수 경고 보기",
	InfoFrame				= "$spell:137633 없는 대상을 정보 창으로 보기",
	ClearIconOnTurtles		= "$journal:7129이 $spell:133971를 얻은 경우 전술 목표 아이콘 지우기",
	AnnounceCooldowns		= "공격대 생존기 사용을 위해 $spell:134920 횟수를 소리로 듣기"
})

L:SetMiscLocalization({
	WrongDebuff	= "%s 없음"
})

-------------
-- Megaera --
-------------
L = DBM:GetModLocalization(821)

L:SetTimerLocalization({
	timerBreathsCD	= "다음 숨결"
})

L:SetOptionLocalization({
	timerBreaths			= "다음 숨결 바 보기",
	AnnounceCooldowns		= "공격대 생존기 사용을 위해 광란/확산 횟수를 소리로 듣기",
	Never					= "알리지 않음",
	Every					= "횟수 초기화 하지 않음",
	EveryTwo				= "2번 후 초기화",
	EveryThree				= "3번 후 초기화",
	EveryTwoExcludeDiff		= "2번 후 초기화(확산 제외)",
	EveryThreeExcludeDiff	= "3번 후 초기화(확산 제외)"
})

L:SetMiscLocalization({
	rampageEnds	= "분노가 가라앉습니다."
})

------------
-- Ji-Kun --
------------
L = DBM:GetModLocalization(828)

L:SetWarningLocalization({
	warnFlock		= "%2$s : %1$s %3$s",
	specWarnFlock	= "%2$s : %1$s %3$s",
	specWarnBigBird	= "둥지 수호자 : %s"
})

L:SetTimerLocalization({
	timerFlockCD	= "둥지 (%d): %s"
})

L:SetOptionLocalization({
	ShowNestArrows	= "활성화된 둥지쪽으로 화살표 보기",
	Never			= "보이지 않음",
	Northeast		= "파랑 - 아래/위 북동쪽",
	Southeast		= "초록 - 아래/위 남동쪽",
	Southwest		= "보라/빨강 - 아래 남서쪽 & 위 남서쪽(25인)/위 중앙(10인)",
	West			= "빨강 - 아래 서쪽 & 위 중앙(25인)",
	Northwest		= "노랑 - 아래/위 북서쪽(25인)",
	Guardians		= "둥지 수호자"
})

L:SetMiscLocalization({
	eggsHatch		= "있는 알들이 부화하기 시작합니다!",
	Upper			= "윗쪽",
	Lower			= "아래쪽",
	UpperAndLower	= "윗쪽 + 아래쪽",
	TrippleD		= "윗쪽 + 아래쪽 + 아래쪽",
	TrippleU		= "윗쪽 + 윗쪽 + 아래쪽",
	NorthEast		= "|cff0000ff북동쪽|r",
	SouthEast		= "|cFF088A08남동쪽|r",
	SouthWest		= "|cFF9932CD남서쪽|r",
	West			= "|cffff0000서쪽|r",
	NorthWest		= "|cffffff00북서쪽|r",
	Middle10		= "|cFF9932CD중앙|r",
	Middle25		= "|cffff0000중앙|r"
})

--------------------------
-- Durumu the Forgotten --
--------------------------
L = DBM:GetModLocalization(818)

L:SetWarningLocalization({
	warnBeamNormal				= "광선 - |cffff0000적색|r : >%s<, |cff0000ff청색|r : >%s<",
	warnBeamHeroic				= "광선 - |cffff0000적색|r : >%s<, |cff0000ff청색|r : >%s<, |cffffff00황색|r : >%s<",
	warnAddsLeft				= "안개도깨비 남음 : %d",
	specWarnBlueBeam			= "당신에게 청색 광선 - 절대 이동 금지!",
	specWarnFogRevealed			= "%s 드러남!",
	specWarnDisintegrationBeam	= "%s (%s)"
})

L:SetOptionLocalization({
	warnBeam			= "광선 대상 알림 보기",
	warnAddsLeft		= "안개도깨비 남은 횟수알림 보기",
	specWarnFogRevealed	= "안개도깨비가 드러날 때 특수 경고 보기",
	ArrowOnBeam			= "$journal:6882 활성화 중에 이동해야 될 방향을 DBM 화살표로 보기",
	InfoFrame			= "$spell:133795 중첩을 정보 창으로 보기",
	SetParticle			= "전투 시작시 입자 밀도를 최저로 설정<br/>(전투 종료 후 원상태로 복구됨)"
})

L:SetMiscLocalization({
	LifeYell	= "%s 생명력 흡수 중! (%d중첩)"
})

----------------
-- Primordius --
----------------
L = DBM:GetModLocalization(820)

L:SetWarningLocalization({
	warnDebuffCount	= "변형 정보 : 이로운 효과 - %d/5개, 해로운 효과 - %d개"
})

L:SetOptionLocalization({
	warnDebuffCount		= "웅덩이를 흡수할 때 변형 상태 알림 보기",
	SetIconOnBigOoze	= "$journal:6969 에게 전술 목표 아이콘 설정"
})

-----------------
-- Dark Animus --
-----------------
L = DBM:GetModLocalization(824)

L:SetWarningLocalization({
	warnMatterSwapped	= "%s 자리바꿈 : >%s<, >%s<"
})

L:SetOptionLocalization({
	warnMatterSwapped	= "$spell:138618 자리바꿈 알림 보기"
})

L:SetMiscLocalization({
	Pull	= "구슬이 폭발합니다!"
})

--------------
-- Iron Qon --
--------------
L = DBM:GetModLocalization(817)

L:SetWarningLocalization({
	warnDeadZone	= "%s : %s, %s"
})

L:SetOptionLocalization({
	RangeFrame	= "전투 진영에 따라 거리 창 보기(10m)<br/>(일정 인원 이상이 뭉쳐 있을 때만 보이는 똑똑한 거리 창 입니다.)",
	InfoFrame	= "$spell:136193 대상을 정보 창으로 보기"
})

-------------------
-- Twin Consorts --
-------------------
L = DBM:GetModLocalization(829)

L:SetWarningLocalization({
	warnNight	= "밤 단계",
	warnDay		= "낮 단계",
	warnDusk	= "황혼 단계"
})

L:SetTimerLocalization({
	timerDayCD	= "낮 단계",
	timerDuskCD	= "황혼 단계"
})

L:SetMiscLocalization({
	DuskPhase	= "루린! 힘을 빌려다오!"
})

--------------
-- Lei Shen --
--------------
L = DBM:GetModLocalization(832)

L:SetWarningLocalization({
	specWarnIntermissionSoon	= "곧 사잇단계!",
	warnDiffusionChainSpread	= "%s 전이 : >%s<"
})

L:SetTimerLocalization({
	timerConduitCD	= "도관 기술 가능"
})

L:SetOptionLocalization({
	specWarnIntermissionSoon	= "사잇단계 진입 전에 특수 경고 보기",
	warnDiffusionChainSpread	= "$spell:135991 전이 대상 알림 보기",
	timerConduitCD				= "최초 도관 기술 대기시간 바 보기",
	StaticShockArrow			= "$spell:135695 대상이 정해진 경우 DBM 화살표 보기",
	OverchargeArrow				= "$spell:136295 대상이 정해진 경우 DBM 화살표 보기"
})

L:SetMiscLocalization({
	StaticYell	= "%s의 전하 충격 발생 전! (%d초 남음)"
})

------------
-- Ra-den --
------------
L = DBM:GetModLocalization(831)

L:SetWarningLocalization({
	specWarnUnstablVitaJump	= "당신에게 불안정한 생령 전이됨!"
})

L:SetOptionLocalization({
	specWarnUnstablVitaJump	= "$spell:138297 전이 대상이 당신이 된 경우 특수 경고 보기"
})

L:SetMiscLocalization({
	Defeat	= "잠깐"
})

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("ToTTrash")

L:SetGeneralLocalization({
	name	= "천둥의 왕좌: 일반구간"
})

---------------
-- Immerseus --
---------------
L = DBM:GetModLocalization(852)

---------------------------
-- The Fallen Protectors --
---------------------------
L = DBM:GetModLocalization(849)

L:SetWarningLocalization({
	specWarnCalamity	= "%s",
	specWarnMeasures	= "곧 궁책 (%s)!"
})

---------------------------
-- Norushen --
---------------------------
L = DBM:GetModLocalization(866)

L:SetMiscLocalization({
	wasteOfTime	= "그래, 좋다. 너희 타락을 가두어 둘 공간을 만들겠다."
})

------------------
-- Sha of Pride --
------------------
L = DBM:GetModLocalization(867)

L:SetOptionLocalization({
	SetIconOnFragment	= "타락한 조각 에게 전술 목표 아이콘 설정"
})

--------------
-- Galakras --
--------------
L = DBM:GetModLocalization(868)

L:SetWarningLocalization({
	warnTowerOpen	= "탑문 열림",
	warnTowerGrunt	= "폭파조 등장"
})

L:SetTimerLocalization({
	timerTowerCD		= "다음 탑문 열림",
	timerTowerGruntCD	= "다음 폭파조"
})

L:SetOptionLocalization({
	warnTowerOpen		= "탑문 열림 알림 보기",
	warnTowerGrunt		= "폭파조 등장 알림 보기",
	timerTowerCD		= "다음 탑문 열림 바 보기",
	timerTowerGruntCD	= "다음 폭파조 바 보기"
})

L:SetMiscLocalization({
	wasteOfTime		= "잘했다! 상륙 부대, 정렬! 보병대, 앞으로!",--Alliance Version
	wasteOfTime2	= "잘 했소. 선봉대가 성공적으로 상륙했군.",--Horde Version
	Pull			= "용아귀 부족 용사들이여! 항구를 탈환하고 적을 바다로 몰아내라! 헬스크림 님과 진정한 호드를 위하여!",
	newForces1		= "놈들이 와요!",--제이나 대사
	newForces1H		= "저 계집을 당장 끌어내려라. 내가 친히 그녀의 목을 죌 것이다.",--실바나스 대사 (확인 필요)
	newForces2		= "용아귀 용사들아, 진격하라!",
	newForces3		= "헬스크림 님을 위하여!",
	newForces4		= "다음 분대, 진격!",
	tower			= "문이 뚫렸습니다!"
})

--------------------------
-- Kor'kron Dark Shaman --
--------------------------
L = DBM:GetModLocalization(856)

L:SetMiscLocalization({
	PrisonYell	= "%s의 강철 감옥 %d초 남음!"
})

---------------------
-- General Nazgrim --
---------------------
L = DBM:GetModLocalization(850)

L:SetWarningLocalization({
	warnDefensiveStanceSoon	= "%d초 후 방어 태세"
})

L:SetMiscLocalization({
	newForces1	= "전사들이여! 이리로!",
	newForces2	= "놈들을 막아라!",--확인 필요
	newForces3	= "병력 집결!",
	newForces4	= "코르크론! 날 지원하라!",
	newForces5	= "다음 분대, 앞으로!",
	allForces	= "전 코르크론, 내 명령을 따르라. 모두 죽여!",
	nextAdds	= "다음 병력: "
})

------------------------
-- Spoils of Pandaria --
------------------------
L = DBM:GetModLocalization(870)

L:SetMiscLocalization({
	wasteOfTime	= "녹음되고 있는 건가? 응? 좋아. 고블린 티탄 제어 모듈 시동 중. 물러서라고.",
	Module1 	= "제1 모듈, 시스템 초기화 준비 완료.",
	Victory		= "제2 모듈, 시스템 초기화 준비 완료."
})

---------------------------
-- Thok the Bloodthirsty --
---------------------------
L = DBM:GetModLocalization(851)

L:SetOptionLocalization({
	RangeFrame	= "거리 창 보기(10m) (피의 광란이 가능한 경우에만 보임)"
})

----------------------------
-- Siegecrafter Blackfuse --
----------------------------
L = DBM:GetModLocalization(865)

L:SetOptionLocalization({
	InfoFrame	= "$journal:8202 정보를 정보 창으로 보기"
})

L:SetMiscLocalization({
	newWeapons	= "생산 설비에서 미완성 무기가 나오기 시작합니다.",
	newShredder	= "자동 분쇄기가 다가옵니다!"
})

----------------------------
-- Paragons of the Klaxxi --
----------------------------
L = DBM:GetModLocalization(853)

L:SetWarningLocalization({
	specWarnActivatedVulnerable	= "%s에게 취약함 - 주의!",
	specWarnMoreParasites		= "기생충이 더 필요합니다 - 막지마세요!"
})

L:SetOptionLocalization({
	specWarnActivatedVulnerable	= "활성화된 용장중 주의해야 할 용장이 있을 경우 특수 경고 보기",
	specWarnMoreParasites		= "기생충이 더 필요할 때 특수 경고 보기"
})

L:SetMiscLocalization({
	--thanks to blizz, the only accurate way for this to work, is to translate 5 emotes in all languages
	one				= "가 1",
	two				= "가 2",
	three			= "가 3",
	four			= "가 4",
	five			= "가 5",
	hisekFlavor		= "누가 이제 조용한지 봐라.",
	KilrukFlavor	= "무리의 도태가 일어난 또 다른 날이 되었군.",
	XarilFlavor		= "너의 미래에 검은 하늘만 보일뿐.",
	KaztikFlavor	= "단지 쿤총 특식이 되어버렸군.",
	KaztikFlavor2	= "사마귀 한마리 처치. 199마리 남았음.",
	KorvenFlavor	= "고대 제국의 멸망.",
	KorvenFlavor2	= "구르다니 서판을 가져온 후 그들의 숨통을 끊어!",
	IyyokukFlavor	= "기회를 포착하고, 활용해라!",
	KarozFlavor		= "힘 안 들이고 잡아 없애면서도 명성이 높아지는데 뭘 그러나.",
	SkeerFlavor		= "피투성이의 즐거움!",
	RikkalFlavor	= "표본 요청 달성됨."
})

------------------------
-- Garrosh Hellscream --
------------------------
L = DBM:GetModLocalization(869)

L:SetTimerLocalization({
	timerRoleplay	= "이벤트 진행"
})

L:SetOptionLocalization({
	timerRoleplay		= "가로쉬/스랄 이벤트 진행 바 보기",
	RangeFrame			= "거리 창 보기(8m)($spell:147126 주문의 경고 수치에 도달한 경우에만 보임)",
	InfoFrame			= "사잇단계에서 피해 감소가 없는 대상을 정보 창으로 보기",
	yellMaliceFading	= "$spell:147209 가 사라지기 전에 대화로 알리기"
})

L:SetMiscLocalization({
	wasteOfTime		= "아직 늦지 않았다, 가로쉬. 대족장이라는 짐을 내려놓거라. 지금, 여기서 끝내자. 피를 흘릴 필요는 없다.",
	NoReduce		= "피해 감소 없음",
	MaliceFadeYell	= "%s의 악의 %d초 남음!",
	phase3End		= "네가 이겼다고 생각하나?"
})

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("SoOTrash")

L:SetGeneralLocalization({
	name	= "오그리마 공성전: 일반구간"
})

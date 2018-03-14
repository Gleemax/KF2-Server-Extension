Class Ext_TraitMedDamBoost extends Ext_TraitBase;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).HealingDamageBoostPct = 5.0f + (5.f + ((float(Level) - 1.f) * 5.f));
}

static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).HealingDamageBoostPct = 5.0f;
}

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).bHealingDamageBoost = true;
}

static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).bHealingDamageBoost = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkFieldMedic'
	TraitName="焦点注射"
	NumLevels=3
	DefLevelCosts(0)=40
	DefLevelCosts(1)=50
	DefLevelCosts(2)=60
	DefMinLevel=85
	Description="治疗玩家将会增加他们的伤害至最大最大到15%，其增幅百分比按等级增加：|Lv1-3: 5%, 10%, 15%"
}
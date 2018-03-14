Class Ext_TraitMedShield extends Ext_TraitBase;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).HealingShieldPct = 10.0f + (5.f + ((float(Level) - 1.f) * 5.f));
}

static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).HealingShieldPct = 10.0f;
}

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).bHealingShield = true;
}

static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).bHealingShield = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkFieldMedic'
	TraitName="促凝剂"
	NumLevels=5
	DefLevelCosts(0)=35
	DefLevelCosts(1)=10
	DefLevelCosts(2)=20
	DefLevelCosts(3)=30
	DefLevelCosts(4)=40
	DefMinLevel=100
	Description="治疗玩家会增加他们的伤害抗性，其增幅随等级增加：|Lv1-5: 10%, 15%, 20%, 25%, 30%"
}
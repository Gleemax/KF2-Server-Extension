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
	NumLevels=4
	DefLevelCosts(0)=40
	DefLevelCosts(1)=15
	DefLevelCosts(2)=20
	DefLevelCosts(3)=25
	DefMinLevel=85
}
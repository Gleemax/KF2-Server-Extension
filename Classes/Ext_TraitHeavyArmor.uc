Class Ext_TraitHeavyArmor extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( Level >= 3 )
		Perk.bHeavyArmor = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bHeavyArmor = false;
}

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Level == 1 ? Player.AddArmor(100) : Player.AddArmor(Player.MaxArmor);
}

defaultproperties
{
	NumLevels=3
	DefLevelCosts(0)=20
	DefLevelCosts(1)=30
	DefLevelCosts(2)=50
	DefMinLevel=50
}
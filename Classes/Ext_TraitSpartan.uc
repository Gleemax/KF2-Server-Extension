Class Ext_TraitSpartan extends Ext_TraitBase;

var array<float> AtkRates;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( ExtHumanPawn(Player)!=None )
		ExtHumanPawn(Player).bMovesFastInZedTime = true;
	if ( Level >= 2 )
		Ext_PerkBerserker(Perk).bSpartanAttack = true;
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( ExtHumanPawn(Player)!=None )
		ExtHumanPawn(Player).bMovesFastInZedTime = false;
	Ext_PerkBerserker(Perk).bSpartanAttack = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkBerserker'
	TraitGroup=class'Ext_TGroupZEDTime'
	NumLevels=2
	DefLevelCosts(0)=30
	DefLevelCosts(1)=40
	DefMinLevel=100
}
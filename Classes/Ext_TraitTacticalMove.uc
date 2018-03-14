Class Ext_TraitTacticalMove extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSWAT(Perk).RepTacticalMove = Level;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSWAT(Perk).RepTacticalMove = 0;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSWAT'
	TraitName="战术移动"
	NumLevels=3
	DefLevelCosts(0)=30
	DefLevelCosts(1)=35
	DefLevelCosts(2)=50
	Description="该天赋会使你在机械瞄准和蹲伏时拥有额外的移动速度：|Lv 1-3: +30%,+50%,+100%"
}
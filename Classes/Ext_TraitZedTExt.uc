Class Ext_TraitZedTExt extends Ext_TraitBase;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkCommando(Perk).ZTExtCount = Level;
}

static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkCommando(Perk).ZTExtCount = Level;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkCommando'
	TraitName="ɥʬʱ����չ"
	NumLevels=6
	DefLevelCosts(0)=15
	DefLevelCosts(1)=25
	DefLevelCosts(2)=35
	DefLevelCosts(3)=45
	DefLevelCosts(4)=55
	DefLevelCosts(5)=65
	DefMinLevel=15
	Description="Ϊ���ְҵ���Ӷ����ɥʬʱ�䳤�ȣ�����չ�ĳ���Ϊÿ������1�롣"
}
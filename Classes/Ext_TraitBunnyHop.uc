Class Ext_TraitBunnyHop extends Ext_TraitBase;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( ExtHumanPawn(Player)!=None )
		ExtHumanPawn(Player).bHasBunnyHop = true;
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( ExtHumanPawn(Player)!=None )
		ExtHumanPawn(Player).bHasBunnyHop = false;
}

defaultproperties
{
	TraitName="������"
	DefLevelCosts(0)=50
	DefMinLevel=100
	Description="������ҽ�����������ʹ��������ǰ�ƶ�ʱ��ͨ����������ǰ��Ծʹ�ƶ��ٶȲ������ӡ�"
}
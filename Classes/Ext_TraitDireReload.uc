Class Ext_TraitDireReload extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSharpshooter(Perk).bHasDireReload = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSharpshooter(Perk).bHasDireReload = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSharpshooter'
	TraitName="����װ��"
	DefLevelCosts(0)=35
	Description="���������ֵ����40��ʱ�㽫�Ἣ����������װ���ٶȡ�"
}
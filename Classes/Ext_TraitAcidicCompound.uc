Class Ext_TraitAcidicCompound extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).bUseToxicDamage = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).bUseToxicDamage = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkFieldMedic'
	TraitName="���ص�ͷ"
	DefLevelCosts(0)=15
	DefMinLevel=5
	Description="�ڸ��츳�����ʱ�����������ʹɥʬ�ж���"
}
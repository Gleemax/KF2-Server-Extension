Class Ext_TraitMedicPistol extends Ext_TraitBase;

static function AddDefaultInventory( KFPawn Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Player.DefaultInventory.RemoveItem(class'ExtWeap_Pistol_9mm');
	Player.DefaultInventory.AddItem(class'ExtWeap_Pistol_MedicS');
}

defaultproperties
{
	TraitName="ҽ����ǹ"
	DefLevelCosts(0)=20
	Description="������ʱЯ���Ļ���9mm��ǹ�滻��101ҽ����ǹ��"
}
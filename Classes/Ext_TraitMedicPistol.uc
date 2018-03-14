Class Ext_TraitMedicPistol extends Ext_TraitBase;

static function AddDefaultInventory( KFPawn Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Player.DefaultInventory.RemoveItem(class'ExtWeap_Pistol_9mm');
	Player.DefaultInventory.AddItem(class'ExtWeap_Pistol_MedicS');
}

defaultproperties
{
	TraitName="医疗手枪"
	DefLevelCosts(0)=20
	Description="将重生时携带的基础9mm手枪替换成101医疗手枪。"
}
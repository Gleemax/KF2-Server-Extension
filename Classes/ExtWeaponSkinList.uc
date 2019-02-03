class ExtWeaponSkinList extends Object;

struct WeaponSkin
{
	var int 	Id;

	var array<string> 	MIC_1P;
	var string 			MIC_3P;
	var string  		MIC_Pickup;

	var class<KFWeaponDefinition> WeaponDef;
};

enum EWeaponSkinType
{
	WST_FirstPerson,
	WST_ThirdPerson,
	WST_Pickup,
};
var array<WeaponSkin> Skins;

static function array<MaterialInterface> GetWeaponSkin(int ItemId, EWeaponSkinType Type, ExtPlayerController PC)
{
    local int i;
	local array<MaterialInterface> Mats;
	local MaterialInterface LoadedMat;
	local string FirstPMat;
	
	i = default.Skins.Find('Id', ItemId);
	if( i > -1 )
	{
		switch( Type )
		{
		case WST_FirstPerson:
			foreach default.Skins[i].MIC_1P(FirstPMat)
			{
				LoadedMat = MaterialInterface(DynamicLoadObject(FirstPMat, class'MaterialInterface'));
				if( LoadedMat != None )
					Mats.AddItem(LoadedMat);
			}
		
			break;
		case WST_ThirdPerson:
			LoadedMat = MaterialInterface(DynamicLoadObject(default.Skins[i].MIC_3P, class'MaterialInterface'));
			if( LoadedMat != None )
				Mats.AddItem(LoadedMat);
		
			break;
		case WST_Pickup:
			LoadedMat = MaterialInterface(DynamicLoadObject(default.Skins[i].MIC_Pickup, class'MaterialInterface'));
			if( LoadedMat != None )
				Mats.AddItem(LoadedMat);
		
			break;
		}
	}
	
	return Mats;
}

static function SaveWeaponSkin(class<KFWeaponDefinition> WeaponDef, int ID, ExtPlayerController PC )
{
	local int ALen, i;
	
	i = PC.SavedWeaponSkins.Find('WepDef', WeaponDef);
	if( i > -1 )
		PC.SavedWeaponSkins.Remove(i, 1);
	
	ALen = PC.SavedWeaponSkins.Length;
	PC.SavedWeaponSkins[ALen].ID = ID;
	PC.SavedWeaponSkins[ALen].WepDef = WeaponDef;
	
	PC.SaveConfig();
}

static function bool IsSkinEquip(class<KFWeaponDefinition> WeaponDef, int ID, ExtPlayerController PC)
{
    local int i;
	i = PC.SavedWeaponSkins.Find('ID', ID);
	if( i > -1 )
		return true;

	return false;
}

defaultproperties
{
//Anodized Hazard AR15
	Skins.Add((Id=3001, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_3P_Pickup_MIC"))
 	Skins.Add((Id=3002, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3003, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_3P_Pickup_MIC"))

//Airlock 9mm
	Skins.Add((Id=3004, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_3P_Pickup_MIC"))
 	Skins.Add((Id=3005, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_3P_Pickup_MIC"))
	Skins.Add((Id=3006, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_3P_Pickup_MIC"))

//Aeronaut Bullpup
	Skins.Add((Id=3007, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_3P_Pickup_MIC"))
	Skins.Add((Id=3008, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_3P_Pickup_MIC"))
	Skins.Add((Id=3009, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_3P_Pickup_MIC"))

//Woodland AA12
	Skins.Add((Id=3010, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSetPSN03_MAT.woodland_aa12.Woodland_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.woodland_aa12.Woodland_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.woodland_aa12.Woodland_AA12_3P_Pickup_MIC"))
 	Skins.Add((Id=3011, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSetPSN03_MAT.woodland_aa12.Woodland_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.woodland_aa12.Woodland_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.woodland_aa12.Woodland_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3012, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSetPSN03_MAT.woodland_aa12.Woodland_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.woodland_aa12.Woodland_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.woodland_aa12.Woodland_AA12_3P_Pickup_MIC"))

//Woodland Boomstick
	Skins.Add((Id=3013, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSetPSN03_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_3P_Pickup_MIC"))
 	Skins.Add((Id=3014, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSetPSN03_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_3P_Pickup_MIC"))
	Skins.Add((Id=3015, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSetPSN03_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_3P_Pickup_MIC"))

//Woodland L85A2
	Skins.Add((Id=3016, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSetPSN03_MAT.woodland_bullpup.Woodland_Bullpup_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.woodland_bullpup.Woodland_Bullpup_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.woodland_bullpup.Woodland_Bullpup_3P_Pickup_MIC"))
 	Skins.Add((Id=3017, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSetPSN03_MAT.woodland_bullpup.Woodland_Bullpup_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.woodland_bullpup.Woodland_Bullpup_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.woodland_bullpup.Woodland_Bullpup_3P_Pickup_MIC"))
	Skins.Add((Id=3018, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSetPSN03_MAT.woodland_bullpup.Woodland_Bullpup_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.woodland_bullpup.Woodland_Bullpup_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.woodland_bullpup.Woodland_Bullpup_3P_Pickup_MIC"))

//Woodland Scar
	Skins.Add((Id=3019, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSetPSN03_MAT.woodland_scar.Woodland_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.woodland_scar.Woodland_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.woodland_scar.Woodland_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3020, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSetPSN03_MAT.woodland_scar.Woodland_SCAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.woodland_scar.Woodland_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.woodland_scar.Woodland_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3021, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSetPSN03_MAT.woodland_scar.Woodland_SCAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.woodland_scar.Woodland_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.woodland_scar.Woodland_SCAR_3P_Pickup_MIC"))

//Arachnid Nailgun
	Skins.Add((Id=3022, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSetPSN01_MAT.arachnid_nailgun.Arachnid_NailGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.arachnid_nailgun.Arachnid_NailGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.arachnid_nailgun.Arachnid_NailGun_3P_Pickup_MIC"))
	Skins.Add((Id=3023, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSetPSN01_MAT.arachnid_nailgun.Arachnid_NailGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.arachnid_nailgun.Arachnid_NailGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.arachnid_nailgun.Arachnid_NailGun_3P_Pickup_MIC"))
	Skins.Add((Id=3024, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSetPSN01_MAT.arachnid_nailgun.Arachnid_NailGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.arachnid_nailgun.Arachnid_NailGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.arachnid_nailgun.Arachnid_NailGun_3P_Pickup_MIC"))

//Bloated 9mm
	Skins.Add((Id=3025, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetPSN01_MAT.bloated_9mm.Bloated_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.bloated_9mm.Bloated_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.bloated_9mm.Bloated_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3026, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetPSN01_MAT.bloated_9mm.Bloated_9mm_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.bloated_9mm.Bloated_9mm_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.bloated_9mm.Bloated_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3027, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetPSN01_MAT.bloated_9mm.Bloated_9mm_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.bloated_9mm.Bloated_9mm_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.bloated_9mm.Bloated_9mm_3P_Pickup_MIC"))

//Monster Killer M4
	Skins.Add((Id=3028, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_3P_Pickup_MIC"))
	Skins.Add((Id=3029, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_3P_Pickup_MIC"))
	Skins.Add((Id=3030, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_3P_Pickup_MIC"))

//Grave Digger Crovel
	Skins.Add((Id=3031, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSetPSN01_MAT.gravedigger_crovel.GraveDigger_Crovel_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.gravedigger_crovel.GraveDigger_Crovel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.gravedigger_crovel.GraveDigger_Crovel_3P_Pickup_MIC"))
	Skins.Add((Id=3032, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSetPSN01_MAT.gravedigger_crovel.GraveDigger_Crovel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.gravedigger_crovel.GraveDigger_Crovel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.gravedigger_crovel.GraveDigger_Crovel_3P_Pickup_MIC"))
	Skins.Add((Id=3033, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSetPSN01_MAT.gravedigger_crovel.GraveDigger_Crovel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.gravedigger_crovel.GraveDigger_Crovel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.gravedigger_crovel.GraveDigger_Crovel_3P_Pickup_MIC"))

//Clot Commando Scar
	Skins.Add((Id=3036, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSetPSN01_MAT.clotcommando_scar.ClotCommando_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.clotcommando_scar.ClotCommando_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.clotcommando_scar.ClotCommando_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3035, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSetPSN01_MAT.clotcommando_scar.ClotCommando_SCAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.clotcommando_scar.ClotCommando_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.clotcommando_scar.ClotCommando_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3034, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSetPSN01_MAT.clotcommando_scar.ClotCommando_SCAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.clotcommando_scar.ClotCommando_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.clotcommando_scar.ClotCommando_SCAR_3P_Pickup_MIC"))

//Shark Teeth Double Barrel
	Skins.Add((Id=3039, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_3P_Pickup_MIC"))
	Skins.Add((Id=3038, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_3P_Pickup_MIC"))
	Skins.Add((Id=3037, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_3P_Pickup_MIC"))

//Tiger RPG7
	Skins.Add((Id=3042, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSetPSN03_MAT.tiger_rpg7.Tiger_RPG7_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.tiger_rpg7.Tiger_RPG7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.tiger_rpg7.Tiger_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=3041, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSetPSN03_MAT.tiger_rpg7.Tiger_RPG7_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.tiger_rpg7.Tiger_RPG7_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.tiger_rpg7.Tiger_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=3040, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSetPSN03_MAT.tiger_rpg7.Tiger_RPG7_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.tiger_rpg7.Tiger_RPG7_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.tiger_rpg7.Tiger_RPG7_3P_Pickup_MIC"))

//Tiger M79
	Skins.Add((Id=3046, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSetPSN03_MAT.tiger_m79.Tiger_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.tiger_m79.Tiger_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.tiger_m79.Tiger_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3045, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSetPSN03_MAT.tiger_m79.Tiger_M79_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.tiger_m79.Tiger_M79_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.tiger_m79.Tiger_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3044, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSetPSN03_MAT.tiger_m79.Tiger_M79_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.tiger_m79.Tiger_M79_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.tiger_m79.Tiger_M79_3P_Pickup_MIC"))

//Tiger HX25
	Skins.Add((Id=3049, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSetPSN03_MAT.tiger_hx25.Tiger_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.tiger_hx25.Tiger_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.tiger_hx25.Tiger_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3048, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSetPSN03_MAT.tiger_hx25.Tiger_HX25_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.tiger_hx25.Tiger_HX25_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.tiger_hx25.Tiger_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3047, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSetPSN03_MAT.tiger_hx25.Tiger_HX25_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.tiger_hx25.Tiger_HX25_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.tiger_hx25.Tiger_HX25_3P_Pickup_MIC"))

//Tiger AK12
	Skins.Add((Id=3052, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSetPSN03_MAT.tiger_ak12.Tiger_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.tiger_ak12.Tiger_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.tiger_ak12.Tiger_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3051, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSetPSN03_MAT.tiger_ak12.Tiger_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.tiger_ak12.Tiger_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.tiger_ak12.Tiger_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3050, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSetPSN03_MAT.tiger_ak12.Tiger_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN03_MAT.tiger_ak12.Tiger_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN03_MAT.tiger_ak12.Tiger_AK12_3P_Pickup_MIC"))

//Skull Cracker Pulverizer
	Skins.Add((Id=3055, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSetPSN01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=3054, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSetPSN01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=3053, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSetPSN01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_3P_Pickup_MIC"))

//Fleshpounder AA12
	Skins.Add((Id=3058, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSetPSN01_MAT.fleshpounder_aa12.Fleshpounder_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3057, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSetPSN01_MAT.fleshpounder_aa12.Fleshpounder_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3056, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSetPSN01_MAT.fleshpounder_aa12.Fleshpounder_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_Pickup_MIC"))

//Horzine Elite Blue SCAR
	Skins.Add((Id=3064, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_1P_Mint_MIC", "WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3063, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_1P_FieldTested_MIC", "WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3062, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_1P_BattleScarred_MIC", "WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_Pickup_MIC"))

//Horzine Elite Red SCAR
	Skins.Add((Id=3061, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_1P_Mint_MIC", "WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3060, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_1P_FieldTested_MIC", "WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3059, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_1P_BattleScarred_MIC", "WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_Pickup_MIC"))

//Horzine Elite White SCAR
	Skins.Add((Id=3613, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_1P_Mint_MIC", "WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3612, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_1P_FieldTested_MIC", "WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3611, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_1P_BattleScarred_MIC", "WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_3P_Pickup_MIC"))

//Horzine Elite Green SCAR
	Skins.Add((Id=3616, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_1P_Mint_MIC", "WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3615, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_1P_FieldTested_MIC", "WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3614, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_1P_BattleScarred_MIC", "WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_3P_Pickup_MIC"))

//Horzine Elite Blue L85A2
	Skins.Add((Id=3619, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_1P_Mint_MIC", "WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3618, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_1P_FieldTested_MIC", "WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3617, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_1P_BattleScarred_MIC", "WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_3P_Pickup_MIC"))

//Horzine Elite Red L85A2
	Skins.Add((Id=3622, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_1P_Mint_MIC", "WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3621, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_1P_FieldTested_MIC", "WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3620, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_1P_BattleScarred_MIC", "WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_3P_Pickup_MIC"))

//Horzine Elite White L85A2
	Skins.Add((Id=3625, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_1P_Mint_MIC", "WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3624, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_1P_FieldTested_MIC", "WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3623, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_1P_BattleScarred_MIC", "WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_3P_Pickup_MIC"))

//Horzine Elite Green L85A2
	Skins.Add((Id=3628, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_1P_Mint_MIC", "WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3627, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_1P_FieldTested_MIC", "WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3626, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_1P_BattleScarred_MIC", "WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_3P_Pickup_MIC"))

//CyberBone Katana
	Skins.Add((Id=3070, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_3P_Pickup_MIC"))
	Skins.Add((Id=3069, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_3P_Pickup_MIC"))
	Skins.Add((Id=3068, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_3P_Pickup_MIC"))

//CyberBone AA12
	Skins.Add((Id=3076, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3075, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3074, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_3P_Pickup_MIC"))

//CyberBone AK12
	Skins.Add((Id=3073, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3072, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3071, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_3P_Pickup_MIC"))

//CyberBone AR15
	Skins.Add((Id=3079, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3078, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3077, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_3P_Pickup_MIC"))

//CyberBone Support Knife
	Skins.Add((Id=3344, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_3P_Pickup_MIC"))
	Skins.Add((Id=3343, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_3P_Pickup_MIC"))
	Skins.Add((Id=3342, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_3P_Pickup_MIC"))

//Stories of War AA12
	Skins.Add((Id=3094, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3093, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3092, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_3P_Pickup_MIC"))

//Stories of War AK12
	Skins.Add((Id=3112, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3111, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3110, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_3P_Pickup_MIC"))

//Stories of War Dragons Breath
	Skins.Add((Id=3088, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=3087, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=3086, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_3P_Pickup_MIC"))

//Stories of War M4
	Skins.Add((Id=3082, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_3P_Pickup_MIC"))
	Skins.Add((Id=3081, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_3P_Pickup_MIC"))
	Skins.Add((Id=3080, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_3P_Pickup_MIC"))

//Stories of War M79
	Skins.Add((Id=3091, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3090, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3089, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_3P_Pickup_MIC"))

//Stories of War RPG7
	Skins.Add((Id=3097, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=3096, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=3095, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_3P_Pickup_MIC"))

//Stories of War SCAR
	Skins.Add((Id=3085, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3084, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3083, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_3P_Pickup_MIC"))

//Dragonfire Caulk N Burn
	Skins.Add((Id=3100, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=3099, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=3098, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_3P_Pickup_MIC"))

//Dragonfire Dragons Breath
	Skins.Add((Id=3106, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=3105, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=3104, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_3P_Pickup_MIC"))

//Dragonfire Firebug Knife
	Skins.Add((Id=3109, Weapondef=class'KFWeapDef_Knife_Firebug', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_3P_Pickup_MIC"))
	Skins.Add((Id=3108, Weapondef=class'KFWeapDef_Knife_Firebug', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_3P_Pickup_MIC"))
	Skins.Add((Id=3107, Weapondef=class'KFWeapDef_Knife_Firebug', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_3P_Pickup_MIC"))

//Dragonfire Flamethrower
	Skins.Add((Id=3103, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_3P_Pickup_MIC"))
	Skins.Add((Id=3102, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_3P_Pickup_MIC"))
	Skins.Add((Id=3101, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_3P_Pickup_MIC"))

//The Peacemaker M79
	Skins.Add((Id=3324, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3323, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3322, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_3P_Pickup_MIC"))

//Rusted Death MB500
	Skins.Add((Id=3067, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSetPSN01_MAT.rusteddeath_mb500.RustedDeath_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.rusteddeath_mb500.RustedDeath_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.rusteddeath_mb500.RustedDeath_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3066, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSetPSN01_MAT.rusteddeath_mb500.RustedDeath_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.rusteddeath_mb500.RustedDeath_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.rusteddeath_mb500.RustedDeath_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3065, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSetPSN01_MAT.rusteddeath_mb500.RustedDeath_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN01_MAT.rusteddeath_mb500.RustedDeath_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN01_MAT.rusteddeath_mb500.RustedDeath_MB500_3P_Pickup_MIC"))

//Stories of War AR15
	Skins.Add((Id=3347, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3346, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3345, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_3P_Pickup_MIC"))

//Conatainment AR15
	Skins.Add((Id=3269, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3268, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3267, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_3P_Pickup_MIC"))

//Putrid Bile M79
	Skins.Add((Id=3272, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3271, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3270, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_3P_Pickup_MIC"))

//Heat Dragons Breath
	Skins.Add((Id=3296, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=3295, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=3294, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_3P_Pickup_MIC"))

//Heat Double Barrel
	Skins.Add((Id=3299, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_3P_Pickup_MIC"))
	Skins.Add((Id=3298, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_3P_Pickup_MIC"))
	Skins.Add((Id=3297, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_3P_Pickup_MIC"))

//Precious AR15
	Skins.Add((Id=3289, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_ar15.Precious_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_ar15.Precious_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_ar15.Precious_AR15_3P_Pickup_MIC"))

//Precious Caulk N Burn
	Skins.Add((Id=3290, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_caulknburn.Precious_CaulkNBurn_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_caulknburn.Precious_CaulkNBurn_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_caulknburn.Precious_CaulkNBurn_3P_Pickup_MIC"))

//Precious Crovel
	Skins.Add((Id=3291, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_crovel.Precious_Crovel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_crovel.Precious_Crovel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_crovel.Precious_Crovel_3P_Pickup_MIC"))

//Precious HX25
	Skins.Add((Id=3292, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_hx25.Precious_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_hx25.Precious_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_hx25.Precious_HX25_3P_Pickup_MIC"))

//Precious MB500
	Skins.Add((Id=3293, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_mb500.Precious_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_mb500.Precious_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_mb500.Precious_MB500_3P_Pickup_MIC"))

//Precious Medic Pistol
	Skins.Add((Id=3335, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_medicpistol.Precious_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_medicpistol.Precious_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_medicpistol.Precious_MedicPistol_3P_Pickup_MIC"))

//Precious Remington 1858
	Skins.Add((Id=3303, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_remington1858.Precious_Remington_1858_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_remington1858.Precious_Remington_1858_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_remington1858.Precious_Remington_1858_3P_Pickup_MIC"))

//Precious 9mm
	Skins.Add((Id=3422, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_9mm.Precious_9MM_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_9mm.Precious_9MM_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_9mm.Precious_9MM_3P_Pickup_MIC"))

//Precious Double Barrel
	Skins.Add((Id=3423, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_doublebarrel.Precious_DoubleBarrel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_doublebarrel.Precious_DoubleBarrel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_doublebarrel.Precious_DoubleBarrel_3P_Pickup_MIC"))

//Precious M4
	Skins.Add((Id=3424, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_m4shotgun.Precious_M4Shotgun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_m4shotgun.Precious_M4Shotgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_m4shotgun.Precious_M4Shotgun_3P_Pickup_MIC"))

//Precious AA12
	Skins.Add((Id=3425, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_aa12.Precious_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_aa12.Precious_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_aa12.Precious_AA12_3P_Pickup_MIC"))

//Precious Support Knife
	Skins.Add((Id=3426, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_supportknife.Precious_SupportKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_supportknife.Precious_SupportKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_supportknife.Precious_SupportKnife_3P_Pickup_MIC"))

//Precious L85A2
	Skins.Add((Id=3427, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_l85a2.Precious_L85A2_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_l85a2.Precious_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_l85a2.Precious_L85A2_3P_Pickup_MIC"))

//Precious SCAR
	Skins.Add((Id=3428, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_scar.Precious_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_scar.Precious_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_scar.Precious_SCAR_3P_Pickup_MIC"))

//Precious Nail Gun
	Skins.Add((Id=3429, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_nailgun.Precious_NailGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_nailgun.Precious_NailGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_nailgun.Precious_NailGun_3P_Pickup_MIC"))

//Precious Pulverizer
	Skins.Add((Id=3430, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_pulverizer.Precious_Pulverizer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_pulverizer.Precious_Pulverizer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_pulverizer.Precious_Pulverizer_3P_Pickup_MIC"))

//Precious Sawblade
	Skins.Add((Id=3431, Weapondef=class'KFWeapDef_Eviscerator', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_sawblade.Precious_SawBlade_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_sawblade.Precious_SawBlade_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_sawblade.Precious_SawBlade_3P_Pickup_MIC"))

//Precious M79
	Skins.Add((Id=3432, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_m79.Precious_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_m79.Precious_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_m79.Precious_M79_3P_Pickup_MIC"))

//Precious RPG7
	Skins.Add((Id=3433, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_rpg7.Precious_RPG7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_rpg7.Precious_RPG7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_rpg7.Precious_RPG7_3P_Pickup_MIC"))

//Precious Flamethrower
	Skins.Add((Id=3434, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_flamethrower.Precious_Flamethrower_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_flamethrower.Precious_Flamethrower_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_flamethrower.Precious_Flamethrower_3P_Pickup_MIC"))

//Precious Microwave Gun
	Skins.Add((Id=3435, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_microwavegun.Precious_MicrowaveGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_microwavegun.Precious_MicrowaveGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_microwavegun.Precious_MicrowaveGun_3P_Pickup_MIC"))

//Precious Dragons Breath
	Skins.Add((Id=3436, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_dragonsbreath.Precious_DragonsBreath_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_dragonsbreath.Precious_DragonsBreath_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_dragonsbreath.Precious_DragonsBreath_3P_Pickup_MIC"))

//Precious Desert Eagle
	Skins.Add((Id=3437, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_deagle.Precious_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_deagle.Precious_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_deagle.Precious_Deagle_3P_Pickup_MIC"))

//Precious M1911
	Skins.Add((Id=3438, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_m1911.Precious_M1911_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_m1911.Precious_M1911_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_m1911.Precious_M1911_3P_Pickup_MIC"))

//Precious SW500
	Skins.Add((Id=3439, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_sw500.Precious_SW500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_sw500.Precious_SW500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_sw500.Precious_SW500_3P_Pickup_MIC"))

//Precious Demo Knife
	Skins.Add((Id=3440, Weapondef=class'KFWeapDef_Knife_Demo', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_demoknife.Precious_DemoKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_demoknife.Precious_DemoKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_demoknife.Precious_DemoKnife_3P_Pickup_MIC"))

//Precious Firebug Knife
	Skins.Add((Id=3441, Weapondef=class'KFWeapDef_Knife_Firebug', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_firebugknife.Precious_FirebugKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_firebugknife.Precious_FirebugKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_firebugknife.Precious_FirebugKnife_3P_Pickup_MIC"))

//Precious Medic SMG
	Skins.Add((Id=3448, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_medicpistol.Precious_MedicPistol_1P_Mint_MIC", "WEP_SkinSet01_P01_MAT.precious_medicsmg.Precious_MedicSMG_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_medicsmg.Precious_MedicSMG_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_medicsmg.Precious_MedicSMG_3P_Pickup_MIC"))

//Precious Medic Knife
	Skins.Add((Id=3449, Weapondef=class'KFWeapDef_Knife_Medic', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_medicknife.Precious_MedicKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_medicknife.Precious_MedicKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_medicknife.Precious_MedicKnife_3P_Pickup_MIC"))

//Precious Medic Shotgun
	Skins.Add((Id=3450, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_medicpistol.Precious_MedicPistol_1P_Mint_MIC", "WEP_SkinSet01_P01_MAT.precious_medicshotgun.Precious_MedicShotgun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_medicshotgun.Precious_MedicShotgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_medicshotgun.Precious_MedicShotgun_3P_Pickup_MIC"))

//Precious AK12
	Skins.Add((Id=3459, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_ak12.Precious_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_ak12.Precious_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_ak12.Precious_AK12_3P_Pickup_MIC"))

//Precious Commando Knife
	Skins.Add((Id=3460, Weapondef=class'KFWeapDef_Knife_Commando', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_commandoknife.Precious_CommandoKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_commandoknife.Precious_CommandoKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_commandoknife.Precious_CommandoKnife_3P_Pickup_MIC"))

//Precious Gunslinger Knife
	Skins.Add((Id=3461, Weapondef=class'KFWeapDef_Knife_Gunslinger', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_gunslingerknife.Precious_GunslingerKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_gunslingerknife.Precious_GunslingerKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_gunslingerknife.Precious_GunslingerKnife_3P_Pickup_MIC"))

//Precious Berserker Knife
	Skins.Add((Id=3462, Weapondef=class'KFWeapDef_Knife_Berserker', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_berserkerknife.Precious_BerserkerKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_berserkerknife.Precious_BerserkerKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_berserkerknife.Precious_BerserkerKnife_3P_Pickup_MIC"))

//Precious C4
	Skins.Add((Id=3463, Weapondef=class'KFWeapDef_C4', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_c4.Precious_C4_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_c4.Precious_C4_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_c4.Precious_C4_3P_Pickup_MIC"))

//Precious Medic Assault
	Skins.Add((Id=3467, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_medicassault.Precious_MedicAssault_1P_Mint_MIC", "WEP_SkinSet01_P01_MAT.precious_medicpistol.Precious_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_medicassault.Precious_MedicAssault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_medicassault.Precious_MedicAssault_3P_Pickup_MIC"))

//Precious Healer
	Skins.Add((Id=3451, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_healer.Precious_Healer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_healer.Precious_Healer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_healer.Precious_Healer_3P_Pickup_MIC"))

//Precious Welder
	Skins.Add((Id=3452, Weapondef=class'KFWeapDef_Welder', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_welder.Precious_Welder_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_welder.Precious_Welder_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_welder.Precious_Welder_3P_Pickup_MIC"))

//Precious Mace and Shield
	Skins.Add((Id=4560, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.precious_maceshield.Precious_Mace_1P_Mint_MIC", "WEP_SkinSet08_MAT.precious_maceshield.Precious_Shield_1P_Mint_MIC"), MIC_3P="WEP_SkinSet08_MAT.precious_maceshield.Precious_MaceShield_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet08_MAT.precious_maceshield.Precious_MaceShield_3P_Pickup_MIC"))

//Precious Kriss
	Skins.Add((Id=4595, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.precious_kriss.Precious_Kriss_1P_Mint_MIC", "WEP_SkinSet09_MAT.precious_kriss.Precious_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.precious_kriss.Precious_Kriss_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.precious_kriss.Precious_Kriss_3P_Pickup_MIC"))

//Precious Crossbow
	Skins.Add((Id=4596, Weapondef=class'KFWeapDef_Crossbow', MIC_1P=("WEP_SkinSet09_MAT.precious_crossbow.Precious_Crossbow_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.precious_crossbow.Precious_Crossbow_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.precious_crossbow.Precious_Crossbow_3P_Pickup_MIC"))

//Precious Winchester 1894
	Skins.Add((Id=4597, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet09_MAT.precious_lar.Precious_LAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.precious_lar.Precious_LAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.precious_lar.Precious_LAR_3P_Pickup_MIC"))

//Precious MP5RAS
	Skins.Add((Id=4787, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet10_MAT.precious_mp5ras.Precious_MP5RAS_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.precious_mp5ras.Precious_MP5RAS_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.precious_mp5ras.Precious_MP5RAS_3P_Pickup_MIC"))

//Precious MP7
	Skins.Add((Id=4788, Weapondef=class'KFWeapDef_MP7', MIC_1P=("WEP_SkinSet10_MAT.precious_mp7.Precious_MP7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.precious_mp7.Precious_MP7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.precious_mp7.Precious_MP7_3P_Pickup_MIC"))

//Precious P90
	Skins.Add((Id=4789, Weapondef=class'KFWeapDef_P90', MIC_1P=("WEP_SkinSet10_MAT.precious_p90.Precious_P90_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.precious_p90.Precious_P90_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.precious_p90.Precious_P90_3P_Pickup_MIC"))

//Precious M14EBR
	Skins.Add((Id=4793, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet10_MAT.precious_m14ebr.Precious_M14EBR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.precious_m14ebr.Precious_M14EBR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.precious_m14ebr.Precious_M14EBR_3P_Pickup_MIC"))

//Precious Railgun
	Skins.Add((Id=4794, Weapondef=class'KFWeapDef_RailGun', MIC_1P=("WEP_SkinSet10_MAT.precious_railgun.Precious_RailGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.precious_railgun.Precious_RailGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.precious_railgun.Precious_RailGun_3P_Pickup_MIC"))

//Precious FlareGun
	Skins.Add((Id=4803, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.precious_flaregun.Precious_FlareGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet11_MAT.precious_flaregun.Precious_FlareGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet11_MAT.precious_flaregun.Precious_FlareGun_3P_Pickup_MIC"))

//Precious M16 M203
	Skins.Add((Id=4984, Weapondef=class'KFWeapDef_M16M203', MIC_1P=("WEP_SkinSet12_MAT.precious_m16m203.Precious_M16_1P_Mint_MIC", "WEP_SkinSet12_MAT.precious_m16m203.Precious_M203_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.precious_m16m203.Precious_M16M203_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.precious_m16m203.Precious_M16M203_3P_Pickup_MIC"))

//Precious Katana
	Skins.Add((Id=5054, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet15_MAT.precious_katana.Precious_Katana_1P_Mint_MIC"), MIC_3P="WEP_SkinSet15_MAT.precious_katana.Precious_Katana_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet15_MAT.precious_katana.Precious_Katana_3P_Pickup_MIC"))

//Precious HZ12
	Skins.Add((Id=5140, Weapondef=class'KFWeapDef_HZ12', MIC_1P=("WEP_SkinSet14_MAT.precious_hz12.Precious_HZ12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet14_MAT.precious_hz12.Precious_HZ12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet14_MAT.precious_hz12.Precious_HZ12_3P_Pickup_MIC"))

//Precious Stoner 63A
	Skins.Add((Id=5141, Weapondef=class'KFWeapDef_Stoner63A', MIC_1P=("WEP_SkinSet14_MAT.precious_stoner63a.Precious_Stoner63A_1P_Mint_MIC", "WEP_SkinSet14_MAT.precious_stoner63a.Precious_Stoner63A_Receiver_1P_Mint_MIC"), MIC_3P="WEP_SkinSet14_MAT.precious_stoner63a.Precious_Stoner63a_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet14_MAT.precious_stoner63a.Precious_Stoner63a_3P_Pickup_MIC"))

//Precious Freeze Thrower
	Skins.Add((Id=5377, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.Precious_CryoGun_1P_ID1_Mint_MIC", "WEP_SkinSet_CryoGun_MAT.Precious_CryoGun_1P_ID2_Mint_MIC"), MIC_3P="WEP_SkinSet_CryoGun_MAT.Precious_CryoGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.Precious_CryoGun_3P_Pickup_MIC"))

//Blood Camo Remington 1858
	Skins.Add((Id=3306, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_3P_Pickup_MIC"))
	Skins.Add((Id=3305, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_3P_Pickup_MIC"))
	Skins.Add((Id=3304, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_3P_Pickup_MIC"))

//Constitution Remington 1858
	Skins.Add((Id=3309, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_3P_Pickup_MIC"))
	Skins.Add((Id=3308, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_3P_Pickup_MIC"))
	Skins.Add((Id=3307, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_3P_Pickup_MIC"))

//Dosh MB500
	Skins.Add((Id=3312, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3311, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3310, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_3P_Pickup_MIC"))

//Dosh L85A2
	Skins.Add((Id=3315, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3314, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3313, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_3P_Pickup_MIC"))

//Snakeskin SW500
	Skins.Add((Id=3318, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_3P_Pickup_MIC"))
	Skins.Add((Id=3317, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_3P_Pickup_MIC"))
	Skins.Add((Id=3316, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_3P_Pickup_MIC"))

//Snakeskin AA12
	Skins.Add((Id=3321, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3320, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3319, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_3P_Pickup_MIC"))

//Circuit HX25
	Skins.Add((Id=3327, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3326, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3325, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_3P_Pickup_MIC"))

//Circuit Glow HX25
	Skins.Add((Id=3330, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3329, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3328, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_3P_Pickup_MIC"))

//Glow Text Katana
	Skins.Add((Id=3333, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_3P_Pickup_MIC"))
	Skins.Add((Id=3332, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_3P_Pickup_MIC"))
	Skins.Add((Id=3331, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_3P_Pickup_MIC"))

//Carbon Fiber Medic Pistol
	Skins.Add((Id=3338, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=3337, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=3336, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_3P_Pickup_MIC"))

//Carbon Fiber Medic SMG
	Skins.Add((Id=3341, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_1P_Mint_MIC", "WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_3P_Pickup_MIC"))
	Skins.Add((Id=3340, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_1P_FieldTested_MIC", "WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_3P_Pickup_MIC"))
	Skins.Add((Id=3339, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_1P_BattleScarred_MIC", "WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_3P_Pickup_MIC"))

//Tactical Desert Eagle
	Skins.Add((Id=3361, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=3360, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=3359, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_3P_Pickup_MIC"))

//Tactical 9mm
	Skins.Add((Id=3364, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3363, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3362, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_3P_Pickup_MIC"))

//Tactical M1911
	Skins.Add((Id=3367, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_3P_Pickup_MIC"))
	Skins.Add((Id=3366, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_3P_Pickup_MIC"))
	Skins.Add((Id=3365, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_3P_Pickup_MIC"))

//Tactical AR15
	Skins.Add((Id=3370, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3369, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3368, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_3P_Pickup_MIC"))

//Tactical SW500
	Skins.Add((Id=3444, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_3P_Pickup_MIC"))
	Skins.Add((Id=3443, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_3P_Pickup_MIC"))
	Skins.Add((Id=3442, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_3P_Pickup_MIC"))

//Street Punks Caulk N Burn
	Skins.Add((Id=3373, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=3372, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=3371, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_3P_Pickup_MIC"))

//Street Punks Commando Knife
	Skins.Add((Id=3376, Weapondef=class'KFWeapDef_Knife_Commando', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_3P_Pickup_MIC"))
	Skins.Add((Id=3375, Weapondef=class'KFWeapDef_Knife_Commando', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_3P_Pickup_MIC"))
	Skins.Add((Id=3374, Weapondef=class'KFWeapDef_Knife_Commando', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_3P_Pickup_MIC"))

//Street Punks AR15
	Skins.Add((Id=3379, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3378, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3377, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_3P_Pickup_MIC"))

//Street Punks 9mm
	Skins.Add((Id=3382, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3381, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3380, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_3P_Pickup_MIC"))

//Street Punks MB500
	Skins.Add((Id=3385, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3384, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3383, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_3P_Pickup_MIC"))

//Street Punks AK12
	Skins.Add((Id=3455, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3454, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3453, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_3P_Pickup_MIC"))

//Street Punks Desert Eagle
	Skins.Add((Id=3458, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=3457, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=3456, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_3P_Pickup_MIC"))

//Emergency Issue Caulk N Burn
	Skins.Add((Id=3388, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=3387, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=3386, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_3P_Pickup_MIC"))

//Emergency Issue 9mm
	Skins.Add((Id=3391, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3390, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3389, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_3P_Pickup_MIC"))

//Emergency Issue Desert Eagle
	Skins.Add((Id=3394, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=3393, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=3392, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_3P_Pickup_MIC"))

//Emergency Issue Nailgun
	Skins.Add((Id=3412, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_3P_Pickup_MIC"))
	Skins.Add((Id=3411, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_3P_Pickup_MIC"))
	Skins.Add((Id=3410, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_3P_Pickup_MIC"))

//Emergency Issue MB500
	Skins.Add((Id=3415, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3414, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3413, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_Pickup_MIC"))

//Emergency Issue Flamethrower
	Skins.Add((Id=3418, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_3P_Pickup_MIC"))
	Skins.Add((Id=3417, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_3P_Pickup_MIC"))
	Skins.Add((Id=3416, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_3P_Pickup_MIC"))

//Emergency Issue Microwave Gun
	Skins.Add((Id=3421, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_3P_Pickup_MIC"))
	Skins.Add((Id=3420, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_3P_Pickup_MIC"))
	Skins.Add((Id=3419, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_3P_Pickup_MIC"))

//Emergency Issue Sawblade
	Skins.Add((Id=3466, Weapondef=class'KFWeapDef_Eviscerator', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_3P_Pickup_MIC"))
	Skins.Add((Id=3465, Weapondef=class'KFWeapDef_Eviscerator', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_3P_Pickup_MIC"))
	Skins.Add((Id=3464, Weapondef=class'KFWeapDef_Eviscerator', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_3P_Pickup_MIC"))

//Emergency Issue Pulverizer
	Skins.Add((Id=3589, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=3588, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=3587, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_3P_Pickup_MIC"))

//Predator MB500
	Skins.Add((Id=3397, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3396, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3395, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_3P_Pickup_MIC"))

//Predator HX25
	Skins.Add((Id=3400, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3399, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3398, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_3P_Pickup_MIC"))

//Predator AK12
	Skins.Add((Id=3403, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3402, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3401, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_3P_Pickup_MIC"))

//Predator L85A2
	Skins.Add((Id=3406, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3405, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3404, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_3P_Pickup_MIC"))

//Carcass AA12
	Skins.Add((Id=3409, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3408, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3407, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_3P_Pickup_MIC"))

//Horzine First Encounter MB500
	Skins.Add((Id=3447, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3446, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3445, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_3P_Pickup_MIC"))

//Flesh Pulverizer
	Skins.Add((Id=3645, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=3644, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=3643, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_3P_Pickup_MIC"))

//Vertebrae HX25
	Skins.Add((Id=3682, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3681, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3680, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_3P_Pickup_MIC"))

//Spray Can SCAR
	Skins.Add((Id=3729, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3728, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3727, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_3P_Pickup_MIC"))

//Leviathan AK12
	Skins.Add((Id=3732, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3731, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3730, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_3P_Pickup_MIC"))

//Horzine Elite Blue AK12
	Skins.Add((Id=3781, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_1P_Mint_MIC", "WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3780, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_1P_FieldTested_MIC", "WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3779, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_1P_BattleScarred_MIC", "WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_3P_Pickup_MIC"))

//Horzine Elite Red AK12
	Skins.Add((Id=3784, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_1P_Mint_MIC", "WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3783, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_1P_FieldTested_MIC", "WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3782, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_1P_BattleScarred_MIC", "WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_3P_Pickup_MIC"))

//Horzine Elite White AK12
	Skins.Add((Id=3787, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_1P_Mint_MIC", "WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3786, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_1P_FieldTested_MIC", "WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3785, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_1P_BattleScarred_MIC", "WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_3P_Pickup_MIC"))

//Horzine Elite Green AK12
	Skins.Add((Id=3790, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_1P_Mint_MIC", "WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3789, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_1P_FieldTested_MIC", "WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3788, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_1P_BattleScarred_MIC", "WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_3P_Pickup_MIC"))

//Horzine First Encounter Healer
	Skins.Add((Id=3793, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_3P_Pickup_MIC"))
	Skins.Add((Id=3792, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_3P_Pickup_MIC"))
	Skins.Add((Id=3791, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_3P_Pickup_MIC"))

//Horzine First Encounter Welder
	Skins.Add((Id=3796, Weapondef=class'KFWeapDef_Welder', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_3P_Pickup_MIC"))
	Skins.Add((Id=3795, Weapondef=class'KFWeapDef_Welder', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_3P_Pickup_MIC"))
	Skins.Add((Id=3794, Weapondef=class'KFWeapDef_Welder', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_3P_Pickup_MIC"))

//Horzine First Encounter AA12
	Skins.Add((Id=3799, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3798, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3797, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_3P_Pickup_MIC"))

//Elite Unit Medic Pistol
	Skins.Add((Id=3670, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=3669, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=3668, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_3P_Pickup_MIC"))

//Elite Unit Medic SMG
	Skins.Add((Id=3673, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_1P_Mint_MIC", "WEP_SkinSet05_MAT.eliteunit_medicsmg.EliteUnit_MedicSMG_1P_Mint_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_medicsmg.EliteUnit_MedicSMG_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_medicsmg.EliteUnit_MedicSMG_3P_Pickup_MIC"))
	Skins.Add((Id=3672, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_1P_FieldTested_MIC", "WEP_SkinSet05_MAT.eliteunit_medicsmg.EliteUnit_MedicSMG_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_medicsmg.EliteUnit_MedicSMG_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_medicsmg.EliteUnit_MedicSMG_3P_Pickup_MIC"))
	Skins.Add((Id=3671, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_1P_BattleScarred_MIC", "WEP_SkinSet05_MAT.eliteunit_medicsmg.EliteUnit_MedicSMG_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_medicsmg.EliteUnit_MedicSMG_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_medicsmg.EliteUnit_MedicSMG_3P_Pickup_MIC"))

//Elite Unit Medic Shotgun
	Skins.Add((Id=3676, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_1P_Mint_MIC", "WEP_SkinSet05_MAT.eliteunit_medicshotgun.EliteUnit_MedicShotgun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_medicshotgun.EliteUnit_MedicShotgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_medicshotgun.EliteUnit_MedicShotgun_3P_Pickup_MIC"))
	Skins.Add((Id=3675, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_1P_FieldTested_MIC", "WEP_SkinSet05_MAT.eliteunit_medicshotgun.EliteUnit_MedicShotgun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_medicshotgun.EliteUnit_MedicShotgun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_medicshotgun.EliteUnit_MedicShotgun_3P_Pickup_MIC"))
	Skins.Add((Id=3674, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_1P_BattleScarred_MIC", "WEP_SkinSet05_MAT.eliteunit_medicshotgun.EliteUnit_MedicShotgun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_medicshotgun.EliteUnit_MedicShotgun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_medicshotgun.EliteUnit_MedicShotgun_3P_Pickup_MIC"))

//Elite Unit Medic Assault
	Skins.Add((Id=3679, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_medicassault.EliteUnit_MedicAssault_1P_Mint_MIC", "WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_medicassault.EliteUnit_MedicAssault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_medicassault.EliteUnit_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=3678, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_medicassault.EliteUnit_MedicAssault_1P_FieldTested_MIC", "WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_medicassault.EliteUnit_MedicAssault_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_medicassault.EliteUnit_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=3677, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_medicassault.EliteUnit_MedicAssault_1P_BattleScarred_MIC", "WEP_SkinSet05_MAT.eliteunit_medicpistol.EliteUnit_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_medicassault.EliteUnit_MedicAssault_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_medicassault.EliteUnit_MedicAssault_3P_Pickup_MIC"))

//Elite Unit Medic Knife
	Skins.Add((Id=4138, Weapondef=class'KFWeapDef_Knife_Medic', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_scalpel.EliteUnit_Scalpel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_scalpel.EliteUnit_Scalpel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_scalpel.EliteUnit_Scalpel_3P_Pickup_MIC"))
	Skins.Add((Id=4137, Weapondef=class'KFWeapDef_Knife_Medic', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_scalpel.EliteUnit_Scalpel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_scalpel.EliteUnit_Scalpel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_scalpel.EliteUnit_Scalpel_3P_Pickup_MIC"))
	Skins.Add((Id=4136, Weapondef=class'KFWeapDef_Knife_Medic', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_scalpel.EliteUnit_Scalpel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_scalpel.EliteUnit_Scalpel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_scalpel.EliteUnit_Scalpel_3P_Pickup_MIC"))

//Elite Unit Healer
	Skins.Add((Id=4187, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_healer.EliteUnit_Healer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_healer.EliteUnit_Healer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_healer.EliteUnit_Healer_3P_Pickup_MIC"))
	Skins.Add((Id=4186, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_healer.EliteUnit_Healer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_healer.EliteUnit_Healer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_healer.EliteUnit_Healer_3P_Pickup_MIC"))
	Skins.Add((Id=4185, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet05_MAT.eliteunit_healer.EliteUnit_Healer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet05_MAT.eliteunit_healer.EliteUnit_Healer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet05_MAT.eliteunit_healer.EliteUnit_Healer_3P_Pickup_MIC"))

//Elite Unit Green Medic Pistol
	Skins.Add((Id=4190, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet06_MAT.eliteunitgreen_medicpistol.EliteUnitGreen_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet06_MAT.eliteunitgreen_medicpistol.EliteUnitGreen_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet06_MAT.eliteunitgreen_medicpistol.EliteUnitGreen_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=4189, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet06_MAT.eliteunitgreen_medicpistol.EliteUnitGreen_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet06_MAT.eliteunitgreen_medicpistol.EliteUnitGreen_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet06_MAT.eliteunitgreen_medicpistol.EliteUnitGreen_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=4188, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet06_MAT.eliteunitgreen_medicpistol.EliteUnitGreen_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet06_MAT.eliteunitgreen_medicpistol.EliteUnitGreen_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet06_MAT.eliteunitgreen_medicpistol.EliteUnitGreen_MedicPistol_3P_Pickup_MIC"))

//Elite Unit Green Medic SMG
	Skins.Add((Id=4193, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet06_MAT.eliteunitgreen_medicpistol.EliteUnitGreen_MedicPistol_1P_Mint_MIC", "WEP_SkinSet06_MAT.eliteunitgreen_medicsmg.EliteUnitGreen_MedicSMG_1P_Mint_MIC"), MIC_3P="WEP_SkinSet06_MAT.eliteunitgreen_medicsmg.EliteUnitGreen_MedicSMG_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet06_MAT.eliteunitgreen_medicsmg.EliteUnitGreen_MedicSMG_3P_Pickup_MIC"))
	Skins.Add((Id=4192, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet06_MAT.eliteunitgreen_medicpistol.EliteUnitGreen_MedicPistol_1P_FieldTested_MIC", "WEP_SkinSet06_MAT.eliteunitgreen_medicsmg.EliteUnitGreen_MedicSMG_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet06_MAT.eliteunitgreen_medicsmg.EliteUnitGreen_MedicSMG_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet06_MAT.eliteunitgreen_medicsmg.EliteUnitGreen_MedicSMG_3P_Pickup_MIC"))
	Skins.Add((Id=4191, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet06_MAT.eliteunitgreen_medicpistol.EliteUnitGreen_MedicPistol_1P_BattleScarred_MIC", "WEP_SkinSet06_MAT.eliteunitgreen_medicsmg.EliteUnitGreen_MedicSMG_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet06_MAT.eliteunitgreen_medicsmg.EliteUnitGreen_MedicSMG_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet06_MAT.eliteunitgreen_medicsmg.EliteUnitGreen_MedicSMG_3P_Pickup_MIC"))

//Elite Unit Red Medic Shotgun
	Skins.Add((Id=4196, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet06_MAT.eliteunitred_medicpistol.EliteUnitRed_MedicPistol_1P_Mint_MIC", "WEP_SkinSet06_MAT.eliteunitred_medicshotgun.EliteUnitRed_MedicShotgun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet06_MAT.eliteunitred_medicshotgun.EliteUnitRed_MedicShotgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet06_MAT.eliteunitred_medicshotgun.EliteUnitRed_MedicShotgun_3P_Pickup_MIC"))
	Skins.Add((Id=4195, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet06_MAT.eliteunitred_medicpistol.EliteUnitRed_MedicPistol_1P_FieldTested_MIC", "WEP_SkinSet06_MAT.eliteunitred_medicshotgun.EliteUnitRed_MedicShotgun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet06_MAT.eliteunitred_medicshotgun.EliteUnitRed_MedicShotgun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet06_MAT.eliteunitred_medicshotgun.EliteUnitRed_MedicShotgun_3P_Pickup_MIC"))
	Skins.Add((Id=4194, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet06_MAT.eliteunitred_medicpistol.EliteUnitRed_MedicPistol_1P_BattleScarred_MIC", "WEP_SkinSet06_MAT.eliteunitred_medicshotgun.EliteUnitRed_MedicShotgun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet06_MAT.eliteunitred_medicshotgun.EliteUnitRed_MedicShotgun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet06_MAT.eliteunitred_medicshotgun.EliteUnitRed_MedicShotgun_3P_Pickup_MIC"))

//Elite Unit Red Medic Assault
	Skins.Add((Id=4199, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet06_MAT.eliteunitred_medicassault.EliteUnitRed_MedicAssault_1P_Mint_MIC", "WEP_SkinSet06_MAT.eliteunitred_medicpistol.EliteUnitRed_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet06_MAT.eliteunitred_medicassault.EliteUnitRed_MedicAssault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet06_MAT.eliteunitred_medicassault.EliteUnitRed_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=4198, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet06_MAT.eliteunitred_medicassault.EliteUnitRed_MedicAssault_1P_FieldTested_MIC", "WEP_SkinSet06_MAT.eliteunitred_medicpistol.EliteUnitRed_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet06_MAT.eliteunitred_medicassault.EliteUnitRed_MedicAssault_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet06_MAT.eliteunitred_medicassault.EliteUnitRed_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=4197, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet06_MAT.eliteunitred_medicassault.EliteUnitRed_MedicAssault_1P_BattleScarred_MIC", "WEP_SkinSet06_MAT.eliteunitred_medicpistol.EliteUnitRed_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet06_MAT.eliteunitred_medicassault.EliteUnitRed_MedicAssault_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet06_MAT.eliteunitred_medicassault.EliteUnitRed_MedicAssault_3P_Pickup_MIC"))

//SWAT AA12
	Skins.Add((Id=3975, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet05_MAT.swat_aa12.SWAT_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_aa12.SWAT_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_aa12.SWAT_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3974, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet05_MAT.swat_aa12.SWAT_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_aa12.SWAT_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_aa12.SWAT_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3973, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet05_MAT.swat_aa12.SWAT_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_aa12.SWAT_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_aa12.SWAT_AA12_3P_Pickup_MIC"))

//SWAT AK12
	Skins.Add((Id=3978, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet05_MAT.swat_ak12.SWAT_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_ak12.SWAT_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_ak12.SWAT_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3977, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet05_MAT.swat_ak12.SWAT_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_ak12.SWAT_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_ak12.SWAT_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3976, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet05_MAT.swat_ak12.SWAT_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_ak12.SWAT_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_ak12.SWAT_AK12_3P_Pickup_MIC"))

//SWAT MB500
	Skins.Add((Id=3981, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet05_MAT.swat_mb500.SWAT_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_mb500.SWAT_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_mb500.SWAT_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3980, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet05_MAT.swat_mb500.SWAT_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_mb500.SWAT_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_mb500.SWAT_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3979, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet05_MAT.swat_mb500.SWAT_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_mb500.SWAT_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_mb500.SWAT_MB500_3P_Pickup_MIC"))

//SWAT 9mm
	Skins.Add((Id=3984, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet05_MAT.swat_9mm.SWAT_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_9mm.SWAT_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_9mm.SWAT_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3983, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet05_MAT.swat_9mm.SWAT_9mm_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_9mm.SWAT_9mm_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_9mm.SWAT_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3982, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet05_MAT.swat_9mm.SWAT_9mm_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_9mm.SWAT_9mm_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_9mm.SWAT_9mm_3P_Pickup_MIC"))

//SWAT SCAR
	Skins.Add((Id=3987, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet05_MAT.swat_scar.SWAT_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_scar.SWAT_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_scar.SWAT_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3986, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet05_MAT.swat_scar.SWAT_SCAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_scar.SWAT_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_scar.SWAT_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3985, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet05_MAT.swat_scar.SWAT_SCAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_scar.SWAT_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_scar.SWAT_SCAR_3P_Pickup_MIC"))

//SWAT Pulverizer
	Skins.Add((Id=4128, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet05_MAT.swat_pulverizer.SWAT_Pulverizer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_pulverizer.SWAT_Pulverizer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_pulverizer.SWAT_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=4127, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet05_MAT.swat_pulverizer.SWAT_Pulverizer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_pulverizer.SWAT_Pulverizer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_pulverizer.SWAT_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=4126, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet05_MAT.swat_pulverizer.SWAT_Pulverizer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet05_MAT.swat_pulverizer.SWAT_Pulverizer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet05_MAT.swat_pulverizer.SWAT_Pulverizer_3P_Pickup_MIC"))

//Human Popcorn Microwave Gun
	Skins.Add((Id=3990, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSetPSN02_MAT.humanpopcorn_microwavegun.HumanPopcorn_MicrowaveGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.humanpopcorn_microwavegun.HumanPopcorn_MicrowaveGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.humanpopcorn_microwavegun.HumanPopcorn_MicrowaveGun_3P_Pickup_MIC"))
	Skins.Add((Id=3989, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSetPSN02_MAT.humanpopcorn_microwavegun.HumanPopcorn_MicrowaveGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.humanpopcorn_microwavegun.HumanPopcorn_MicrowaveGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.humanpopcorn_microwavegun.HumanPopcorn_MicrowaveGun_3P_Pickup_MIC"))
	Skins.Add((Id=3988, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSetPSN02_MAT.humanpopcorn_microwavegun.HumanPopcorn_MicrowaveGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.humanpopcorn_microwavegun.HumanPopcorn_MicrowaveGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.humanpopcorn_microwavegun.HumanPopcorn_MicrowaveGun_3P_Pickup_MIC"))

//Clot Cola AA12
	Skins.Add((Id=3993, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSetPSN02_MAT.clotcola_aa12.ClotCola_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.clotcola_aa12.ClotCola_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.clotcola_aa12.ClotCola_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3992, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSetPSN02_MAT.clotcola_aa12.ClotCola_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.clotcola_aa12.ClotCola_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.clotcola_aa12.ClotCola_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3991, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSetPSN02_MAT.clotcola_aa12.ClotCola_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.clotcola_aa12.ClotCola_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.clotcola_aa12.ClotCola_AA12_3P_Pickup_MIC"))

//Junkyard Racer L85A2
	Skins.Add((Id=3996, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSetPSN02_MAT.junkyardracer_l85a2.JunkyardRacer_L85A2_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.junkyardracer_l85a2.JunkyardRacer_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.junkyardracer_l85a2.JunkyardRacer_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3995, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSetPSN02_MAT.junkyardracer_l85a2.JunkyardRacer_L85A2_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.junkyardracer_l85a2.JunkyardRacer_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.junkyardracer_l85a2.JunkyardRacer_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3994, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSetPSN02_MAT.junkyardracer_l85a2.JunkyardRacer_L85A2_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.junkyardracer_l85a2.JunkyardRacer_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.junkyardracer_l85a2.JunkyardRacer_L85A2_3P_Pickup_MIC"))

//Junkyard Racer Remington 1858
	Skins.Add((Id=3999, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSetPSN02_MAT.junkyardracer_remington1858.JunkyardRacer_Remington1858_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.junkyardracer_remington1858.JunkyardRacer_Remington1858_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.junkyardracer_remington1858.JunkyardRacer_Remington1858_3P_Pickup_MIC"))
	Skins.Add((Id=3998, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSetPSN02_MAT.junkyardracer_remington1858.JunkyardRacer_Remington1858_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.junkyardracer_remington1858.JunkyardRacer_Remington1858_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.junkyardracer_remington1858.JunkyardRacer_Remington1858_3P_Pickup_MIC"))
	Skins.Add((Id=3997, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSetPSN02_MAT.junkyardracer_remington1858.JunkyardRacer_Remington1858_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.junkyardracer_remington1858.JunkyardRacer_Remington1858_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.junkyardracer_remington1858.JunkyardRacer_Remington1858_3P_Pickup_MIC"))

//Junkyard Racer Winchester 1894
	Skins.Add((Id=4002, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSetPSN02_MAT.junkyardracer_winchester1894.JunkyardRacer_Winchester1894_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.junkyardracer_winchester1894.JunkyardRacer_Winchester1894_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.junkyardracer_winchester1894.JunkyardRacer_Winchester1894_3P_Pickup_MIC"))
	Skins.Add((Id=4001, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSetPSN02_MAT.junkyardracer_winchester1894.JunkyardRacer_Winchester1894_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.junkyardracer_winchester1894.JunkyardRacer_Winchester1894_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.junkyardracer_winchester1894.JunkyardRacer_Winchester1894_3P_Pickup_MIC"))
	Skins.Add((Id=4000, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSetPSN02_MAT.junkyardracer_winchester1894.JunkyardRacer_Winchester1894_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.junkyardracer_winchester1894.JunkyardRacer_Winchester1894_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.junkyardracer_winchester1894.JunkyardRacer_Winchester1894_3P_Pickup_MIC"))

//Tripwire Gunner 9mm
	Skins.Add((Id=4005, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetPSN02_MAT.tripwiregunner_9mm.TripwireGunner_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.tripwiregunner_9mm.TripwireGunner_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.tripwiregunner_9mm.TripwireGunner_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=4004, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetPSN02_MAT.tripwiregunner_9mm.TripwireGunner_9mm_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.tripwiregunner_9mm.TripwireGunner_9mm_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.tripwiregunner_9mm.TripwireGunner_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=4003, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetPSN02_MAT.tripwiregunner_9mm.TripwireGunner_9mm_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.tripwiregunner_9mm.TripwireGunner_9mm_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.tripwiregunner_9mm.TripwireGunner_9mm_3P_Pickup_MIC"))

//Gunner Classic 9mm
	Skins.Add((Id=4008, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetPSN02_MAT.gunnerclassic_9mm.GunnerClassic_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.gunnerclassic_9mm.GunnerClassic_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.gunnerclassic_9mm.GunnerClassic_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=4007, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetPSN02_MAT.gunnerclassic_9mm.GunnerClassic_9mm_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.gunnerclassic_9mm.GunnerClassic_9mm_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.gunnerclassic_9mm.GunnerClassic_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=4006, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetPSN02_MAT.gunnerclassic_9mm.GunnerClassic_9mm_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.gunnerclassic_9mm.GunnerClassic_9mm_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.gunnerclassic_9mm.GunnerClassic_9mm_3P_Pickup_MIC"))

//Outmoded Healer
	Skins.Add((Id=4125, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSetPSN02_MAT.outmoded_healer.Outmoded_Healer_1P_Mint_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.outmoded_healer.Outmoded_Healer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.outmoded_healer.Outmoded_Healer_3P_Pickup_MIC"))
	Skins.Add((Id=4124, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSetPSN02_MAT.outmoded_healer.Outmoded_Healer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.outmoded_healer.Outmoded_Healer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.outmoded_healer.Outmoded_Healer_3P_Pickup_MIC"))
	Skins.Add((Id=4123, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSetPSN02_MAT.outmoded_healer.Outmoded_Healer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSetPSN02_MAT.outmoded_healer.Outmoded_Healer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSetPSN02_MAT.outmoded_healer.Outmoded_Healer_3P_Pickup_MIC"))

//Victorian AA12
	Skins.Add((Id=4038, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet06_MAT.victorian_aa12.Victorian_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_aa12.Victorian_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_aa12.Victorian_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=4037, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet06_MAT.victorian_aa12.Victorian_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_aa12.Victorian_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_aa12.Victorian_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=4036, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet06_MAT.victorian_aa12.Victorian_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_aa12.Victorian_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_aa12.Victorian_AA12_3P_Pickup_MIC"))

//Victorian Double Barrel
	Skins.Add((Id=4047, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet06_MAT.victorian_doublebarrel.Victorian_DoubleBarrel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_doublebarrel.Victorian_DoubleBarrel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_doublebarrel.Victorian_DoubleBarrel_3P_Pickup_MIC"))
 	Skins.Add((Id=4046, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet06_MAT.victorian_doublebarrel.Victorian_DoubleBarrel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_doublebarrel.Victorian_DoubleBarrel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_doublebarrel.Victorian_DoubleBarrel_3P_Pickup_MIC"))
	Skins.Add((Id=4045, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet06_MAT.victorian_doublebarrel.Victorian_DoubleBarrel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_doublebarrel.Victorian_DoubleBarrel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_doublebarrel.Victorian_DoubleBarrel_3P_Pickup_MIC"))

//Victorian M4
	Skins.Add((Id=4050, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet06_MAT.victorian_m4.Victorian_M4_1P_Mint_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_m4.Victorian_M4_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_m4.Victorian_M4_3P_Pickup_MIC"))
	Skins.Add((Id=4049, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet06_MAT.victorian_m4.Victorian_M4_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_m4.Victorian_M4_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_m4.Victorian_M4_3P_Pickup_MIC"))
	Skins.Add((Id=4048, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet06_MAT.victorian_m4.Victorian_M4_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_m4.Victorian_M4_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_m4.Victorian_M4_3P_Pickup_MIC"))

//Victorian MB500
	Skins.Add((Id=4044, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet06_MAT.victorian_mb500.Victorian_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_mb500.Victorian_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_mb500.Victorian_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=4043, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet06_MAT.victorian_mb500.Victorian_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_mb500.Victorian_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_mb500.Victorian_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=4042, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet06_MAT.victorian_mb500.Victorian_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_mb500.Victorian_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_mb500.Victorian_MB500_3P_Pickup_MIC"))

//Victorian Support Knife
	Skins.Add((Id=4041, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet06_MAT.victorian_supportknife.Victorian_SupportKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_supportknife.Victorian_SupportKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_supportknife.Victorian_SupportKnife_3P_Pickup_MIC"))
	Skins.Add((Id=4040, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet06_MAT.victorian_supportknife.Victorian_SupportKnife_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_supportknife.Victorian_SupportKnife_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_supportknife.Victorian_SupportKnife_3P_Pickup_MIC"))
	Skins.Add((Id=4039, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet06_MAT.victorian_supportknife.Victorian_SupportKnife_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet06_MAT.victorian_supportknife.Victorian_SupportKnife_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet06_MAT.victorian_supportknife.Victorian_SupportKnife_3P_Pickup_MIC"))

//Opulence SCAR
	Skins.Add((Id=4220, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet06_MAT.opulence_scar.Opulence_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet06_MAT.opulence_scar.Opulence_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet06_MAT.opulence_scar.Opulence_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=4219, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet06_MAT.opulence_scar.Opulence_SCAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet06_MAT.opulence_scar.Opulence_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet06_MAT.opulence_scar.Opulence_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=4218, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet06_MAT.opulence_scar.Opulence_SCAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet06_MAT.opulence_scar.Opulence_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet06_MAT.opulence_scar.Opulence_SCAR_3P_Pickup_MIC"))

//Horzine Elite Blue 9mm
	Skins.Add((Id=4331, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetEA01_MAT.horzineeliteblue_9mm.HorzineEliteBlue_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSetEA01_MAT.horzineeliteblue_9mm.HorzineEliteBlue_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetEA01_MAT.horzineeliteblue_9mm.HorzineEliteBlue_9mm_3P_Pickup_MIC"))

//Horzine Elite Green 9mm
	Skins.Add((Id=4334, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetEA01_MAT.horzineelitegreen_9mm.HorzineEliteGreen_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSetEA01_MAT.horzineelitegreen_9mm.HorzineEliteGreen_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetEA01_MAT.horzineelitegreen_9mm.HorzineEliteGreen_9mm_3P_Pickup_MIC"))

//Horzine Elite Red 9mm
	Skins.Add((Id=4337, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetEA01_MAT.horzineelitered_9mm.HorzineEliteRed_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSetEA01_MAT.horzineelitered_9mm.HorzineEliteRed_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetEA01_MAT.horzineelitered_9mm.HorzineEliteRed_9mm_3P_Pickup_MIC"))

//Horzine Elite White 9mm
	Skins.Add((Id=4340, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSetEA01_MAT.horzineelitewhite_9mm.HorzineEliteWhite_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSetEA01_MAT.horzineelitewhite_9mm.HorzineEliteWhite_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSetEA01_MAT.horzineelitewhite_9mm.HorzineEliteWhite_9mm_3P_Pickup_MIC"))

//Horzine Elite Blue Deagle
	Skins.Add((Id=4384, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet07_MAT.horzineeliteblue_deagle.HorzineEliteBlue_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.horzineeliteblue_deagle.HorzineEliteBlue_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet07_MAT.horzineeliteblue_deagle.HorzineEliteBlue_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=4383, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet07_MAT.horzineeliteblue_deagle.HorzineEliteBlue_Deagle_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet07_MAT.horzineeliteblue_deagle.HorzineEliteBlue_Deagle_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet07_MAT.horzineeliteblue_deagle.HorzineEliteBlue_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=4382, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet07_MAT.horzineeliteblue_deagle.HorzineEliteBlue_Deagle_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet07_MAT.horzineeliteblue_deagle.HorzineEliteBlue_Deagle_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet07_MAT.horzineeliteblue_deagle.HorzineEliteBlue_Deagle_3P_Pickup_MIC"))

//Horzine Elite Green Deagle
	Skins.Add((Id=4387, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet07_MAT.horzineelitegreen_deagle.HorzineEliteGreen_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.horzineelitegreen_deagle.HorzineEliteGreen_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet07_MAT.horzineelitegreen_deagle.HorzineEliteGreen_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=4386, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet07_MAT.horzineelitegreen_deagle.HorzineEliteGreen_Deagle_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet07_MAT.horzineelitegreen_deagle.HorzineEliteGreen_Deagle_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet07_MAT.horzineelitegreen_deagle.HorzineEliteGreen_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=4385, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet07_MAT.horzineelitegreen_deagle.HorzineEliteGreen_Deagle_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet07_MAT.horzineelitegreen_deagle.HorzineEliteGreen_Deagle_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet07_MAT.horzineelitegreen_deagle.HorzineEliteGreen_Deagle_3P_Pickup_MIC"))

//Horzine Elite Red Deagle
	Skins.Add((Id=4390, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet07_MAT.horzineelitered_deagle.HorzineEliteRed_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.horzineelitered_deagle.HorzineEliteRed_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet07_MAT.horzineelitered_deagle.HorzineEliteRed_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=4389, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet07_MAT.horzineelitered_deagle.HorzineEliteRed_Deagle_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet07_MAT.horzineelitered_deagle.HorzineEliteRed_Deagle_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet07_MAT.horzineelitered_deagle.HorzineEliteRed_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=4388, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet07_MAT.horzineelitered_deagle.HorzineEliteRed_Deagle_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet07_MAT.horzineelitered_deagle.HorzineEliteRed_Deagle_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet07_MAT.horzineelitered_deagle.HorzineEliteRed_Deagle_3P_Pickup_MIC"))

//Horzine Elite White Deagle
	Skins.Add((Id=4393, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet07_MAT.horzineelitewhite_deagle.HorzineEliteWhite_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.horzineelitewhite_deagle.HorzineEliteWhite_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet07_MAT.horzineelitewhite_deagle.HorzineEliteWhite_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=4392, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet07_MAT.horzineelitewhite_deagle.HorzineEliteWhite_Deagle_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet07_MAT.horzineelitewhite_deagle.HorzineEliteWhite_Deagle_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet07_MAT.horzineelitewhite_deagle.HorzineEliteWhite_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=4391, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet07_MAT.horzineelitewhite_deagle.HorzineEliteWhite_Deagle_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet07_MAT.horzineelitewhite_deagle.HorzineEliteWhite_Deagle_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet07_MAT.horzineelitewhite_deagle.HorzineEliteWhite_Deagle_3P_Pickup_MIC"))

//Tactical AA12
	Skins.Add((Id=4460, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet07_MAT.tactical_aa12.Tactical_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_aa12.Tactical_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_aa12.Tactical_AA12_3P_Pickup_MIC"))
 	Skins.Add((Id=4459, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet07_MAT.tactical_aa12.Tactical_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_aa12.Tactical_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_aa12.Tactical_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=4458, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet07_MAT.tactical_aa12.Tactical_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_aa12.Tactical_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_aa12.Tactical_AA12_3P_Pickup_MIC"))

//Tactical AK12
	Skins.Add((Id=4463, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet07_MAT.tactical_ak12.Tactical_AK12_1P_Mint_MIC", "WEP_SkinSet07_MAT.tactical_ak12.Tactical_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_ak12.Tactical_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_ak12.Tactical_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=4462, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet07_MAT.tactical_ak12.Tactical_AK12_1P_FieldTested_MIC", "WEP_SkinSet07_MAT.tactical_ak12.Tactical_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_ak12.Tactical_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_ak12.Tactical_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=4461, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet07_MAT.tactical_ak12.Tactical_AK12_1P_BattleScarred_MIC", "WEP_SkinSet07_MAT.tactical_ak12.Tactical_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_ak12.Tactical_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_ak12.Tactical_AK12_3P_Pickup_MIC"))

//Tactical L85A2
	Skins.Add((Id=4466, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet07_MAT.tactical_l85a2.Tactical_L85A2_1P_Mint_MIC", "WEP_SkinSet07_MAT.tactical_l85a2.Tactical_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_l85a2.Tactical_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_l85a2.Tactical_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=4465, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet07_MAT.tactical_l85a2.Tactical_L85A2_1P_FieldTested_MIC", "WEP_SkinSet07_MAT.tactical_l85a2.Tactical_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_l85a2.Tactical_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_l85a2.Tactical_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=4464, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet07_MAT.tactical_l85a2.Tactical_L85A2_1P_BattleScarred_MIC", "WEP_SkinSet07_MAT.tactical_l85a2.Tactical_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_l85a2.Tactical_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_l85a2.Tactical_L85A2_3P_Pickup_MIC"))

//Tactical MB500
	Skins.Add((Id=4469, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet07_MAT.tactical_mb500.Tactical_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_mb500.Tactical_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_mb500.Tactical_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=4468, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet07_MAT.tactical_mb500.Tactical_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_mb500.Tactical_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_mb500.Tactical_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=4467, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet07_MAT.tactical_mb500.Tactical_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_mb500.Tactical_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_mb500.Tactical_MB500_3P_Pickup_MIC"))

//Tactical Medic Assault
	Skins.Add((Id=4472, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet07_MAT.tactical_medicassault.Tactical_MedicAssault_1P_Mint_MIC", "WEP_SkinSet07_MAT.tactical_medicassault.Tactical_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_medicassault.Tactical_MedicAssault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_medicassault.Tactical_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=4471, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet07_MAT.tactical_medicassault.Tactical_MedicAssault_1P_FieldTested_MIC", "WEP_SkinSet07_MAT.tactical_medicassault.Tactical_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_medicassault.Tactical_MedicAssault_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_medicassault.Tactical_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=4470, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet07_MAT.tactical_medicassault.Tactical_MedicAssault_1P_BattleScarred_MIC", "WEP_SkinSet07_MAT.tactical_medicassault.Tactical_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_medicassault.Tactical_MedicAssault_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_medicassault.Tactical_MedicAssault_3P_Pickup_MIC"))

//Tactical SCAR
	Skins.Add((Id=4475, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet07_MAT.tactical_scar.Tactical_SCAR_1P_Mint_MIC", "WEP_SkinSet07_MAT.tactical_scar.Tactical_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_scar.Tactical_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_scar.Tactical_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=4474, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet07_MAT.tactical_scar.Tactical_SCAR_1P_FieldTested_MIC", "WEP_SkinSet07_MAT.tactical_scar.Tactical_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_scar.Tactical_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_scar.Tactical_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=4473, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet07_MAT.tactical_scar.Tactical_SCAR_1P_BattleScarred_MIC", "WEP_SkinSet07_MAT.tactical_scar.Tactical_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet07_MAT.tactical_scar.Tactical_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet07_MAT.tactical_scar.Tactical_SCAR_3P_Pickup_MIC"))

//Circuit Mace and Shield
	Skins.Add((Id=4544, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.circuit_maceshield.Circuit_Mace_1P_Mint_MIC", "WEP_SkinSet08_MAT.circuit_maceshield.Circuit_Shield_1P_Mint_MIC"), MIC_3P="WEP_SkinSet08_MAT.circuit_maceshield.Circuit_MaceShield_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet08_MAT.circuit_maceshield.Circuit_MaceShield_3P_Pickup_MIC"))
	Skins.Add((Id=4543, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.circuit_maceshield.Circuit_Mace_1P_FieldTested_MIC", "WEP_SkinSet08_MAT.circuit_maceshield.Circuit_Shield_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet08_MAT.circuit_maceshield.Circuit_MaceShield_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet08_MAT.circuit_maceshield.Circuit_MaceShield_3P_Pickup_MIC"))
	Skins.Add((Id=4542, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.circuit_maceshield.Circuit_Mace_1P_BattleScarred_MIC", "WEP_SkinSet08_MAT.circuit_maceshield.Circuit_Shield_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet08_MAT.circuit_maceshield.Circuit_MaceShield_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet08_MAT.circuit_maceshield.Circuit_MaceShield_3P_Pickup_MIC"))

//USA Mace and Shield
	Skins.Add((Id=4547, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.usa_maceshield.USA_Mace_1P_Mint_MIC", "WEP_SkinSet08_MAT.usa_maceshield.USA_Shield_1P_Mint_MIC"), MIC_3P="WEP_SkinSet08_MAT.usa_maceshield.USA_MaceShield_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet08_MAT.usa_maceshield.USA_MaceShield_3P_Pickup_MIC"))
	Skins.Add((Id=4546, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.usa_maceshield.USA_Mace_1P_FieldTested_MIC", "WEP_SkinSet08_MAT.usa_maceshield.USA_Shield_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet08_MAT.usa_maceshield.USA_MaceShield_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet08_MAT.usa_maceshield.USA_MaceShield_3P_Pickup_MIC"))
	Skins.Add((Id=4545, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.usa_maceshield.USA_Mace_1P_BattleScarred_MIC", "WEP_SkinSet08_MAT.usa_maceshield.USA_Shield_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet08_MAT.usa_maceshield.USA_MaceShield_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet08_MAT.usa_maceshield.USA_MaceShield_3P_Pickup_MIC"))

//Zed Hazard Mace and Shield
	Skins.Add((Id=4550, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.zedhazard_maceshield.ZedHazard_Mace_1P_Mint_MIC", "WEP_SkinSet08_MAT.zedhazard_maceshield.ZedHazard_Shield_1P_Mint_MIC"), MIC_3P="WEP_SkinSet08_MAT.zedhazard_maceshield.ZedHazard_MaceShield_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet08_MAT.zedhazard_maceshield.ZedHazard_MaceShield_3P_Pickup_MIC"))
	Skins.Add((Id=4549, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.zedhazard_maceshield.ZedHazard_Mace_1P_FieldTested_MIC", "WEP_SkinSet08_MAT.zedhazard_maceshield.ZedHazard_Shield_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet08_MAT.zedhazard_maceshield.ZedHazard_MaceShield_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet08_MAT.zedhazard_maceshield.ZedHazard_MaceShield_3P_Pickup_MIC"))
	Skins.Add((Id=4548, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.zedhazard_maceshield.ZedHazard_Mace_1P_BattleScarred_MIC", "WEP_SkinSet08_MAT.zedhazard_maceshield.ZedHazard_Shield_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet08_MAT.zedhazard_maceshield.ZedHazard_MaceShield_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet08_MAT.zedhazard_maceshield.ZedHazard_MaceShield_3P_Pickup_MIC"))

//Warning Mace and Shield
	Skins.Add((Id=4553, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.warning_maceshield.Warning_Mace_1P_Mint_MIC", "WEP_SkinSet08_MAT.warning_maceshield.Warning_Shield_1P_Mint_MIC"), MIC_3P="WEP_SkinSet08_MAT.warning_maceshield.Warning_MaceShield_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet08_MAT.warning_maceshield.Warning_MaceShield_3P_Pickup_MIC"))
	Skins.Add((Id=4552, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.warning_maceshield.Warning_Mace_1P_FieldTested_MIC", "WEP_SkinSet08_MAT.warning_maceshield.Warning_Shield_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet08_MAT.warning_maceshield.Warning_MaceShield_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet08_MAT.warning_maceshield.Warning_MaceShield_3P_Pickup_MIC"))
	Skins.Add((Id=4551, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.warning_maceshield.Warning_Mace_1P_BattleScarred_MIC", "WEP_SkinSet08_MAT.warning_maceshield.Warning_Shield_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet08_MAT.warning_maceshield.Warning_MaceShield_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet08_MAT.warning_maceshield.Warning_MaceShield_3P_Pickup_MIC"))

//Batcat Mace and Shield
	Skins.Add((Id=4556, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.batcat_maceshield.Batcat_Mace_1P_Mint_MIC", "WEP_SkinSet08_MAT.batcat_maceshield.Batcat_Shield_1P_Mint_MIC"), MIC_3P="WEP_SkinSet08_MAT.batcat_maceshield.Batcat_MaceShield_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet08_MAT.batcat_maceshield.Batcat_MaceShield_3P_Pickup_MIC"))
	Skins.Add((Id=4555, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.batcat_maceshield.Batcat_Mace_1P_FieldTested_MIC", "WEP_SkinSet08_MAT.batcat_maceshield.Batcat_Shield_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet08_MAT.batcat_maceshield.Batcat_MaceShield_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet08_MAT.batcat_maceshield.Batcat_MaceShield_3P_Pickup_MIC"))
	Skins.Add((Id=4554, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.batcat_maceshield.Batcat_Mace_1P_BattleScarred_MIC", "WEP_SkinSet08_MAT.batcat_maceshield.Batcat_Shield_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet08_MAT.batcat_maceshield.Batcat_MaceShield_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet08_MAT.batcat_maceshield.Batcat_MaceShield_3P_Pickup_MIC"))

//Guillotine Mace and Shield
	Skins.Add((Id=4559, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.guillotine_maceshield.Guillotine_Mace_1P_Mint_MIC", "WEP_SkinSet08_MAT.guillotine_maceshield.Guillotine_Shield_1P_Mint_MIC"), MIC_3P="WEP_SkinSet08_MAT.guillotine_maceshield.Guillotine_MaceShield_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet08_MAT.guillotine_maceshield.Guillotine_MaceShield_3P_Pickup_MIC"))
	Skins.Add((Id=4558, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.guillotine_maceshield.Guillotine_Mace_1P_FieldTested_MIC", "WEP_SkinSet08_MAT.guillotine_maceshield.Guillotine_Shield_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet08_MAT.guillotine_maceshield.Guillotine_MaceShield_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet08_MAT.guillotine_maceshield.Guillotine_MaceShield_3P_Pickup_MIC"))
	Skins.Add((Id=4557, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet08_MAT.guillotine_maceshield.Guillotine_Mace_1P_BattleScarred_MIC", "WEP_SkinSet08_MAT.guillotine_maceshield.Guillotine_Shield_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet08_MAT.guillotine_maceshield.Guillotine_MaceShield_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet08_MAT.guillotine_maceshield.Guillotine_MaceShield_3P_Pickup_MIC"))

//Deepstrike 9mm
	Skins.Add((Id=4359, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_9mm.Deepstrike_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_9mm.Deepstrike_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_9mm.Deepstrike_9mm_3P_Pickup_MIC"))
 	Skins.Add((Id=4358, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_9mm.Deepstrike_9mm_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_9mm.Deepstrike_9mm_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_9mm.Deepstrike_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=4357, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_9mm.Deepstrike_9mm_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_9mm.Deepstrike_9mm_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_9mm.Deepstrike_9mm_3P_Pickup_MIC"))

//Deepstrike Crossbow
	Skins.Add((Id=4362, Weapondef=class'KFWeapDef_Crossbow', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_crossbow.Deepstrike_Crossbow_1P_Mint_MIC", "WEP_SkinSet09_MAT.deepstrike_crossbow.Deepstrike_Crossbow_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_crossbow.Deepstrike_Crossbow_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_crossbow.Deepstrike_Crossbow_3P_Pickup_MIC"))
 	Skins.Add((Id=4361, Weapondef=class'KFWeapDef_Crossbow', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_crossbow.Deepstrike_Crossbow_1P_FieldTested_MIC", "WEP_SkinSet09_MAT.deepstrike_crossbow.Deepstrike_Crossbow_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_crossbow.Deepstrike_Crossbow_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_crossbow.Deepstrike_Crossbow_3P_Pickup_MIC"))
	Skins.Add((Id=4360, Weapondef=class'KFWeapDef_Crossbow', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_crossbow.Deepstrike_Crossbow_1P_BattleScarred_MIC", "WEP_SkinSet09_MAT.deepstrike_crossbow.Deepstrike_Crossbow_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_crossbow.Deepstrike_Crossbow_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_crossbow.Deepstrike_Crossbow_3P_Pickup_MIC"))

//Deepstrike Desert Eagle
	Skins.Add((Id=4365, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_deagle.Deepstrike_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_deagle.Deepstrike_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_deagle.Deepstrike_Deagle_3P_Pickup_MIC"))
 	Skins.Add((Id=4364, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_deagle.Deepstrike_Deagle_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_deagle.Deepstrike_Deagle_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_deagle.Deepstrike_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=4363, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_deagle.Deepstrike_Deagle_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_deagle.Deepstrike_Deagle_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_deagle.Deepstrike_Deagle_3P_Pickup_MIC"))

//Deepstrike Winchester 1894
	Skins.Add((Id=4368, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_lar.Deepstrike_LAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_lar.Deepstrike_LAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_lar.Deepstrike_LAR_3P_Pickup_MIC"))
 	Skins.Add((Id=4367, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_lar.Deepstrike_LAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_lar.Deepstrike_LAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_lar.Deepstrike_LAR_3P_Pickup_MIC"))
	Skins.Add((Id=4366, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_lar.Deepstrike_LAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_lar.Deepstrike_LAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_lar.Deepstrike_LAR_3P_Pickup_MIC"))

//Deepstrike M79
	Skins.Add((Id=4371, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_m79.Deepstrike_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_m79.Deepstrike_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_m79.Deepstrike_M79_3P_Pickup_MIC"))
 	Skins.Add((Id=4370, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_m79.Deepstrike_M79_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_m79.Deepstrike_M79_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_m79.Deepstrike_M79_3P_Pickup_MIC"))
	Skins.Add((Id=4369, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_m79.Deepstrike_M79_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_m79.Deepstrike_M79_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_m79.Deepstrike_M79_3P_Pickup_MIC"))

//Deepstrike RPG7
	Skins.Add((Id=4374, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_rpg7.Deepstrike_RPG7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_rpg7.Deepstrike_RPG7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_rpg7.Deepstrike_RPG7_3P_Pickup_MIC"))
 	Skins.Add((Id=4373, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_rpg7.Deepstrike_RPG7_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_rpg7.Deepstrike_RPG7_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_rpg7.Deepstrike_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=4372, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_rpg7.Deepstrike_RPG7_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_rpg7.Deepstrike_RPG7_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_rpg7.Deepstrike_RPG7_3P_Pickup_MIC"))

//Deepstrike SCAR
	Skins.Add((Id=4377, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_scar.Deepstrike_SCAR_1P_Mint_MIC", "WEP_SkinSet09_MAT.deepstrike_scar.Deepstrike_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_scar.Deepstrike_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_scar.Deepstrike_SCAR_3P_Pickup_MIC"))
 	Skins.Add((Id=4376, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_scar.Deepstrike_SCAR_1P_FieldTested_MIC", "WEP_SkinSet09_MAT.deepstrike_scar.Deepstrike_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_scar.Deepstrike_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_scar.Deepstrike_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=4375, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet09_MAT.deepstrike_scar.Deepstrike_SCAR_1P_BattleScarred_MIC", "WEP_SkinSet09_MAT.deepstrike_scar.Deepstrike_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.deepstrike_scar.Deepstrike_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet09_MAT.deepstrike_scar.Deepstrike_SCAR_3P_Pickup_MIC"))

//Horzine Elite Blue Kriss
	Skins.Add((Id=4572, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.horzineeliteblue_kriss.HorzineEliteBlue_Kriss_1P_Mint_MIC", "WEP_SkinSet09_MAT.horzineeliteblue_kriss.HorzineEliteBlue_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.horzineeliteblue_kriss.HorzineEliteBlue_Kriss_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.horzineeliteblue_kriss.HorzineEliteBlue_Kriss_3P_Pickup_MIC"))
 	Skins.Add((Id=4571, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.horzineeliteblue_kriss.HorzineEliteBlue_Kriss_1P_FieldTested_MIC", "WEP_SkinSet09_MAT.horzineeliteblue_kriss.HorzineEliteBlue_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.horzineeliteblue_kriss.HorzineEliteBlue_Kriss_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet09_MAT.horzineeliteblue_kriss.HorzineEliteBlue_Kriss_3P_Pickup_MIC"))
	Skins.Add((Id=4570, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.horzineeliteblue_kriss.HorzineEliteBlue_Kriss_1P_BattleScarred_MIC", "WEP_SkinSet09_MAT.horzineeliteblue_kriss.HorzineEliteBlue_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.horzineeliteblue_kriss.HorzineEliteBlue_Kriss_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet09_MAT.horzineeliteblue_kriss.HorzineEliteBlue_Kriss_3P_Pickup_MIC"))

//Horzine Elite Green Kriss
	Skins.Add((Id=4575, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.horzineelitegreen_kriss.HorzineEliteGreen_Kriss_1P_Mint_MIC", "WEP_SkinSet09_MAT.horzineelitegreen_kriss.HorzineEliteGreen_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.horzineelitegreen_kriss.HorzineEliteGreen_Kriss_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.horzineelitegreen_kriss.HorzineEliteGreen_Kriss_3P_Pickup_MIC"))
 	Skins.Add((Id=4574, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.horzineelitegreen_kriss.HorzineEliteGreen_Kriss_1P_FieldTested_MIC", "WEP_SkinSet09_MAT.horzineelitegreen_kriss.HorzineEliteGreen_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.horzineelitegreen_kriss.HorzineEliteGreen_Kriss_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet09_MAT.horzineelitegreen_kriss.HorzineEliteGreen_Kriss_3P_Pickup_MIC"))
	Skins.Add((Id=4573, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.horzineelitegreen_kriss.HorzineEliteGreen_Kriss_1P_BattleScarred_MIC", "WEP_SkinSet09_MAT.horzineelitegreen_kriss.HorzineEliteGreen_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.horzineelitegreen_kriss.HorzineEliteGreen_Kriss_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet09_MAT.horzineelitegreen_kriss.HorzineEliteGreen_Kriss_3P_Pickup_MIC"))

//Horzine Elite Red Kriss
	Skins.Add((Id=4578, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.horzineelitered_kriss.HorzineEliteRed_Kriss_1P_Mint_MIC", "WEP_SkinSet09_MAT.horzineelitered_kriss.HorzineEliteRed_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.horzineelitered_kriss.HorzineEliteRed_Kriss_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.horzineelitered_kriss.HorzineEliteRed_Kriss_3P_Pickup_MIC"))
 	Skins.Add((Id=4577, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.horzineelitered_kriss.HorzineEliteRed_Kriss_1P_FieldTested_MIC", "WEP_SkinSet09_MAT.horzineelitered_kriss.HorzineEliteRed_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.horzineelitered_kriss.HorzineEliteRed_Kriss_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet09_MAT.horzineelitered_kriss.HorzineEliteRed_Kriss_3P_Pickup_MIC"))
	Skins.Add((Id=4576, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.horzineelitered_kriss.HorzineEliteRed_Kriss_1P_BattleScarred_MIC", "WEP_SkinSet09_MAT.horzineelitered_kriss.HorzineEliteRed_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.horzineelitered_kriss.HorzineEliteRed_Kriss_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet09_MAT.horzineelitered_kriss.HorzineEliteRed_Kriss_3P_Pickup_MIC"))

//Horzine Elite White Kriss
	Skins.Add((Id=4581, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.horzineelitewhite_kriss.HorzineEliteWhite_Kriss_1P_Mint_MIC", "WEP_SkinSet09_MAT.horzineelitewhite_kriss.HorzineEliteWhite_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.horzineelitewhite_kriss.HorzineEliteWhite_Kriss_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet09_MAT.horzineelitewhite_kriss.HorzineEliteWhite_Kriss_3P_Pickup_MIC"))
 	Skins.Add((Id=4580, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.horzineelitewhite_kriss.HorzineEliteWhite_Kriss_1P_FieldTested_MIC", "WEP_SkinSet09_MAT.horzineelitewhite_kriss.HorzineEliteWhite_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.horzineelitewhite_kriss.HorzineEliteWhite_Kriss_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet09_MAT.horzineelitewhite_kriss.HorzineEliteWhite_Kriss_3P_Pickup_MIC"))
	Skins.Add((Id=4579, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet09_MAT.horzineelitewhite_kriss.HorzineEliteWhite_Kriss_1P_BattleScarred_MIC", "WEP_SkinSet09_MAT.horzineelitewhite_kriss.HorzineEliteWhite_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet09_MAT.horzineelitewhite_kriss.HorzineEliteWhite_Kriss_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet09_MAT.horzineelitewhite_kriss.HorzineEliteWhite_Kriss_3P_Pickup_MIC"))

//Industrial Crossbow
	Skins.Add((Id=4720, Weapondef=class'KFWeapDef_Crossbow', MIC_1P=("WEP_SkinSet10_MAT.industrial_crossbow.Industrial_Crossbow_1P_Mint_MIC", "WEP_SkinSet10_MAT.industrial_crossbow.Industrial_Crossbow_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_crossbow.Industrial_Crossbow_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_crossbow.Industrial_Crossbow_3P_Pickup_MIC"))
 	Skins.Add((Id=4719, Weapondef=class'KFWeapDef_Crossbow', MIC_1P=("WEP_SkinSet10_MAT.industrial_crossbow.Industrial_Crossbow_1P_FieldTested_MIC", "WEP_SkinSet10_MAT.industrial_crossbow.Industrial_Crossbow_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_crossbow.Industrial_Crossbow_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_crossbow.Industrial_Crossbow_3P_Pickup_MIC"))
	Skins.Add((Id=4718, Weapondef=class'KFWeapDef_Crossbow', MIC_1P=("WEP_SkinSet10_MAT.industrial_crossbow.Industrial_Crossbow_1P_BattleScarred_MIC", "WEP_SkinSet10_MAT.industrial_crossbow.Industrial_Crossbow_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_crossbow.Industrial_Crossbow_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_crossbow.Industrial_Crossbow_3P_Pickup_MIC"))

//Shredder (Industrial) Kriss
	Skins.Add((Id=4723, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet10_MAT.industrial_kriss.Industrial_Kriss_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_kriss.Industrial_Kriss_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_kriss.Industrial_Kriss_3P_Pickup_MIC"))
 	Skins.Add((Id=4722, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet10_MAT.industrial_kriss.Industrial_Kriss_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_kriss.Industrial_Kriss_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_kriss.Industrial_Kriss_3P_Pickup_MIC"))
	Skins.Add((Id=4721, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet10_MAT.industrial_kriss.Industrial_Kriss_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_kriss.Industrial_Kriss_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_kriss.Industrial_Kriss_3P_Pickup_MIC"))

//Industrial M14EBR
	Skins.Add((Id=4726, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet10_MAT.industrial_m14ebr.Industrial_M14EBR_1P_Mint_MIC", "WEP_SkinSet10_MAT.industrial_m14ebr.Industrial_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_m14ebr.Industrial_M14EBR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_m14ebr.Industrial_M14EBR_3P_Pickup_MIC"))
 	Skins.Add((Id=4725, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet10_MAT.industrial_m14ebr.Industrial_M14EBR_1P_FieldTested_MIC", "WEP_SkinSet10_MAT.industrial_m14ebr.Industrial_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_m14ebr.Industrial_M14EBR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_m14ebr.Industrial_M14EBR_3P_Pickup_MIC"))
	Skins.Add((Id=4724, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet10_MAT.industrial_m14ebr.Industrial_M14EBR_1P_BattleScarred_MIC", "WEP_SkinSet10_MAT.industrial_m14ebr.Industrial_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_m14ebr.Industrial_M14EBR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_m14ebr.Industrial_M14EBR_3P_Pickup_MIC"))

//Industrial MP5RAS
	Skins.Add((Id=4729, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet10_MAT.industrial_mp5ras.Industrial_MP5RAS_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_mp5ras.Industrial_MP5RAS_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_mp5ras.Industrial_MP5RAS_3P_Pickup_MIC"))
 	Skins.Add((Id=4728, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet10_MAT.industrial_mp5ras.Industrial_MP5RAS_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_mp5ras.Industrial_MP5RAS_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_mp5ras.Industrial_MP5RAS_3P_Pickup_MIC"))
	Skins.Add((Id=4727, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet10_MAT.industrial_mp5ras.Industrial_MP5RAS_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_mp5ras.Industrial_MP5RAS_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_mp5ras.Industrial_MP5RAS_3P_Pickup_MIC"))

//Jackhammer (Industrial) MP7
	Skins.Add((Id=4732, Weapondef=class'KFWeapDef_MP7', MIC_1P=("WEP_SkinSet10_MAT.industrial_mp7.Industrial_MP7_1P_Mint_MIC", "WEP_SkinSet10_MAT.industrial_mp7.Industrial_MP7_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_mp7.Industrial_MP7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_mp7.Industrial_MP7_3P_Pickup_MIC"))
 	Skins.Add((Id=4731, Weapondef=class'KFWeapDef_MP7', MIC_1P=("WEP_SkinSet10_MAT.industrial_mp7.Industrial_MP7_1P_FieldTested_MIC", "WEP_SkinSet10_MAT.industrial_mp7.Industrial_MP7_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_mp7.Industrial_MP7_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_mp7.Industrial_MP7_3P_Pickup_MIC"))
	Skins.Add((Id=4730, Weapondef=class'KFWeapDef_MP7', MIC_1P=("WEP_SkinSet10_MAT.industrial_mp7.Industrial_MP7_1P_BattleScarred_MIC", "WEP_SkinSet10_MAT.industrial_mp7.Industrial_MP7_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_mp7.Industrial_MP7_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_mp7.Industrial_MP7_3P_Pickup_MIC"))

//Buzzsaw (Industrial) P90
	Skins.Add((Id=4735, Weapondef=class'KFWeapDef_P90', MIC_1P=("WEP_SkinSet10_MAT.industrial_p90.Industrial_P90_1P_Mint_MIC", "WEP_SkinSet10_MAT.industrial_p90.Industrial_P90_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_p90.Industrial_P90_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_p90.Industrial_P90_3P_Pickup_MIC"))
 	Skins.Add((Id=4734, Weapondef=class'KFWeapDef_P90', MIC_1P=("WEP_SkinSet10_MAT.industrial_p90.Industrial_P90_1P_FieldTested_MIC", "WEP_SkinSet10_MAT.industrial_p90.Industrial_P90_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_p90.Industrial_P90_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_p90.Industrial_P90_3P_Pickup_MIC"))
	Skins.Add((Id=4733, Weapondef=class'KFWeapDef_P90', MIC_1P=("WEP_SkinSet10_MAT.industrial_p90.Industrial_P90_1P_BattleScarred_MIC", "WEP_SkinSet10_MAT.industrial_p90.Industrial_P90_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_p90.Industrial_P90_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_p90.Industrial_P90_3P_Pickup_MIC"))

//High Voltage (Industrial) Railgun
	Skins.Add((Id=4738, Weapondef=class'KFWeapDef_RailGun', MIC_1P=("WEP_SkinSet10_MAT.industrial_railgun.Industrial_RailGun_1P_Mint_MIC", "WEP_SkinSet10_MAT.industrial_railgun.Industrial_RailGun_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_railgun.Industrial_RailGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_railgun.Industrial_RailGun_3P_Pickup_MIC"))
 	Skins.Add((Id=4737, Weapondef=class'KFWeapDef_RailGun', MIC_1P=("WEP_SkinSet10_MAT.industrial_railgun.Industrial_RailGun_1P_FieldTested_MIC", "WEP_SkinSet10_MAT.industrial_railgun.Industrial_RailGun_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_railgun.Industrial_RailGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_railgun.Industrial_RailGun_3P_Pickup_MIC"))
	Skins.Add((Id=4736, Weapondef=class'KFWeapDef_RailGun', MIC_1P=("WEP_SkinSet10_MAT.industrial_railgun.Industrial_RailGun_1P_BattleScarred_MIC", "WEP_SkinSet10_MAT.industrial_railgun.Industrial_RailGun_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_railgun.Industrial_RailGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_railgun.Industrial_RailGun_3P_Pickup_MIC"))

//Industrial SW500
	Skins.Add((Id=4741, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet10_MAT.industrial_sw500.Industrial_SW500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_sw500.Industrial_SW500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_sw500.Industrial_SW500_3P_Pickup_MIC"))
	Skins.Add((Id=4740, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet10_MAT.industrial_sw500.Industrial_SW500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_sw500.Industrial_SW500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_sw500.Industrial_SW500_3P_Pickup_MIC"))
	Skins.Add((Id=4739, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet10_MAT.industrial_sw500.Industrial_SW500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet10_MAT.industrial_sw500.Industrial_SW500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet10_MAT.industrial_sw500.Industrial_SW500_3P_Pickup_MIC"))

//DigiCam Orange FlareGun
	Skins.Add((Id=4809, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.digicam_flaregun.DigiCam_FlareGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet11_MAT.digicam_flaregun.DigiCam_FlareGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet11_MAT.digicam_flaregun.DigiCam_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4808, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.digicam_flaregun.DigiCam_FlareGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet11_MAT.digicam_flaregun.DigiCam_FlareGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet11_MAT.digicam_flaregun.DigiCam_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4807, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.digicam_flaregun.DigiCam_FlareGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet11_MAT.digicam_flaregun.DigiCam_FlareGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet11_MAT.digicam_flaregun.DigiCam_FlareGun_3P_Pickup_MIC"))

//Fine China FlareGun
	Skins.Add((Id=4812, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.finechina_flaregun.FineChina_FlareGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet11_MAT.finechina_flaregun.FineChina_FlareGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet11_MAT.finechina_flaregun.FineChina_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4811, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.finechina_flaregun.FineChina_FlareGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet11_MAT.finechina_flaregun.FineChina_FlareGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet11_MAT.finechina_flaregun.FineChina_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4810, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.finechina_flaregun.FineChina_FlareGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet11_MAT.finechina_flaregun.FineChina_FlareGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet11_MAT.finechina_flaregun.FineChina_FlareGun_3P_Pickup_MIC"))

//Guillotine FlareGun
	Skins.Add((Id=4818, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.guillotine_flaregun.Guillotine_FlareGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet11_MAT.guillotine_flaregun.Guillotine_FlareGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet11_MAT.guillotine_flaregun.Guillotine_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4817, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.guillotine_flaregun.Guillotine_FlareGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet11_MAT.guillotine_flaregun.Guillotine_FlareGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet11_MAT.guillotine_flaregun.Guillotine_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4816, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.guillotine_flaregun.Guillotine_FlareGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet11_MAT.guillotine_flaregun.Guillotine_FlareGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet11_MAT.guillotine_flaregun.Guillotine_FlareGun_3P_Pickup_MIC"))

//Koi FlareGun
	Skins.Add((Id=4821, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.koi_flaregun.Koi_FlareGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet11_MAT.koi_flaregun.Koi_FlareGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet11_MAT.koi_flaregun.Koi_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4820, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.koi_flaregun.Koi_FlareGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet11_MAT.koi_flaregun.Koi_FlareGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet11_MAT.koi_flaregun.Koi_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4819, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.koi_flaregun.Koi_FlareGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet11_MAT.koi_flaregun.Koi_FlareGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet11_MAT.koi_flaregun.Koi_FlareGun_3P_Pickup_MIC"))

//Flame Blue FlareGun
	Skins.Add((Id=4824, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.flameblue_flaregun.FlameBlue_FlareGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet11_MAT.flameblue_flaregun.FlameBlue_FlareGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet11_MAT.flameblue_flaregun.FlameBlue_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4823, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.flameblue_flaregun.FlameBlue_FlareGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet11_MAT.flameblue_flaregun.FlameBlue_FlareGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet11_MAT.flameblue_flaregun.FlameBlue_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4822, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.flameblue_flaregun.FlameBlue_FlareGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet11_MAT.flameblue_flaregun.FlameBlue_FlareGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet11_MAT.flameblue_flaregun.FlameBlue_FlareGun_3P_Pickup_MIC"))

//Flame Orange FlareGun
	Skins.Add((Id=4806, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.flameorange_flaregun.FlameOrange_FlareGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet11_MAT.flameorange_flaregun.FlameOrange_FlareGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet11_MAT.flameorange_flaregun.FlameOrange_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4805, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.flameorange_flaregun.FlameOrange_FlareGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet11_MAT.flameorange_flaregun.FlameOrange_FlareGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet11_MAT.flameorange_flaregun.FlameOrange_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4804, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.flameorange_flaregun.FlameOrange_FlareGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet11_MAT.flameorange_flaregun.FlameOrange_FlareGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet11_MAT.flameorange_flaregun.FlameOrange_FlareGun_3P_Pickup_MIC"))

//Flame Red FlareGun
	Skins.Add((Id=4815, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.flamered_flaregun.FlameRed_FlareGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet11_MAT.flamered_flaregun.FlameRed_FlareGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet11_MAT.flamered_flaregun.FlameRed_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4814, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.flamered_flaregun.FlameRed_FlareGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet11_MAT.flamered_flaregun.FlameRed_FlareGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet11_MAT.flamered_flaregun.FlameRed_FlareGun_3P_Pickup_MIC"))
	Skins.Add((Id=4813, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet11_MAT.flamered_flaregun.FlameRed_FlareGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet11_MAT.flamered_flaregun.FlameRed_FlareGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet11_MAT.flamered_flaregun.FlameRed_FlareGun_3P_Pickup_MIC"))

//Snow Camo Freeze Thrower
	Skins.Add((Id=4829, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X01_Cryogun_1P_ID1_Mint_MIC", "WEP_SkinSet_CryoGun_MAT.X01_Cryogun_1P_ID2_Mint_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X01_Cryogun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X01_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4828, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X01_Cryogun_1P_ID1_FieldTested_MIC", "WEP_SkinSet_CryoGun_MAT.X01_Cryogun_1P_ID2_FieldTested_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X01_Cryogun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X01_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4827, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X01_Cryogun_1P_ID1_BattleScarred_MIC", "WEP_SkinSet_CryoGun_MAT.X01_Cryogun_1P_ID2_BattleScarred_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X01_Cryogun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X01_Cryogun_3P_Pickup_MIC"))

//Blood Camo Freeze Thrower
	Skins.Add((Id=4832, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X02_Cryogun_1P_ID1_Mint_MIC", "WEP_SkinSet_CryoGun_MAT.X02_Cryogun_1P_ID2_Mint_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X02_Cryogun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X02_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4831, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X02_Cryogun_1P_ID1_FieldTested_MIC", "WEP_SkinSet_CryoGun_MAT.X02_Cryogun_1P_ID2_FieldTested_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X02_Cryogun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X02_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4830, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X02_Cryogun_1P_ID1_BattleScarred_MIC", "WEP_SkinSet_CryoGun_MAT.X02_Cryogun_1P_ID2_BattleScarred_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X02_Cryogun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X02_Cryogun_3P_Pickup_MIC"))

//Minus Zero Blue Freeze Thrower
	Skins.Add((Id=4835, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X03_Cryogun_1P_ID1_Mint_MIC", "WEP_SkinSet_CryoGun_MAT.X03_Cryogun_1P_ID2_Mint_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X03_Cryogun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X03_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4834, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X03_Cryogun_1P_ID1_FieldTested_MIC", "WEP_SkinSet_CryoGun_MAT.X03_Cryogun_1P_ID2_FieldTested_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X03_Cryogun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X03_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4833, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X03_Cryogun_1P_ID1_BattleScarred_MIC", "WEP_SkinSet_CryoGun_MAT.X03_Cryogun_1P_ID2_BattleScarred_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X03_Cryogun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X03_Cryogun_3P_Pickup_MIC"))

//Minus Zero Red Freeze Thrower
	Skins.Add((Id=4838, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X04_Cryogun_1P_ID1_Mint_MIC", "WEP_SkinSet_CryoGun_MAT.X04_Cryogun_1P_ID2_Mint_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X04_Cryogun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X04_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4837, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X04_Cryogun_1P_ID1_FieldTested_MIC", "WEP_SkinSet_CryoGun_MAT.X04_Cryogun_1P_ID2_FieldTested_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X04_Cryogun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X04_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4836, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X04_Cryogun_1P_ID1_BattleScarred_MIC", "WEP_SkinSet_CryoGun_MAT.X04_Cryogun_1P_ID2_BattleScarred_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X04_Cryogun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X04_Cryogun_3P_Pickup_MIC"))

//Anodized Ice Multi-color Freeze Thrower
	Skins.Add((Id=4841, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X05_Cryogun_1P_ID1_Mint_MIC", "WEP_SkinSet_CryoGun_MAT.X05_Cryogun_1P_ID2_Mint_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X05_Cryogun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X05_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4840, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X05_Cryogun_1P_ID1_FieldTested_MIC", "WEP_SkinSet_CryoGun_MAT.X05_Cryogun_1P_ID2_FieldTested_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X05_Cryogun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X05_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4839, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X05_Cryogun_1P_ID1_BattleScarred_MIC", "WEP_SkinSet_CryoGun_MAT.X05_Cryogun_1P_ID2_BattleScarred_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X05_Cryogun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X05_Cryogun_3P_Pickup_MIC"))

//Anodized Ice Blue Freeze Thrower
	Skins.Add((Id=4844, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X06_Cryogun_1P_ID1_Mint_MIC", "WEP_SkinSet_CryoGun_MAT.X06_Cryogun_1P_ID2_Mint_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X06_Cryogun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X06_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4843, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X06_Cryogun_1P_ID1_FieldTested_MIC", "WEP_SkinSet_CryoGun_MAT.X06_Cryogun_1P_ID2_FieldTested_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X06_Cryogun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X06_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4842, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X06_Cryogun_1P_ID1_BattleScarred_MIC", "WEP_SkinSet_CryoGun_MAT.X06_Cryogun_1P_ID2_BattleScarred_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X06_Cryogun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X06_Cryogun_3P_Pickup_MIC"))

//Anodized Ice Red Freeze Thrower
	Skins.Add((Id=4847, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X07_Cryogun_1P_ID1_Mint_MIC", "WEP_SkinSet_CryoGun_MAT.X07_Cryogun_1P_ID2_Mint_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X07_Cryogun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X07_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4846, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X07_Cryogun_1P_ID1_FieldTested_MIC", "WEP_SkinSet_CryoGun_MAT.X07_Cryogun_1P_ID2_FieldTested_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X07_Cryogun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X07_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4845, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X07_Cryogun_1P_ID1_BattleScarred_MIC", "WEP_SkinSet_CryoGun_MAT.X07_Cryogun_1P_ID2_BattleScarred_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X07_Cryogun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X07_Cryogun_3P_Pickup_MIC"))

//Minus Zero Green Freeze Thrower
	Skins.Add((Id=4850, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X08_Cryogun_1P_ID1_Mint_MIC", "WEP_SkinSet_CryoGun_MAT.X08_Cryogun_1P_ID2_Mint_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X08_Cryogun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X08_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4849, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X08_Cryogun_1P_ID1_FieldTested_MIC", "WEP_SkinSet_CryoGun_MAT.X08_Cryogun_1P_ID2_FieldTested_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X08_Cryogun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X08_Cryogun_3P_Pickup_MIC"))
	Skins.Add((Id=4848, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_CryoGun_MAT.X08_Cryogun_1P_ID1_BattleScarred_MIC", "WEP_SkinSet_CryoGun_MAT.X08_Cryogun_1P_ID2_BattleScarred_Mic"), MIC_3P="WEP_SkinSet_CryoGun_MAT.X08_Cryogun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_CryoGun_MAT.X08_Cryogun_3P_Pickup_MIC"))

//Vietnam AK12
	Skins.Add((Id=4970, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet12_MAT.vietnam_ak12.Vietnam_AK12_1P_Mint_MIC", "WEP_SkinSet12_MAT.vietnam_ak12.Vietnam_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_ak12.Vietnam_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_ak12.Vietnam_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=4969, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet12_MAT.vietnam_ak12.Vietnam_AK12_1P_FieldTested_MIC", "WEP_SkinSet12_MAT.vietnam_ak12.Vietnam_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_ak12.Vietnam_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_ak12.Vietnam_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=4968, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet12_MAT.vietnam_ak12.Vietnam_AK12_1P_BattleScarred_MIC", "WEP_SkinSet12_MAT.vietnam_ak12.Vietnam_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_ak12.Vietnam_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_ak12.Vietnam_AK12_3P_Pickup_MIC"))

//Vietnam L85A2
	Skins.Add((Id=4964, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet12_MAT.vietnam_l85a2.Vietnam_L85A2_1P_Mint_MIC", "WEP_SkinSet12_MAT.vietnam_l85a2.Vietnam_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_l85a2.Vietnam_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_l85a2.Vietnam_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=4963, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet12_MAT.vietnam_l85a2.Vietnam_L85A2_1P_FieldTested_MIC", "WEP_SkinSet12_MAT.vietnam_l85a2.Vietnam_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_l85a2.Vietnam_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_l85a2.Vietnam_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=4962, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet12_MAT.vietnam_l85a2.Vietnam_L85A2_1P_BattleScarred_MIC", "WEP_SkinSet12_MAT.vietnam_l85a2.Vietnam_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_l85a2.Vietnam_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_l85a2.Vietnam_L85A2_3P_Pickup_MIC"))

//Vietnam M14EBR
	Skins.Add((Id=4973, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m14ebr.Vietnam_M14EBR_1P_Mint_MIC", "WEP_SkinSet12_MAT.vietnam_m14ebr.Vietnam_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m14ebr.Vietnam_M14EBR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m14ebr.Vietnam_M14EBR_3P_Pickup_MIC"))
	Skins.Add((Id=4972, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m14ebr.Vietnam_M14EBR_1P_FieldTested_MIC", "WEP_SkinSet12_MAT.vietnam_m14ebr.Vietnam_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m14ebr.Vietnam_M14EBR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m14ebr.Vietnam_M14EBR_3P_Pickup_MIC"))
	Skins.Add((Id=4971, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m14ebr.Vietnam_M14EBR_1P_BattleScarred_MIC", "WEP_SkinSet12_MAT.vietnam_m14ebr.Vietnam_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m14ebr.Vietnam_M14EBR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m14ebr.Vietnam_M14EBR_3P_Pickup_MIC"))

//Vietnam M1911
	Skins.Add((Id=4961, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m1911.Vietnam_M1911_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m1911.Vietnam_M1911_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m1911.Vietnam_M1911_3P_Pickup_MIC"))
	Skins.Add((Id=4960, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m1911.Vietnam_M1911_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m1911.Vietnam_M1911_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m1911.Vietnam_M1911_3P_Pickup_MIC"))
	Skins.Add((Id=4959, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m1911.Vietnam_M1911_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m1911.Vietnam_M1911_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m1911.Vietnam_M1911_3P_Pickup_MIC"))

//Vietnam M4
	Skins.Add((Id=4967, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m4.Vietnam_M4_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m4.Vietnam_M4_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m4.Vietnam_M4_3P_Pickup_MIC"))
	Skins.Add((Id=4966, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m4.Vietnam_M4_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m4.Vietnam_M4_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m4.Vietnam_M4_3P_Pickup_MIC"))
	Skins.Add((Id=4965, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m4.Vietnam_M4_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m4.Vietnam_M4_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m4.Vietnam_M4_3P_Pickup_MIC"))

//Vietnam RPG7
	Skins.Add((Id=4958, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet12_MAT.vietnam_rpg7.Vietnam_RPG7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_rpg7.Vietnam_RPG7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_rpg7.Vietnam_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=4957, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet12_MAT.vietnam_rpg7.Vietnam_RPG7_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_rpg7.Vietnam_RPG7_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_rpg7.Vietnam_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=4956, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet12_MAT.vietnam_rpg7.Vietnam_RPG7_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_rpg7.Vietnam_RPG7_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_rpg7.Vietnam_RPG7_3P_Pickup_MIC"))

//Vietnam Winchester 1894
	Skins.Add((Id=4955, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet12_MAT.vietnam_winchester1894.Vietnam_Winchester1894_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_winchester1894.Vietnam_Winchester1894_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_winchester1894.Vietnam_Winchester1894_3P_Pickup_MIC"))
	Skins.Add((Id=4954, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet12_MAT.vietnam_winchester1894.Vietnam_Winchester1894_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_winchester1894.Vietnam_Winchester1894_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_winchester1894.Vietnam_Winchester1894_3P_Pickup_MIC"))
	Skins.Add((Id=4953, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet12_MAT.vietnam_winchester1894.Vietnam_Winchester1894_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_winchester1894.Vietnam_Winchester1894_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_winchester1894.Vietnam_Winchester1894_3P_Pickup_MIC"))

//Vietnam M16 M203
	Skins.Add((Id=4983, Weapondef=class'KFWeapDef_M16M203', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M16_1P_Mint_MIC", "WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M203_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M16M203_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M16M203_3P_Pickup_MIC"))
	Skins.Add((Id=4982, Weapondef=class'KFWeapDef_M16M203', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M16_1P_FieldTested_MIC", "WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M203_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M16M203_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M16M203_3P_Pickup_MIC"))
	Skins.Add((Id=4981, Weapondef=class'KFWeapDef_M16M203', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M16_1P_BattleScarred_MIC", "WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M203_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M16M203_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M16M203_3P_Pickup_MIC"))

//Vietnam RPG7 - Rising Storm Digital Deluxe
	Skins.Add((Id=5017, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet12_MAT.vietnam_rpg7.Vietnam_RPG7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_rpg7.Vietnam_RPG7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_rpg7.Vietnam_RPG7_3P_Pickup_MIC"))

//Vietnam M16 M203 - Rising Storm Digital Deluxe
	Skins.Add((Id=5021, Weapondef=class'KFWeapDef_M16M203', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M16_1P_Mint_MIC", "WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M203_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M16M203_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m16m203.Vietnam_M16M203_3P_Pickup_MIC"))

//Vietnam M1911 - Rising Storm Digital Deluxe
	Skins.Add((Id=5022, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet12_MAT.vietnam_m1911.Vietnam_M1911_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_m1911.Vietnam_M1911_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_m1911.Vietnam_M1911_3P_Pickup_MIC"))

//Vietnam Winchester 1894 - Rising Storm Digital Deluxe
	Skins.Add((Id=5023, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet12_MAT.vietnam_winchester1894.Vietnam_Winchester1894_1P_Mint_MIC"), MIC_3P="WEP_SkinSet12_MAT.vietnam_winchester1894.Vietnam_Winchester1894_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet12_MAT.vietnam_winchester1894.Vietnam_Winchester1894_3P_Pickup_MIC"))

//Junkyard AA12
	Skins.Add((Id=4614, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet13_MAT.junkyard_aa12.Junkyard_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_aa12.Junkyard_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_aa12.Junkyard_AA12_3P_Pickup_MIC"))
 	Skins.Add((Id=4613, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet13_MAT.junkyard_aa12.Junkyard_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_aa12.Junkyard_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_aa12.Junkyard_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=4612, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet13_MAT.junkyard_aa12.Junkyard_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_aa12.Junkyard_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_aa12.Junkyard_AA12_3P_Pickup_MIC"))

//Junkyard AK12
	Skins.Add((Id=4617, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet13_MAT.junkyard_ak12.Junkyard_AK12_1P_Mint_MIC", "WEP_SkinSet13_MAT.junkyard_ak12.Junkyard_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_ak12.Junkyard_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_ak12.Junkyard_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=4616, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet13_MAT.junkyard_ak12.Junkyard_AK12_1P_FieldTested_MIC", "WEP_SkinSet13_MAT.junkyard_ak12.Junkyard_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_ak12.Junkyard_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_ak12.Junkyard_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=4615, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet13_MAT.junkyard_ak12.Junkyard_AK12_1P_BattleScarred_MIC", "WEP_SkinSet13_MAT.junkyard_ak12.Junkyard_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_ak12.Junkyard_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_ak12.Junkyard_AK12_3P_Pickup_MIC"))

//Junkyard Kriss
	Skins.Add((Id=4620, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet13_MAT.junkyard_kriss.Junkyard_Kriss_1P_Mint_MIC", "WEP_SkinSet13_MAT.junkyard_kriss.Junkyard_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_kriss.Junkyard_Kriss_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_kriss.Junkyard_Kriss_3P_Pickup_MIC"))
	Skins.Add((Id=4619, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet13_MAT.junkyard_kriss.Junkyard_Kriss_1P_FieldTested_MIC", "WEP_SkinSet13_MAT.junkyard_kriss.Junkyard_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_kriss.Junkyard_Kriss_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_kriss.Junkyard_Kriss_3P_Pickup_MIC"))
	Skins.Add((Id=4618, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet13_MAT.junkyard_kriss.Junkyard_Kriss_1P_BattleScarred_MIC", "WEP_SkinSet13_MAT.junkyard_kriss.Junkyard_Kriss_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_kriss.Junkyard_Kriss_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_kriss.Junkyard_Kriss_3P_Pickup_MIC"))

//Junkyard L85A2
	Skins.Add((Id=4623, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet13_MAT.junkyard_l85a2.Junkyard_L85A2_1P_Mint_MIC", "WEP_SkinSet13_MAT.junkyard_l85a2.Junkyard_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_l85a2.Junkyard_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_l85a2.Junkyard_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=4622, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet13_MAT.junkyard_l85a2.Junkyard_L85A2_1P_FieldTested_MIC", "WEP_SkinSet13_MAT.junkyard_l85a2.Junkyard_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_l85a2.Junkyard_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_l85a2.Junkyard_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=4621, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet13_MAT.junkyard_l85a2.Junkyard_L85A2_1P_BattleScarred_MIC", "WEP_SkinSet13_MAT.junkyard_l85a2.Junkyard_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_l85a2.Junkyard_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_l85a2.Junkyard_L85A2_3P_Pickup_MIC"))

//Junkyard M14EBR
	Skins.Add((Id=4638, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet13_MAT.junkyard_m14ebr.Junkyard_M14EBR_1P_Mint_MIC", "WEP_SkinSet13_MAT.junkyard_m14ebr.Junkyard_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_m14ebr.Junkyard_M14EBR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_m14ebr.Junkyard_M14EBR_3P_Pickup_MIC"))
	Skins.Add((Id=4637, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet13_MAT.junkyard_m14ebr.Junkyard_M14EBR_1P_FieldTested_MIC", "WEP_SkinSet13_MAT.junkyard_m14ebr.Junkyard_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_m14ebr.Junkyard_M14EBR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_m14ebr.Junkyard_M14EBR_3P_Pickup_MIC"))
	Skins.Add((Id=4636, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet13_MAT.junkyard_m14ebr.Junkyard_M14EBR_1P_BattleScarred_MIC", "WEP_SkinSet13_MAT.junkyard_m14ebr.Junkyard_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_m14ebr.Junkyard_M14EBR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_m14ebr.Junkyard_M14EBR_3P_Pickup_MIC"))

//Junkyard M16 M203
	Skins.Add((Id=4987, Weapondef=class'KFWeapDef_M16M203', MIC_1P=("WEP_SkinSet13_MAT.junkyard_m16m203.Junkyard_M16_1P_Mint_MIC", "WEP_SkinSet13_MAT.junkyard_m16m203.Junkyard_M203_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_m16m203.Junkyard_M16M203_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_m16m203.Junkyard_M16M203_3P_Pickup_MIC"))
	Skins.Add((Id=4986, Weapondef=class'KFWeapDef_M16M203', MIC_1P=("WEP_SkinSet13_MAT.junkyard_m16m203.Junkyard_M16_1P_FieldTested_MIC", "WEP_SkinSet13_MAT.junkyard_m16m203.Junkyard_M203_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_m16m203.Junkyard_M16M203_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_m16m203.Junkyard_M16M203_3P_Pickup_MIC"))
	Skins.Add((Id=4985, Weapondef=class'KFWeapDef_M16M203', MIC_1P=("WEP_SkinSet13_MAT.junkyard_m16m203.Junkyard_M16_1P_BattleScarred_MIC", "WEP_SkinSet13_MAT.junkyard_m16m203.Junkyard_M203_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_m16m203.Junkyard_M16M203_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_m16m203.Junkyard_M16M203_3P_Pickup_MIC"))

//Junkyard M4
	Skins.Add((Id=4626, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet13_MAT.junkyard_m4.Junkyard_M4_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_m4.Junkyard_M4_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_m4.Junkyard_M4_3P_Pickup_MIC"))
 	Skins.Add((Id=4625, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet13_MAT.junkyard_m4.Junkyard_M4_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_m4.Junkyard_M4_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_m4.Junkyard_M4_3P_Pickup_MIC"))
	Skins.Add((Id=4624, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet13_MAT.junkyard_m4.Junkyard_M4_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_m4.Junkyard_M4_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_m4.Junkyard_M4_3P_Pickup_MIC"))

//Junkyard MP5RAS
	Skins.Add((Id=4629, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet13_MAT.junkyard_mp5ras.Junkyard_MP5RAS_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_mp5ras.Junkyard_MP5RAS_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_mp5ras.Junkyard_MP5RAS_3P_Pickup_MIC"))
 	Skins.Add((Id=4628, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet13_MAT.junkyard_mp5ras.Junkyard_MP5RAS_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_mp5ras.Junkyard_MP5RAS_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_mp5ras.Junkyard_MP5RAS_3P_Pickup_MIC"))
	Skins.Add((Id=4627, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet13_MAT.junkyard_mp5ras.Junkyard_MP5RAS_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_mp5ras.Junkyard_MP5RAS_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_mp5ras.Junkyard_MP5RAS_3P_Pickup_MIC"))

//Junkyard SCAR
	Skins.Add((Id=4632, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet13_MAT.junkyard_scar.Junkyard_SCAR_1P_Mint_MIC", "WEP_SkinSet13_MAT.junkyard_scar.Junkyard_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_scar.Junkyard_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_scar.Junkyard_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=4631, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet13_MAT.junkyard_scar.Junkyard_SCAR_1P_FieldTested_MIC", "WEP_SkinSet13_MAT.junkyard_scar.Junkyard_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_scar.Junkyard_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_scar.Junkyard_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=4630, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet13_MAT.junkyard_scar.Junkyard_SCAR_1P_BattleScarred_MIC", "WEP_SkinSet13_MAT.junkyard_scar.Junkyard_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_scar.Junkyard_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_scar.Junkyard_SCAR_3P_Pickup_MIC"))

//Junkyard Winchester 1894
	Skins.Add((Id=4635, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet13_MAT.junkyard_winchester1894.Junkyard_Winchester1894_1P_Mint_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_winchester1894.Junkyard_Winchester1894_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_winchester1894.Junkyard_Winchester1894_3P_Pickup_MIC"))
 	Skins.Add((Id=4634, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet13_MAT.junkyard_winchester1894.Junkyard_Winchester1894_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_winchester1894.Junkyard_Winchester1894_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_winchester1894.Junkyard_Winchester1894_3P_Pickup_MIC"))
	Skins.Add((Id=4633, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet13_MAT.junkyard_winchester1894.Junkyard_Winchester1894_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet13_MAT.junkyard_winchester1894.Junkyard_Winchester1894_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet13_MAT.junkyard_winchester1894.Junkyard_Winchester1894_3P_Pickup_MIC"))

//Headshot Weekly Centerfire
	Skins.Add((Id=4933, Weapondef=class'KFWeapDef_CenterfireMB464', MIC_1P=("WEP_1P_Centerfire_MAT.Wep_1stP_Centerfire_Zombie_MIC"), MIC_3P="WEP_3P_Centerfire_MAT.Wep_3rdP_Centerfire_Zombie_MIC", MIC_Pickup="WEP_3P_Centerfire_MAT.Wep_3rdP_Centerfire_Zombie_Pickup_MIC"))

//Horzine Elite White MP5RAS
	Skins.Add((Id=5033, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineelitewhite_mp5ras.HorzineEliteWhite_MP5RAS_1P_Mint_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineelitewhite_mp5ras.HorzineEliteWhite_MP5RAS_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineelitewhite_mp5ras.HorzineEliteWhite_MP5RAS_3P_Pickup_MIC"))
 	Skins.Add((Id=5032, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineelitewhite_mp5ras.HorzineEliteWhite_MP5RAS_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineelitewhite_mp5ras.HorzineEliteWhite_MP5RAS_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineelitewhite_mp5ras.HorzineEliteWhite_MP5RAS_3P_Pickup_MIC"))
	Skins.Add((Id=5031, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineelitewhite_mp5ras.HorzineEliteWhite_MP5RAS_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineelitewhite_mp5ras.HorzineEliteWhite_MP5RAS_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineelitewhite_mp5ras.HorzineEliteWhite_MP5RAS_3P_Pickup_MIC"))

//Horzine Elite Black MP5RAS
	Skins.Add((Id=5036, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineeliteblack_mp5ras.HorzineEliteBlack_MP5RAS_1P_Mint_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineeliteblack_mp5ras.HorzineEliteBlack_MP5RAS_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineeliteblack_mp5ras.HorzineEliteBlack_MP5RAS_3P_Pickup_MIC"))
 	Skins.Add((Id=5035, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineeliteblack_mp5ras.HorzineEliteBlack_MP5RAS_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineeliteblack_mp5ras.HorzineEliteBlack_MP5RAS_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineeliteblack_mp5ras.HorzineEliteBlack_MP5RAS_3P_Pickup_MIC"))
	Skins.Add((Id=5034, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineeliteblack_mp5ras.HorzineEliteBlack_MP5RAS_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineeliteblack_mp5ras.HorzineEliteBlack_MP5RAS_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineeliteblack_mp5ras.HorzineEliteBlack_MP5RAS_3P_Pickup_MIC"))

//Horzine Elite Green MP5RAS
	Skins.Add((Id=5039, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineelitegreen_mp5ras.HorzineEliteGreen_MP5RAS_1P_Mint_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineelitegreen_mp5ras.HorzineEliteGreen_MP5RAS_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineelitegreen_mp5ras.HorzineEliteGreen_MP5RAS_3P_Pickup_MIC"))
 	Skins.Add((Id=5038, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineelitegreen_mp5ras.HorzineEliteGreen_MP5RAS_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineelitegreen_mp5ras.HorzineEliteGreen_MP5RAS_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineelitegreen_mp5ras.HorzineEliteGreen_MP5RAS_3P_Pickup_MIC"))
	Skins.Add((Id=5037, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineelitegreen_mp5ras.HorzineEliteGreen_MP5RAS_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineelitegreen_mp5ras.HorzineEliteGreen_MP5RAS_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineelitegreen_mp5ras.HorzineEliteGreen_MP5RAS_3P_Pickup_MIC"))

//Horzine Elite Blue MP5RAS
	Skins.Add((Id=5042, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineeliteblue_mp5ras.HorzineEliteBlue_MP5RAS_1P_Mint_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineeliteblue_mp5ras.HorzineEliteBlue_MP5RAS_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineeliteblue_mp5ras.HorzineEliteBlue_MP5RAS_3P_Pickup_MIC"))
 	Skins.Add((Id=5041, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineeliteblue_mp5ras.HorzineEliteBlue_MP5RAS_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineeliteblue_mp5ras.HorzineEliteBlue_MP5RAS_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineeliteblue_mp5ras.HorzineEliteBlue_MP5RAS_3P_Pickup_MIC"))
	Skins.Add((Id=5040, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineeliteblue_mp5ras.HorzineEliteBlue_MP5RAS_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineeliteblue_mp5ras.HorzineEliteBlue_MP5RAS_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineeliteblue_mp5ras.HorzineEliteBlue_MP5RAS_3P_Pickup_MIC"))

//Horzine Elite Red MP5RAS
	Skins.Add((Id=5045, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineelitered_mp5ras.HorzineEliteRed_MP5RAS_1P_Mint_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineelitered_mp5ras.HorzineEliteRed_MP5RAS_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineelitered_mp5ras.HorzineEliteRed_MP5RAS_3P_Pickup_MIC"))
 	Skins.Add((Id=5044, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineelitered_mp5ras.HorzineEliteRed_MP5RAS_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineelitered_mp5ras.HorzineEliteRed_MP5RAS_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineelitered_mp5ras.HorzineEliteRed_MP5RAS_3P_Pickup_MIC"))
	Skins.Add((Id=5043, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet15_MAT.horzineelitered_mp5ras.HorzineEliteRed_MP5RAS_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet15_MAT.horzineelitered_mp5ras.HorzineEliteRed_MP5RAS_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet15_MAT.horzineelitered_mp5ras.HorzineEliteRed_MP5RAS_3P_Pickup_MIC"))

//Halloween 9mm
	Skins.Add((Id=5115, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet14_MAT.halloween_9mm.Halloween_9MM_1P_Mint_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_9mm.Halloween_9MM_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_9mm.Halloween_9MM_3P_Pickup_MIC"))
 	Skins.Add((Id=5114, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet14_MAT.halloween_9mm.Halloween_9MM_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_9mm.Halloween_9MM_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_9mm.Halloween_9MM_3P_Pickup_MIC"))
	Skins.Add((Id=5113, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet14_MAT.halloween_9mm.Halloween_9MM_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_9mm.Halloween_9MM_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_9mm.Halloween_9MM_3P_Pickup_MIC"))

//Halloween Crossbow
	Skins.Add((Id=5118, Weapondef=class'KFWeapDef_Crossbow', MIC_1P=("WEP_SkinSet14_MAT.halloween_crossbow.Halloween_Crossbow_1P_Mint_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_crossbow.Halloween_Crossbow_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_crossbow.Halloween_Crossbow_3P_Pickup_MIC"))
 	Skins.Add((Id=5117, Weapondef=class'KFWeapDef_Crossbow', MIC_1P=("WEP_SkinSet14_MAT.halloween_crossbow.Halloween_Crossbow_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_crossbow.Halloween_Crossbow_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_crossbow.Halloween_Crossbow_3P_Pickup_MIC"))
	Skins.Add((Id=5116, Weapondef=class'KFWeapDef_Crossbow', MIC_1P=("WEP_SkinSet14_MAT.halloween_crossbow.Halloween_Crossbow_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_crossbow.Halloween_Crossbow_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_crossbow.Halloween_Crossbow_3P_Pickup_MIC"))

//Halloween Flamethrower
	Skins.Add((Id=5121, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet14_MAT.halloween_flamethrower.Halloween_Flamethrower_1P_Mint_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_flamethrower.Halloween_Flamethrower_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_flamethrower.Halloween_Flamethrower_3P_Pickup_MIC"))
 	Skins.Add((Id=5120, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet14_MAT.halloween_flamethrower.Halloween_Flamethrower_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_flamethrower.Halloween_Flamethrower_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_flamethrower.Halloween_Flamethrower_3P_Pickup_MIC"))
	Skins.Add((Id=5119, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet14_MAT.halloween_flamethrower.Halloween_Flamethrower_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_flamethrower.Halloween_Flamethrower_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_flamethrower.Halloween_Flamethrower_3P_Pickup_MIC"))

//Halloween Healer
	Skins.Add((Id=5124, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet14_MAT.halloween_healer.Halloween_Healer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_healer.Halloween_Healer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_healer.Halloween_Healer_3P_Pickup_MIC"))
 	Skins.Add((Id=5123, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet14_MAT.halloween_healer.Halloween_Healer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_healer.Halloween_Healer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_healer.Halloween_Healer_3P_Pickup_MIC"))
	Skins.Add((Id=5122, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet14_MAT.halloween_healer.Halloween_Healer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_healer.Halloween_Healer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_healer.Halloween_Healer_3P_Pickup_MIC"))

//Halloween HZ12
	Skins.Add((Id=5127, Weapondef=class'KFWeapDef_HZ12', MIC_1P=("WEP_SkinSet14_MAT.halloween_hz12.Halloween_HZ12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_hz12.Halloween_HZ12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_hz12.Halloween_HZ12_3P_Pickup_MIC"))
 	Skins.Add((Id=5126, Weapondef=class'KFWeapDef_HZ12', MIC_1P=("WEP_SkinSet14_MAT.halloween_hz12.Halloween_HZ12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_hz12.Halloween_HZ12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_hz12.Halloween_HZ12_3P_Pickup_MIC"))
	Skins.Add((Id=5125, Weapondef=class'KFWeapDef_HZ12', MIC_1P=("WEP_SkinSet14_MAT.halloween_hz12.Halloween_HZ12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_hz12.Halloween_HZ12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_hz12.Halloween_HZ12_3P_Pickup_MIC"))

//Halloween Katana
	Skins.Add((Id=5130, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet14_MAT.halloween_katana.Halloween_Katana_1P_Mint_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_katana.Halloween_Katana_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_katana.Halloween_Katana_3P_Pickup_MIC"))
 	Skins.Add((Id=5129, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet14_MAT.halloween_katana.Halloween_Katana_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_katana.Halloween_Katana_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_katana.Halloween_Katana_3P_Pickup_MIC"))
	Skins.Add((Id=5128, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet14_MAT.halloween_katana.Halloween_Katana_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_katana.Halloween_Katana_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_katana.Halloween_Katana_3P_Pickup_MIC"))

//Halloween Kriss
	Skins.Add((Id=5133, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet14_MAT.halloween_kriss.Halloween_Kriss_1P_Mint_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_kriss.Halloween_Kriss_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_kriss.Halloween_Kriss_3P_Pickup_MIC"))
 	Skins.Add((Id=5132, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet14_MAT.halloween_kriss.Halloween_Kriss_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_kriss.Halloween_Kriss_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_kriss.Halloween_Kriss_3P_Pickup_MIC"))
	Skins.Add((Id=5131, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet14_MAT.halloween_kriss.Halloween_Kriss_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_kriss.Halloween_Kriss_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_kriss.Halloween_Kriss_3P_Pickup_MIC"))

//Halloween M79
	Skins.Add((Id=5136, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet14_MAT.halloween_m79.Halloween_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_m79.Halloween_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_m79.Halloween_M79_3P_Pickup_MIC"))
 	Skins.Add((Id=5135, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet14_MAT.halloween_m79.Halloween_M79_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_m79.Halloween_M79_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_m79.Halloween_M79_3P_Pickup_MIC"))
	Skins.Add((Id=5134, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet14_MAT.halloween_m79.Halloween_M79_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_m79.Halloween_M79_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_m79.Halloween_M79_3P_Pickup_MIC"))

//Halloween Stoner 63A
	Skins.Add((Id=5139, Weapondef=class'KFWeapDef_Stoner63A', MIC_1P=("WEP_SkinSet14_MAT.halloween_stoner63a.Halloween_Stoner63a_1P_Mint_MIC", "WEP_SkinSet14_MAT.halloween_stoner63a.Halloween_Stoner63a_Receiver_1P_Mint_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_stoner63a.Halloween_Stoner63a_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_stoner63a.Halloween_Stoner63a_3P_Pickup_MIC"))
 	Skins.Add((Id=5138, Weapondef=class'KFWeapDef_Stoner63A', MIC_1P=("WEP_SkinSet14_MAT.halloween_stoner63a.Halloween_Stoner63a_1P_FieldTested_MIC", "WEP_SkinSet14_MAT.halloween_stoner63a.Halloween_Stoner63a_Receiver_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_stoner63a.Halloween_Stoner63a_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_stoner63a.Halloween_Stoner63a_3P_Pickup_MIC"))
	Skins.Add((Id=5137, Weapondef=class'KFWeapDef_Stoner63A', MIC_1P=("WEP_SkinSet14_MAT.halloween_stoner63a.Halloween_Stoner63a_1P_BattleScarred_MIC", "WEP_SkinSet14_MAT.halloween_stoner63a.Halloween_Stoner63a_Receiver_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet14_MAT.halloween_stoner63a.Halloween_Stoner63a_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet14_MAT.halloween_stoner63a.Halloween_Stoner63a_3P_Pickup_MIC"))

//Neon MB500
	Skins.Add((Id=5160, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet16_MAT.neon_mb500.Neon_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_mb500.Neon_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_mb500.Neon_MB500_3P_Pickup_MIC"))
 	Skins.Add((Id=5159, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet16_MAT.neon_mb500.Neon_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_mb500.Neon_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_mb500.Neon_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=5158, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet16_MAT.neon_mb500.Neon_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_mb500.Neon_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_mb500.Neon_MB500_3P_Pickup_MIC"))

//Neon Railgun
	Skins.Add((Id=5163, Weapondef=class'KFWeapDef_RailGun', MIC_1P=("WEP_SkinSet16_MAT.neon_railgun.Neon_Railgun_1P_Mint_MIC", "WEP_SkinSet16_MAT.neon_railgun.Neon_Railgun_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_railgun.Neon_Railgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_railgun.Neon_Railgun_3P_Pickup_MIC"))
 	Skins.Add((Id=5162, Weapondef=class'KFWeapDef_RailGun', MIC_1P=("WEP_SkinSet16_MAT.neon_railgun.Neon_Railgun_1P_FieldTested_MIC", "WEP_SkinSet16_MAT.neon_railgun.Neon_Railgun_Scope_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_railgun.Neon_Railgun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_railgun.Neon_Railgun_3P_Pickup_MIC"))
	Skins.Add((Id=5161, Weapondef=class'KFWeapDef_RailGun', MIC_1P=("WEP_SkinSet16_MAT.neon_railgun.Neon_Railgun_1P_BattleScarred_MIC", "WEP_SkinSet16_MAT.neon_railgun.Neon_Railgun_Scope_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_railgun.Neon_Railgun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_railgun.Neon_Railgun_3P_Pickup_MIC"))

//Neon RPG7
	Skins.Add((Id=5166, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet16_MAT.neon_rpg7.Neon_RPG7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_rpg7.Neon_RPG7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_rpg7.Neon_RPG7_3P_Pickup_MIC"))
 	Skins.Add((Id=5165, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet16_MAT.neon_rpg7.Neon_RPG7_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_rpg7.Neon_RPG7_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_rpg7.Neon_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=5164, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet16_MAT.neon_rpg7.Neon_RPG7_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_rpg7.Neon_RPG7_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_rpg7.Neon_RPG7_3P_Pickup_MIC"))

//Neon Scar
	Skins.Add((Id=5169, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet16_MAT.neon_scar.Neon_SCAR_1P_Mint_MIC", "WEP_SkinSet16_MAT.neon_scar.Neon_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_scar.Neon_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_scar.Neon_SCAR_3P_Pickup_MIC"))
 	Skins.Add((Id=5168, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet16_MAT.neon_scar.Neon_SCAR_1P_FieldTested_MIC", "WEP_SkinSet16_MAT.neon_scar.Neon_SCAR_Scope_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_scar.Neon_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_scar.Neon_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=5167, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet16_MAT.neon_scar.Neon_SCAR_1P_BattleScarred_MIC", "WEP_SkinSet16_MAT.neon_scar.Neon_SCAR_Scope_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_scar.Neon_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_scar.Neon_SCAR_3P_Pickup_MIC"))

//Neon M1911
	Skins.Add((Id=5172, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet16_MAT.neon_m1911.Neon_M1911_1P_Mint_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_m1911.Neon_M1911_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_m1911.Neon_M1911_3P_Pickup_MIC"))
 	Skins.Add((Id=5171, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet16_MAT.neon_m1911.Neon_M1911_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_m1911.Neon_M1911_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_m1911.Neon_M1911_3P_Pickup_MIC"))
	Skins.Add((Id=5170, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet16_MAT.neon_m1911.Neon_M1911_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_m1911.Neon_M1911_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_m1911.Neon_M1911_3P_Pickup_MIC"))

//Neon Katana
	Skins.Add((Id=5175, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet16_MAT.neon_katana.Neon_Katana_1P_Mint_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_katana.Neon_Katana_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_katana.Neon_Katana_3P_Pickup_MIC"))
 	Skins.Add((Id=5174, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet16_MAT.neon_katana.Neon_Katana_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_katana.Neon_Katana_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_katana.Neon_Katana_3P_Pickup_MIC"))
	Skins.Add((Id=5173, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet16_MAT.neon_katana.Neon_Katana_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_katana.Neon_Katana_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_katana.Neon_Katana_3P_Pickup_MIC"))

//Neon Dragonsbreath
	Skins.Add((Id=5178, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet16_MAT.neon_dragonsbreath.Neon_DragonsBreath_1P_Mint_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_dragonsbreath.Neon_DragonsBreath_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_dragonsbreath.Neon_DragonsBreath_3P_Pickup_MIC"))
 	Skins.Add((Id=5177, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet16_MAT.neon_dragonsbreath.Neon_DragonsBreath_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_dragonsbreath.Neon_DragonsBreath_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_dragonsbreath.Neon_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=5176, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet16_MAT.neon_dragonsbreath.Neon_DragonsBreath_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_dragonsbreath.Neon_DragonsBreath_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_dragonsbreath.Neon_DragonsBreath_3P_Pickup_MIC"))

//Neon Kriss
	Skins.Add((Id=5181, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet16_MAT.neon_kriss.Neon_KRISS_1P_Mint_MIC", "WEP_SkinSet16_MAT.neon_kriss.Neon_KRISS_Sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_kriss.Neon_KRISS_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_kriss.Neon_KRISS_3P_Pickup_MIC"))
 	Skins.Add((Id=5180, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet16_MAT.neon_kriss.Neon_KRISS_1P_FieldTested_MIC", "WEP_SkinSet16_MAT.neon_kriss.Neon_KRISS_Sight_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_kriss.Neon_KRISS_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_kriss.Neon_KRISS_3P_Pickup_MIC"))
	Skins.Add((Id=5179, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet16_MAT.neon_kriss.Neon_KRISS_1P_BattleScarred_MIC", "WEP_SkinSet16_MAT.neon_kriss.Neon_KRISS_Sight_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet16_MAT.neon_kriss.Neon_KRISS_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet16_MAT.neon_kriss.Neon_KRISS_3P_Pickup_MIC"))

//Vault Pink MP7
	Skins.Add((Id=5291, Weapondef=class'KFWeapDef_MP7', MIC_1P=("WEP_SkinSet17_MAT.cute_mp7.Vault_Cute_MP7_1P_Mint_MIC", "WEP_SkinSet17_MAT.cute_mp7.Vault_Cute_MP7_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet17_MAT.cute_mp7.Vault_Cute_MP7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet17_MAT.cute_mp7.Vault_Cute_MP7_3P_Pickup_MIC"))
 	Skins.Add((Id=5290, Weapondef=class'KFWeapDef_MP7', MIC_1P=("WEP_SkinSet17_MAT.cute_mp7.Vault_Cute_MP7_1P_FieldTested_MIC", "WEP_SkinSet17_MAT.cute_mp7.Vault_Cute_MP7_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet17_MAT.cute_mp7.Vault_Cute_MP7_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet17_MAT.cute_mp7.Vault_Cute_MP7_3P_Pickup_MIC"))
	Skins.Add((Id=5289, Weapondef=class'KFWeapDef_MP7', MIC_1P=("WEP_SkinSet17_MAT.cute_mp7.Vault_Cute_MP7_1P_BattleScarred_MIC", "WEP_SkinSet17_MAT.cute_mp7.Vault_Cute_MP7_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet17_MAT.cute_mp7.Vault_Cute_MP7_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet17_MAT.cute_mp7.Vault_Cute_MP7_3P_Pickup_MIC"))

//Vault Honorable Death AK12
	Skins.Add((Id=5294, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet17_MAT.horror_ak12.Vault_Horror_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet17_MAT.horror_ak12.Vault_Horror_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet17_MAT.horror_ak12.Vault_Horror_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=5293, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet17_MAT.horror_ak12.Vault_Horror_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet17_MAT.horror_ak12.Vault_Horror_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet17_MAT.horror_ak12.Vault_Horror_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=5292, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet17_MAT.horror_ak12.Vault_Horror_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet17_MAT.horror_ak12.Vault_Horror_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet17_MAT.horror_ak12.Vault_Horror_AK12_3P_Pickup_MIC"))

//Vault Blue Camo Crovel
	Skins.Add((Id=5297, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet17_MAT.military_crovel.Vault_Military_Crovel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet17_MAT.military_crovel.Vault_Military_Crovel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet17_MAT.military_crovel.Vault_Military_Crovel_3P_Pickup_MIC"))
	Skins.Add((Id=5296, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet17_MAT.military_crovel.Vault_Military_Crovel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet17_MAT.military_crovel.Vault_Military_Crovel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet17_MAT.military_crovel.Vault_Military_Crovel_3P_Pickup_MIC"))
	Skins.Add((Id=5295, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet17_MAT.military_crovel.Vault_Military_Crovel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet17_MAT.military_crovel.Vault_Military_Crovel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet17_MAT.military_crovel.Vault_Military_Crovel_3P_Pickup_MIC"))

//Vault Sci Fi Caulk N Burn
	Skins.Add((Id=5300, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet17_MAT.scifi_caulknburn.Vault_SciFi_CaulkNBurn_1P_Mint_MIC"), MIC_3P="WEP_SkinSet17_MAT.scifi_caulknburn.Vault_SciFi_CaulkNBurn_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet17_MAT.scifi_caulknburn.Vault_SciFi_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=5299, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet17_MAT.scifi_caulknburn.Vault_SciFi_CaulkNBurn_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet17_MAT.scifi_caulknburn.Vault_SciFi_CaulkNBurn_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet17_MAT.scifi_caulknburn.Vault_SciFi_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=5298, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet17_MAT.scifi_caulknburn.Vault_SciFi_CaulkNBurn_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet17_MAT.scifi_caulknburn.Vault_SciFi_CaulkNBurn_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet17_MAT.scifi_caulknburn.Vault_SciFi_CaulkNBurn_3P_Pickup_MIC"))

//Vault GG AA12
	Skins.Add((Id=5303, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet17_MAT.sports_aa12.Vault_Sports_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet17_MAT.sports_aa12.Vault_Sports_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet17_MAT.sports_aa12.Vault_Sports_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=5302, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet17_MAT.sports_aa12.Vault_Sports_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet17_MAT.sports_aa12.Vault_Sports_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet17_MAT.sports_aa12.Vault_Sports_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=5301, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet17_MAT.sports_aa12.Vault_Sports_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet17_MAT.sports_aa12.Vault_Sports_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet17_MAT.sports_aa12.Vault_Sports_AA12_3P_Pickup_MIC"))

//Vault Vosh 9MM
	Skins.Add((Id=5379, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.9mm.VaultVosh_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.9mm.VaultVosh_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.9mm.VaultVosh_9mm_3P_Pickup_MIC"))

//Vault Vosh Berserker Knife
	Skins.Add((Id=5380, Weapondef=class'KFWeapDef_Knife_Berserker', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.berserkerknife.VaultVosh_BerserkerKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.berserkerknife.VaultVosh_BerserkerKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.berserkerknife.VaultVosh_BerserkerKnife_3P_Pickup_MIC"))

//Vault Vosh Commando Knife
	Skins.Add((Id=5381, Weapondef=class'KFWeapDef_Knife_Commando', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.commandoknife.VaultVosh_CommandoKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.commandoknife.VaultVosh_CommandoKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.commandoknife.VaultVosh_CommandoKnife_3P_Pickup_MIC"))

//Vault Vosh Demo Knife
	Skins.Add((Id=5382, Weapondef=class'KFWeapDef_Knife_Demo', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.demoknife.VaultVosh_DemoKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.demoknife.VaultVosh_DemoKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.demoknife.VaultVosh_DemoKnife_3P_Pickup_MIC"))

//Vault Vosh Firebug Knife
	Skins.Add((Id=5383, Weapondef=class'KFWeapDef_Knife_Firebug', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.firebugknife.VaultVosh_FireBugKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.firebugknife.VaultVosh_FireBugKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.firebugknife.VaultVosh_FireBugKnife_3P_Pickup_MIC"))

//Vault Vosh Gunslinger Knife
	Skins.Add((Id=5384, Weapondef=class'KFWeapDef_Knife_Gunslinger', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.gunslingerknife.VaultVosh_GunslingerKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.gunslingerknife.VaultVosh_GunslingerKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.gunslingerknife.VaultVosh_GunslingerKnife_3P_Pickup_MIC"))

//Vault Vosh Healer
	Skins.Add((Id=5385, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.Healer.VaultVosh_Healer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.Healer.VaultVosh_Healer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.Healer.VaultVosh_Healer_3P_Pickup_MIC"))

//Vault Vosh Medic Knife
	Skins.Add((Id=5386, Weapondef=class'KFWeapDef_Knife_Medic', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.medicknife.VaultVosh_MedicKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.medicknife.VaultVosh_MedicKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.medicknife.VaultVosh_MedicKnife_3P_Pickup_MIC"))

//Vault Vosh Sharpshooter Knife
	Skins.Add((Id=5387, Weapondef=class'KFWeapDef_Knife_Sharpshooter', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.sharpshooterknife.VaultVosh_SharpshooterKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.sharpshooterknife.VaultVosh_SharpshooterKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.sharpshooterknife.VaultVosh_SharpshooterKnife_3P_Pickup_MIC"))

//Vault Vosh Support Knife
	Skins.Add((Id=5388, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.supportknife.VaultVosh_SupportKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.supportknife.VaultVosh_SupportKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.supportknife.VaultVosh_SupportKnife_3P_Pickup_MIC"))

//Vault Vosh SWAT Knife
	Skins.Add((Id=5389, Weapondef=class'KFWeapDef_Knife_SWAT', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.swatknife.VaultVosh_SwatKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.swatknife.VaultVosh_SwatKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.swatknife.VaultVosh_SwatKnife_3P_Pickup_MIC"))

//Vault Vosh Welder
	Skins.Add((Id=5390, Weapondef=class'KFWeapDef_Welder', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.Welder.VaultVosh_Welder_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.Welder.VaultVosh_Welder_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.Welder.VaultVosh_Welder_3P_Pickup_MIC"))

//Vault Blue Camo Remington 1858
	Skins.Add((Id=5527, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.1858.VaultErdlBlue_1858_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.1858.VaultErdlBlue_1858_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.1858.VaultErdlBlue_1858_3P_Pickup_MIC"))
	Skins.Add((Id=5526, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.1858.VaultErdlBlue_1858_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.1858.VaultErdlBlue_1858_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.1858.VaultErdlBlue_1858_3P_Pickup_MIC"))
	Skins.Add((Id=5525, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.1858.VaultErdlBlue_1858_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.1858.VaultErdlBlue_1858_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.1858.VaultErdlBlue_1858_3P_Pickup_MIC"))

//Vault Blue Camo Winchester 1894
	Skins.Add((Id=5530, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.1894.VaultErdlBlue_1894_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.1894.VaultErdlBlue_1894_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.1894.VaultErdlBlue_1894_3P_Pickup_MIC"))
	Skins.Add((Id=5529, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.1894.VaultErdlBlue_1894_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.1894.VaultErdlBlue_1894_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.1894.VaultErdlBlue_1894_3P_Pickup_MIC"))
	Skins.Add((Id=5528, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.1894.VaultErdlBlue_1894_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.1894.VaultErdlBlue_1894_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.1894.VaultErdlBlue_1894_3P_Pickup_MIC"))

//Vault Blue Camo AR15
	Skins.Add((Id=5533, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.AR15.VaultErdlBlue_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.AR15.VaultErdlBlue_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.AR15.VaultErdlBlue_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=5532, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.AR15.VaultErdlBlue_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.AR15.VaultErdlBlue_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.AR15.VaultErdlBlue_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=5531, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.AR15.VaultErdlBlue_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.AR15.VaultErdlBlue_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.AR15.VaultErdlBlue_AR15_3P_Pickup_MIC"))

//Vault Blue Camo HX25
	Skins.Add((Id=5536, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.hx25.VaultErdlBlue_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.hx25.VaultErdlBlue_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.hx25.VaultErdlBlue_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=5535, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.hx25.VaultErdlBlue_HX25_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.hx25.VaultErdlBlue_HX25_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.hx25.VaultErdlBlue_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=5534, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.hx25.VaultErdlBlue_HX25_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.hx25.VaultErdlBlue_HX25_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.hx25.VaultErdlBlue_HX25_3P_Pickup_MIC"))

//Vault Blue Camo MB500
	Skins.Add((Id=5539, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.MB500.VaultErdlBlue_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.MB500.VaultErdlBlue_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.MB500.VaultErdlBlue_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=5538, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.MB500.VaultErdlBlue_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.MB500.VaultErdlBlue_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.MB500.VaultErdlBlue_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=5537, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.MB500.VaultErdlBlue_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.MB500.VaultErdlBlue_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.MB500.VaultErdlBlue_MB500_3P_Pickup_MIC"))

//Vault Blue Camo Medic Pistol
	Skins.Add((Id=5542, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlBlue_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlBlue_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlBlue_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=5541, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlBlue_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlBlue_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlBlue_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=5540, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlBlue_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlBlue_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlBlue_MedicPistol_3P_Pickup_MIC"))

//Vault Green Camo Medic Pistol
	Skins.Add((Id=5545, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlGreen_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlGreen_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlGreen_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=5544, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlGreen_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlGreen_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlGreen_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=5543, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlGreen_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlGreen_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlGreen_MedicPistol_3P_Pickup_MIC"))

//Vault Orange Camo Medic Pistol
	Skins.Add((Id=5548, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlOrange_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlOrange_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlOrange_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=5547, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlOrange_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlOrange_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlOrange_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=5546, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlOrange_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlOrange_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.medicpistol.VaultErdlOrange_MedicPistol_3P_Pickup_MIC"))

//Vault Blue Camo MP7
	Skins.Add((Id=5551, Weapondef=class'KFWeapDef_MP7', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.mp7.VaultErdlBlue_MP7_1P_Mint_MIC", "WEP_SkinSet_VaultVosh_MAT.mp7.VaultErdlBlue_MP7_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.mp7.VaultErdlBlue_MP7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.mp7.VaultErdlBlue_MP7_3P_Pickup_MIC"))
	Skins.Add((Id=5550, Weapondef=class'KFWeapDef_MP7', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.mp7.VaultErdlBlue_MP7_1P_FieldTested_MIC", "WEP_SkinSet_VaultVosh_MAT.mp7.VaultErdlBlue_MP7_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.mp7.VaultErdlBlue_MP7_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.mp7.VaultErdlBlue_MP7_3P_Pickup_MIC"))
	Skins.Add((Id=5549, Weapondef=class'KFWeapDef_MP7', MIC_1P=("WEP_SkinSet_VaultVosh_MAT.mp7.VaultErdlBlue_MP7_1P_BattleScarred_MIC", "WEP_SkinSet_VaultVosh_MAT.mp7.VaultErdlBlue_MP7_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh_MAT.mp7.VaultErdlBlue_MP7_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh_MAT.mp7.VaultErdlBlue_MP7_3P_Pickup_MIC"))

//Vault Vosh Crovel
	Skins.Add((Id=5652, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet_VaultVosh02_MAT.vosh_crovel.Vault_Vosh_Crovel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh02_MAT.vosh_crovel.Vault_Vosh_Crovel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh02_MAT.vosh_crovel.Vault_Vosh_Crovel_3P_Pickup_MIC"))

//Vault Vosh AR15
	Skins.Add((Id=5657, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet_VaultVosh02_MAT.vosh_ar15.Vault_Vosh_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh02_MAT.vosh_ar15.Vault_Vosh_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh02_MAT.vosh_ar15.Vault_Vosh_AR15_3P_Pickup_MIC"))

//Vault Vosh MB500
	Skins.Add((Id=5656, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet_VaultVosh02_MAT.vosh_mb500.Vault_Vosh_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh02_MAT.vosh_mb500.Vault_Vosh_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh02_MAT.vosh_mb500.Vault_Vosh_MB500_3P_Pickup_MIC"))

//Vault Vosh Medic Pistol
	Skins.Add((Id=5658, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet_VaultVosh02_MAT.vosh_medic_pistol.Vault_Vosh_Medic_Pistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh02_MAT.vosh_medic_pistol.Vault_Vosh_Medic_Pistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh02_MAT.vosh_medic_pistol.Vault_Vosh_Medic_Pistol_3P_Pickup_MIC"))

//Vault Vosh HX25
	Skins.Add((Id=5659, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet_VaultVosh02_MAT.vosh_hx25_pistol.Vault_Vosh_HX25_Pistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh02_MAT.vosh_hx25_pistol.Vault_Vosh_HX25_Pistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh02_MAT.vosh_hx25_pistol.Vault_Vosh_HX25_Pistol_3P_Pickup_MIC"))

//Vault Vosh Caulk Burn
	Skins.Add((Id=5660, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet_VaultVosh02_MAT.vosh_caulkburn.Vault_Vosh_CaulkBurn_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh02_MAT.vosh_caulkburn.Vault_Vosh_CaulkBurn_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh02_MAT.vosh_caulkburn.Vault_Vosh_CaulkBurn_3P_Pickup_MIC"))

//Vault Vosh Remington 1858
	Skins.Add((Id=5661, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet_VaultVosh02_MAT.vosh_remington1858.Vault_Vosh_Remington_1858_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh02_MAT.vosh_remington1858.Vault_Vosh_Remington_1858_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh02_MAT.vosh_remington1858.Vault_Vosh_Remington_1858_3P_Pickup_MIC"))

//Vault Vosh Winchester 1894
	Skins.Add((Id=5662, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet_VaultVosh02_MAT.vosh_winchester1894.Vault_Vosh_Winchester_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh02_MAT.vosh_winchester1894.Vault_Vosh_Winchester_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh02_MAT.vosh_winchester1894.Vault_Vosh_Winchester_3P_Pickup_MIC"))

//Vault Vosh MP7
	Skins.Add((Id=5663, Weapondef=class'KFWeapDef_MP7', MIC_1P=("WEP_SkinSet_VaultVosh02_MAT.vosh_mp7.Vault_Vosh_MP7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh02_MAT.vosh_mp7.Vault_Vosh_MP7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh02_MAT.vosh_mp7.Vault_Vosh_MP7_3P_Pickup_MIC"))

//Black Golden Healer
	Skins.Add((Id=5905, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_healer.BlackGolden_Healer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_healer.BlackGolden_Healer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_healer.BlackGolden_Healer_3P_Pickup_MIC"))
	Skins.Add((Id=5904, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_healer.BlackGolden_Healer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_healer.BlackGolden_Healer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_healer.BlackGolden_Healer_3P_Pickup_MIC"))
	Skins.Add((Id=5903, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_healer.BlackGolden_Healer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_healer.BlackGolden_Healer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_healer.BlackGolden_Healer_3P_Pickup_MIC"))

//Black Golden Welder
	Skins.Add((Id=5908, Weapondef=class'KFWeapDef_Welder', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_welder.BlackGolden_Welder_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_welder.BlackGolden_Welder_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_welder.BlackGolden_Welder_3P_Pickup_MIC"))
	Skins.Add((Id=5907, Weapondef=class'KFWeapDef_Welder', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_welder.BlackGolden_Welder_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_welder.BlackGolden_Welder_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_welder.BlackGolden_Welder_3P_Pickup_MIC"))
	Skins.Add((Id=5906, Weapondef=class'KFWeapDef_Welder', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_welder.BlackGolden_Welder_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_welder.BlackGolden_Welder_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_welder.BlackGolden_Welder_3P_Pickup_MIC"))

//Black Golden Berserker Knife
	Skins.Add((Id=5911, Weapondef=class'KFWeapDef_Knife_Berserker', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_berserkerknife.BlackGolden_BerserkerKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_berserkerknife.BlackGolden_BerserkerKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_berserkerknife.BlackGolden_BerserkerKnife_3P_Pickup_MIC"))
	Skins.Add((Id=5910, Weapondef=class'KFWeapDef_Knife_Berserker', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_berserkerknife.BlackGolden_BerserkerKnife_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_berserkerknife.BlackGolden_BerserkerKnife_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_berserkerknife.BlackGolden_BerserkerKnife_3P_Pickup_MIC"))
	Skins.Add((Id=5909, Weapondef=class'KFWeapDef_Knife_Berserker', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_berserkerknife.BlackGolden_BerserkerKnife_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_berserkerknife.BlackGolden_BerserkerKnife_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_berserkerknife.BlackGolden_BerserkerKnife_3P_Pickup_MIC"))

//Black Golden Katana
	Skins.Add((Id=5914, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_katana.BlackGolden_Katana_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_katana.BlackGolden_Katana_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_katana.BlackGolden_Katana_3P_Pickup_MIC"))
	Skins.Add((Id=5913, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_katana.BlackGolden_Katana_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_katana.BlackGolden_Katana_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_katana.BlackGolden_Katana_3P_Pickup_MIC"))
	Skins.Add((Id=5912, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_katana.BlackGolden_Katana_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_katana.BlackGolden_Katana_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_katana.BlackGolden_Katana_3P_Pickup_MIC"))

//Black Golden Sawblade
	Skins.Add((Id=5917, Weapondef=class'KFWeapDef_Eviscerator', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_sawblade.BlackGolden_Sawblade_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_sawblade.BlackGolden_Sawblade_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_sawblade.BlackGolden_Sawblade_3P_Pickup_MIC"))
	Skins.Add((Id=5916, Weapondef=class'KFWeapDef_Eviscerator', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_sawblade.BlackGolden_Sawblade_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_sawblade.BlackGolden_Sawblade_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_sawblade.BlackGolden_Sawblade_3P_Pickup_MIC"))
	Skins.Add((Id=5915, Weapondef=class'KFWeapDef_Eviscerator', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_sawblade.BlackGolden_Sawblade_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_sawblade.BlackGolden_Sawblade_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_sawblade.BlackGolden_Sawblade_3P_Pickup_MIC"))

//Black Golden Zweihander
	Skins.Add((Id=5920, Weapondef=class'KFWeapDef_Zweihander', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_zweihander.BlackGolden_Zweihander_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_zweihander.BlackGolden_Zweihander_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_zweihander.BlackGolden_Zweihander_3P_Pickup_MIC"))
	Skins.Add((Id=5919, Weapondef=class'KFWeapDef_Zweihander', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_zweihander.BlackGolden_Zweihander_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_zweihander.BlackGolden_Zweihander_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_zweihander.BlackGolden_Zweihander_3P_Pickup_MIC"))
	Skins.Add((Id=5918, Weapondef=class'KFWeapDef_Zweihander', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_zweihander.BlackGolden_Zweihander_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_zweihander.BlackGolden_Zweihander_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_zweihander.BlackGolden_Zweihander_3P_Pickup_MIC"))

//Black Golden Pulverizer
	Skins.Add((Id=5923, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_pulverizer.BlackGolden_Pulverizer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_pulverizer.BlackGolden_Pulverizer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_pulverizer.BlackGolden_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=5922, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_pulverizer.BlackGolden_Pulverizer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_pulverizer.BlackGolden_Pulverizer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_pulverizer.BlackGolden_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=5921, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_pulverizer.BlackGolden_Pulverizer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_pulverizer.BlackGolden_Pulverizer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_pulverizer.BlackGolden_Pulverizer_3P_Pickup_MIC"))

//Black Golden Crovel
	Skins.Add((Id=5926, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_crovel.BlackGolden_Crovel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_crovel.BlackGolden_Crovel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_crovel.BlackGolden_Crovel_3P_Pickup_MIC"))
	Skins.Add((Id=5925, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_crovel.BlackGolden_Crovel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_crovel.BlackGolden_Crovel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_crovel.BlackGolden_Crovel_3P_Pickup_MIC"))
	Skins.Add((Id=5924, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_crovel.BlackGolden_Crovel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_crovel.BlackGolden_Crovel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_crovel.BlackGolden_Crovel_3P_Pickup_MIC"))

//Black Golden 9MM
	Skins.Add((Id=5929, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_9mm.BlackGolden_9MM_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_9mm.BlackGolden_9MM_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_9mm.BlackGolden_9MM_3P_Pickup_MIC"))
	Skins.Add((Id=5928, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_9mm.BlackGolden_9MM_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_9mm.BlackGolden_9MM_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_9mm.BlackGolden_9MM_3P_Pickup_MIC"))
	Skins.Add((Id=5927, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_9mm.BlackGolden_9MM_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_9mm.BlackGolden_9MM_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_9mm.BlackGolden_9MM_3P_Pickup_MIC"))

//Black Golden Nailgun
	Skins.Add((Id=5932, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_nailshotgun.BlackGolden_NailShotgun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_nailshotgun.BlackGolden_NailShotgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_nailshotgun.BlackGolden_NailShotgun_3P_Pickup_MIC"))
	Skins.Add((Id=5931, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_nailshotgun.BlackGolden_NailShotgun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_nailshotgun.BlackGolden_NailShotgun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_nailshotgun.BlackGolden_NailShotgun_3P_Pickup_MIC"))
	Skins.Add((Id=5930, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet18_MAT.blackgolden_nailshotgun.BlackGolden_NailShotgun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.blackgolden_nailshotgun.BlackGolden_NailShotgun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.blackgolden_nailshotgun.BlackGolden_NailShotgun_3P_Pickup_MIC"))

//Heirloom Dragonsbreath
	Skins.Add((Id=5935, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet18_MAT.heirloom_dragonsbreath.Heirloom_Dragonsbreath_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_dragonsbreath.Heirloom_Dragonsbreath_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_dragonsbreath.Heirloom_Dragonsbreath_3P_Pickup_MIC"))
	Skins.Add((Id=5934, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet18_MAT.heirloom_dragonsbreath.Heirloom_Dragonsbreath_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_dragonsbreath.Heirloom_Dragonsbreath_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_dragonsbreath.Heirloom_Dragonsbreath_3P_Pickup_MIC"))
	Skins.Add((Id=5933, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet18_MAT.heirloom_dragonsbreath.Heirloom_Dragonsbreath_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_dragonsbreath.Heirloom_Dragonsbreath_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_dragonsbreath.Heirloom_Dragonsbreath_3P_Pickup_MIC"))

//Heirloom Flaregun
	Skins.Add((Id=5938, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet18_MAT.heirloom_spitfire.Heirloom_Spitfire_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_spitfire.Heirloom_Spitfire_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_spitfire.Heirloom_Spitfire_3P_Pickup_MIC"))
	Skins.Add((Id=5937, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet18_MAT.heirloom_spitfire.Heirloom_Spitfire_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_spitfire.Heirloom_Spitfire_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_spitfire.Heirloom_Spitfire_3P_Pickup_MIC"))
	Skins.Add((Id=5936, Weapondef=class'KFWeapDef_FlareGun', MIC_1P=("WEP_SkinSet18_MAT.heirloom_spitfire.Heirloom_Spitfire_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_spitfire.Heirloom_Spitfire_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_spitfire.Heirloom_Spitfire_3P_Pickup_MIC"))

//Heirloom M1911
	Skins.Add((Id=5941, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet18_MAT.heirloom_m1911.Heirloom_M1911_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_m1911.Heirloom_M1911_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_m1911.Heirloom_M1911_3P_Pickup_MIC"))
	Skins.Add((Id=5940, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet18_MAT.heirloom_m1911.Heirloom_M1911_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_m1911.Heirloom_M1911_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_m1911.Heirloom_M1911_3P_Pickup_MIC"))
	Skins.Add((Id=5939, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet18_MAT.heirloom_m1911.Heirloom_M1911_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_m1911.Heirloom_M1911_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_m1911.Heirloom_M1911_3P_Pickup_MIC"))

//Heirloom Remington 1858
	Skins.Add((Id=5944, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet18_MAT.heirloom_remington1858.Heirloom_Remington1858_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_remington1858.Heirloom_Remington1858_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_remington1858.Heirloom_Remington1858_3P_Pickup_MIC"))
	Skins.Add((Id=5943, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet18_MAT.heirloom_remington1858.Heirloom_Remington1858_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_remington1858.Heirloom_Remington1858_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_remington1858.Heirloom_Remington1858_3P_Pickup_MIC"))
	Skins.Add((Id=5942, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet18_MAT.heirloom_remington1858.Heirloom_Remington1858_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_remington1858.Heirloom_Remington1858_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_remington1858.Heirloom_Remington1858_3P_Pickup_MIC"))

//Heirloom RPG
	Skins.Add((Id=5947, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet18_MAT.heirloom_rpg7.Heirloom_RPG7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_rpg7.Heirloom_RPG7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_rpg7.Heirloom_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=5946, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet18_MAT.heirloom_rpg7.Heirloom_RPG7_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_rpg7.Heirloom_RPG7_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_rpg7.Heirloom_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=5945, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet18_MAT.heirloom_rpg7.Heirloom_RPG7_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_rpg7.Heirloom_RPG7_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_rpg7.Heirloom_RPG7_3P_Pickup_MIC"))

//Heirloom Winchester 1894
	Skins.Add((Id=5950, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet18_MAT.heirloom_winchester1894.Heirloom_Winchester1894_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_winchester1894.Heirloom_Winchester1894_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_winchester1894.Heirloom_Winchester1894_3P_Pickup_MIC"))
	Skins.Add((Id=5949, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet18_MAT.heirloom_winchester1894.Heirloom_Winchester1894_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_winchester1894.Heirloom_Winchester1894_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_winchester1894.Heirloom_Winchester1894_3P_Pickup_MIC"))
	Skins.Add((Id=5948, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet18_MAT.heirloom_winchester1894.Heirloom_Winchester1894_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.heirloom_winchester1894.Heirloom_Winchester1894_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.heirloom_winchester1894.Heirloom_Winchester1894_3P_Pickup_MIC"))

//Precious HK UMP
	Skins.Add((Id=5951, Weapondef=class'KFWeapDef_HK_UMP', MIC_1P=("WEP_SkinSet18_MAT.precious_hk_ump.Precious_HK_UMP_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.precious_hk_ump.Precious_HK_UMP_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.precious_hk_ump.Precious_HK_UMP_3P_Pickup_MIC"))

//Precious Husk Cannon
	Skins.Add((Id=5952, Weapondef=class'KFWeapDef_HuskCannon', MIC_1P=("WEP_SkinSet18_MAT.precious_huskcannon.Precious_HuskCannon_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.precious_huskcannon.Precious_HuskCannon_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.precious_huskcannon.Precious_HuskCannon_3P_Pickup_MIC"))

//Precious Hemogoblin
	Skins.Add((Id=5953, Weapondef=class'KFWeapDef_Hemogoblin', MIC_1P=("WEP_SkinSet18_MAT.precious_bleeder.Precious_Bleeder_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.precious_bleeder.Precious_Bleeder_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.precious_bleeder.Precious_Bleeder_3P_Pickup_MIC"))

//Precious Seeker Six
	Skins.Add((Id=5954, Weapondef=class'KFWeapDef_Seeker6', MIC_1P=("WEP_SkinSet18_MAT.precious_seekersix.Precious_SeekerSix_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.precious_seekersix.Precious_SeekerSix_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.precious_seekersix.Precious_SeekerSix_3P_Pickup_MIC"))

//Precious AF2011
	Skins.Add((Id=5955, Weapondef=class'KFWeapDef_AF2011', MIC_1P=("WEP_SkinSet18_MAT.precious_af2001.Precious_AF2001_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.precious_af2001.Precious_AF2001_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.precious_af2001.Precious_AF2001_3P_Pickup_MIC"))

//Precious Mac 10
	Skins.Add((Id=5956, Weapondef=class'KFWeapDef_Mac10', MIC_1P=("WEP_SkinSet18_MAT.precious_mac10.Precious_MAC10_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.precious_mac10.Precious_MAC10_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.precious_mac10.Precious_MAC10_3P_Pickup_MIC"))

//Vietnam Stoner 63A
	Skins.Add((Id=5959, Weapondef=class'KFWeapDef_Stoner63A', MIC_1P=("WEP_SkinSet18_MAT.vietnam_stoner.Vietnam_Stoner_Lower_1P_Mint_MIC", "WEP_SkinSet18_MAT.vietnam_stoner.Vietnam_Stoner_Upper_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.vietnam_stoner.Vietnam_Stoner_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.vietnam_stoner.Vietnam_Stoner_3P_Pickup_MIC"))
	Skins.Add((Id=5958, Weapondef=class'KFWeapDef_Stoner63A', MIC_1P=("WEP_SkinSet18_MAT.vietnam_stoner.Vietnam_Stoner_Lower_1P_FieldTested_MIC", "WEP_SkinSet18_MAT.vietnam_stoner.Vietnam_Stoner_Upper_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.vietnam_stoner.Vietnam_Stoner_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.vietnam_stoner.Vietnam_Stoner_3P_Pickup_MIC"))
	Skins.Add((Id=5957, Weapondef=class'KFWeapDef_Stoner63A', MIC_1P=("WEP_SkinSet18_MAT.vietnam_stoner.Vietnam_Stoner_Lower_1P_BattleScarred_MIC", "WEP_SkinSet18_MAT.vietnam_stoner.Vietnam_Stoner_Upper_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.vietnam_stoner.Vietnam_Stoner_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.vietnam_stoner.Vietnam_Stoner_3P_Pickup_MIC"))

//Junkyard Boomstick
	Skins.Add((Id=5962, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet18_MAT.junkyard_boomstick.Junkyard_Boomstick_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.junkyard_boomstick.Junkyard_Boomstick_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.junkyard_boomstick.Junkyard_Boomstick_3P_Pickup_MIC"))
	Skins.Add((Id=5961, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet18_MAT.junkyard_boomstick.Junkyard_Boomstick_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.junkyard_boomstick.Junkyard_Boomstick_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.junkyard_boomstick.Junkyard_Boomstick_3P_Pickup_MIC"))
	Skins.Add((Id=5960, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet18_MAT.junkyard_boomstick.Junkyard_Boomstick_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.junkyard_boomstick.Junkyard_Boomstick_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.junkyard_boomstick.Junkyard_Boomstick_3P_Pickup_MIC"))

//Horzine Elite White Medic Assault
	Skins.Add((Id=5965, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicAssault_1P_Mint_MIC", "WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicAssault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=5964, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicAssault_1P_FieldTested_MIC", "WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicAssault_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=5963, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicAssault_1P_BattleScarred_MIC", "WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicAssault_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicAssault_3P_Pickup_MIC"))

//Horzine Elite Black Medic Assault
	Skins.Add((Id=5968, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicAssault_1P_Mint_MIC", "WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicAssault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=5967, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicAssault_1P_FieldTested_MIC", "WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicAssault_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=5966, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicAssault_1P_BattleScarred_MIC", "WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicAssault_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicAssault_3P_Pickup_MIC"))

//Horzine Elite Blue Medic Assault
	Skins.Add((Id=5971, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicAssault_1P_Mint_MIC", "WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicAssault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=5970, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicAssault_1P_FieldTested_MIC", "WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicAssault_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=5969, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicAssault_1P_BattleScarred_MIC", "WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicAssault_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicAssault_3P_Pickup_MIC"))

//Horzine Elite Green Medic Assault
	Skins.Add((Id=5974, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicAssault_1P_Mint_MIC", "WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicAssault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=5973, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicAssault_1P_FieldTested_MIC", "WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicAssault_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=5972, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicAssault_1P_BattleScarred_MIC", "WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicAssault_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicAssault_3P_Pickup_MIC"))

//Horzine Elite Red Medic Assault
	Skins.Add((Id=5977, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicAssault_1P_Mint_MIC", "WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicAssault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=5976, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicAssault_1P_FieldTested_MIC", "WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicAssault_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicAssault_3P_Pickup_MIC"))
	Skins.Add((Id=5975, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicAssault_1P_BattleScarred_MIC", "WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicAssault_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicAssault_3P_Pickup_MIC"))

//Vault Vosh C4
	Skins.Add((Id=6002, Weapondef=class'KFWeapDef_C4', MIC_1P=("WEP_SkinSet_VaultVosh03_MAT.vosh_c4.Vault_Vosh_C4_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh03_MAT.vosh_c4.Vault_Vosh_C4_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh03_MAT.vosh_c4.Vault_Vosh_C4_3P_Pickup_MIC"))

//Vault Vosh Crossbow
	Skins.Add((Id=6003, Weapondef=class'KFWeapDef_Crossbow', MIC_1P=("WEP_SkinSet_VaultVosh03_MAT.vosh_crossbow.Vault_Vosh_Crossbow_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh03_MAT.vosh_crossbow.Vault_Vosh_Crossbow_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh03_MAT.vosh_crossbow.Vault_Vosh_Crossbow_3P_Pickup_MIC"))

//Vault Vosh Boomstick
	Skins.Add((Id=6004, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet_VaultVosh03_MAT.vosh_double_barrell.Vault_Vosh_Double_Barrel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh03_MAT.vosh_double_barrell.Vault_Vosh_Double_Barrel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh03_MAT.vosh_double_barrell.Vault_Vosh_Double_Barrel_3P_Pickup_MIC"))

//Vault Vosh Dragonsbreath
	Skins.Add((Id=6005, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet_VaultVosh03_MAT.vosh_dragonsbreath.Vault_Vosh_DragonsBreath_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh03_MAT.vosh_dragonsbreath.Vault_Vosh_DragonsBreath_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh03_MAT.vosh_dragonsbreath.Vault_Vosh_DragonsBreath_3P_Pickup_MIC"))

//Vault Vosh L85A2
	Skins.Add((Id=6006, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet_VaultVosh03_MAT.vosh_l85a2.Vault_Vosh_L85A2_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh03_MAT.vosh_l85a2.Vault_Vosh_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh03_MAT.vosh_l85a2.Vault_Vosh_L85A2_3P_Pickup_MIC"))

//Vault Vosh M1911
	Skins.Add((Id=6007, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet_VaultVosh03_MAT.vosh_m1911.Vault_Vosh_M1911_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh03_MAT.vosh_m1911.Vault_Vosh_M1911_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh03_MAT.vosh_m1911.Vault_Vosh_M1911_3P_Pickup_MIC"))

//Vault Vosh Medic SMG
	Skins.Add((Id=6008, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet_VaultVosh02_MAT.vosh_medic_pistol.Vault_Vosh_Medic_Pistol_1P_Mint_MIC", "WEP_SkinSet_VaultVosh03_MAT.vosh_medic_smg.Vault_Vosh_Medic_SMG_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh03_MAT.vosh_medic_smg.Vault_Vosh_Medic_SMG_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh03_MAT.vosh_medic_smg.Vault_Vosh_Medic_SMG_3P_Pickup_MIC"))

//Vault Vosh MP5RAS
	Skins.Add((Id=6009, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet_VaultVosh03_MAT.vosh_mp5ras.Vault_Vosh_MP5RAS_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh03_MAT.vosh_mp5ras.Vault_Vosh_MP5RAS_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh03_MAT.vosh_mp5ras.Vault_Vosh_MP5RAS_3P_Pickup_MIC"))

//Vault Vosh Nailgun
	Skins.Add((Id=6010, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet_VaultVosh03_MAT.vosh_nailgun.Vault_Vosh_Nail_Shotgun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh03_MAT.vosh_nailgun.Vault_Vosh_Nail_Shotgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh03_MAT.vosh_nailgun.Vault_Vosh_Nail_Shotgun_3P_Pickup_MIC"))

//Prestige Berserker Knife
	Skins.Add((Id=6011, Weapondef=class'KFWeapDef_Knife_Berserker', MIC_1P=("WEP_SkinSet_Prestige01_MAT.knives.Prestige_Berserker_Knife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Berserker_Knife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Berserker_Knife_3P_Pickup_MIC"))

//Prestige Commando Knife
	Skins.Add((Id=6012, Weapondef=class'KFWeapDef_Knife_Commando', MIC_1P=("WEP_SkinSet_Prestige01_MAT.knives.Prestige_Commando_Knife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Commando_Knife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Commando_Knife_3P_Pickup_MIC"))

//Prestige Demo Knife
	Skins.Add((Id=6013, Weapondef=class'KFWeapDef_Knife_Demo', MIC_1P=("WEP_SkinSet_Prestige01_MAT.knives.Prestige_Demo_Knife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Demo_Knife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Demo_Knife_3P_Pickup_MIC"))

//Prestige Firebug Knife
	Skins.Add((Id=6014, Weapondef=class'KFWeapDef_Knife_Firebug', MIC_1P=("WEP_SkinSet_Prestige01_MAT.knives.Prestige_Firebug_Knife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Firebug_Knife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Firebug_Knife_3P_Pickup_MIC"))

//Prestige Gunslinger Knife
	Skins.Add((Id=6015, Weapondef=class'KFWeapDef_Knife_Gunslinger', MIC_1P=("WEP_SkinSet_Prestige01_MAT.knives.Prestige_Gunslinger_Knife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Gunslinger_Knife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Gunslinger_Knife_3P_Pickup_MIC"))

//Prestige Medic Knife
	Skins.Add((Id=6016, Weapondef=class'KFWeapDef_Knife_Medic', MIC_1P=("WEP_SkinSet_Prestige01_MAT.knives.Prestige_Medic_Knife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Medic_Knife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Medic_Knife_3P_Pickup_MIC"))

//Prestige Sharpshooter Knife
	Skins.Add((Id=6017, Weapondef=class'KFWeapDef_Knife_Sharpshooter', MIC_1P=("WEP_SkinSet_Prestige01_MAT.knives.Prestige_Sharpshooter_Knife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Sharpshooter_Knife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Sharpshooter_Knife_3P_Pickup_MIC"))

//Prestige Support Knife
	Skins.Add((Id=6018, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet_Prestige01_MAT.knives.Prestige_Support_Knife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Support_Knife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Support_Knife_3P_Pickup_MIC"))

//Prestige SWAT Knife
	Skins.Add((Id=6019, Weapondef=class'KFWeapDef_Knife_SWAT', MIC_1P=("WEP_SkinSet_Prestige01_MAT.knives.Prestige_SWAT_Knife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige01_MAT.knives.Prestige_SWAT_Knife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige01_MAT.knives.Prestige_SWAT_Knife_3P_Pickup_MIC"))

//Prestige Survivalist Knife
	Skins.Add((Id=6029, Weapondef=class'KFWeapDef_Knife_Survivalist', MIC_1P=("WEP_SkinSet_Prestige01_MAT.knives.Prestige_Survivalist_Knife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Survivalist_Knife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige01_MAT.knives.Prestige_Survivalist_Knife_3P_Pickup_MIC"))

//Neon AA12
    Skins.Add((Id=6053, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet20_MAT.neon_aa12.Neon_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_aa12.Neon_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_aa12.Neon_AA12_3P_Pickup_MIC")) 
    Skins.Add((Id=6052, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet20_MAT.neon_aa12.Neon_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_aa12.Neon_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_aa12.Neon_AA12_3P_Pickup_MIC")) 
    Skins.Add((Id=6051, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet20_MAT.neon_aa12.Neon_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_aa12.Neon_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_aa12.Neon_AA12_3P_Pickup_MIC")) 

//Neon Flamethrower
    Skins.Add((Id=6056, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet20_MAT.neon_flamethrower.Neon_Flamethrower_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_flamethrower.Neon_Flamethrower_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_flamethrower.Neon_Flamethrower_3P_Pickup_MIC")) 
    Skins.Add((Id=6055, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet20_MAT.neon_flamethrower.Neon_Flamethrower_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_flamethrower.Neon_Flamethrower_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_flamethrower.Neon_Flamethrower_3P_Pickup_MIC")) 
    Skins.Add((Id=6054, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet20_MAT.neon_flamethrower.Neon_Flamethrower_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_flamethrower.Neon_Flamethrower_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_flamethrower.Neon_Flamethrower_3P_Pickup_MIC")) 

//Neon Hemoglobin
    Skins.Add((Id=6059, Weapondef=class'KFWeapDef_Hemogoblin', MIC_1P=("WEP_SkinSet20_MAT.neon_bleeder.Neon_Bleeder_1P_Mint_MIC", "WEP_SkinSet20_MAT.neon_bleeder.Neon_Bleeder_sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_bleeder.Neon_Bleeder_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_bleeder.Neon_Bleeder_3P_Pickup_MIC")) 
    Skins.Add((Id=6058, Weapondef=class'KFWeapDef_Hemogoblin', MIC_1P=("WEP_SkinSet20_MAT.neon_bleeder.Neon_Bleeder_1P_FieldTested_MIC", "WEP_SkinSet20_MAT.neon_bleeder.Neon_Bleeder_Sight_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_bleeder.Neon_Bleeder_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_bleeder.Neon_Bleeder_3P_Pickup_MIC")) 
    Skins.Add((Id=6057, Weapondef=class'KFWeapDef_Hemogoblin', MIC_1P=("WEP_SkinSet20_MAT.neon_bleeder.Neon_Bleeder_1P_BattleScarred_MIC", "WEP_SkinSet20_MAT.neon_bleeder.Neon_Bleeder_Sight_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_bleeder.Neon_Bleeder_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_bleeder.Neon_Bleeder_3P_Pickup_MIC")) 

//Neon M14EBR
    Skins.Add((Id=6062, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet20_MAT.neon_m14ebr.Neon_M14EBR_1P_Mint_MIC", "WEP_SkinSet20_MAT.neon_m14ebr.Neon_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_m14ebr.Neon_M14EBR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_m14ebr.Neon_M14EBR_3P_Pickup_MIC")) 
    Skins.Add((Id=6061, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet20_MAT.neon_m14ebr.Neon_M14EBR_1P_FieldTested_MIC", "WEP_SkinSet20_MAT.neon_m14ebr.Neon_M14EBR_Scope_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_m14ebr.Neon_M14EBR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_m14ebr.Neon_M14EBR_3P_Pickup_MIC")) 
    Skins.Add((Id=6060, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet20_MAT.neon_m14ebr.Neon_M14EBR_1P_BattleScarred_MIC", "WEP_SkinSet20_MAT.neon_m14ebr.Neon_M14EBR_Scope_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_m14ebr.Neon_M14EBR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_m14ebr.Neon_M14EBR_3P_Pickup_MIC")) 

//Neon Microwave Gun
    Skins.Add((Id=6065, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet20_MAT.neon_microwavegun.Neon_Microwavegun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_microwavegun.Neon_Microwavegun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_microwavegun.Neon_Microwavegun_3P_Pickup_MIC")) 
    Skins.Add((Id=6064, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet20_MAT.neon_microwavegun.Neon_Microwavegun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_microwavegun.Neon_Microwavegun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_microwavegun.Neon_Microwavegun_3P_Pickup_MIC")) 
    Skins.Add((Id=6063, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet20_MAT.neon_microwavegun.Neon_Microwavegun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_microwavegun.Neon_Microwavegun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_microwavegun.Neon_Microwavegun_3P_Pickup_MIC")) 

//Neon Seeker Six
    Skins.Add((Id=6068, Weapondef=class'KFWeapDef_Seeker6', MIC_1P=("WEP_SkinSet20_MAT.neon_seekersix.Neon_SeekerSix_1P_Mint_MIC", "WEP_SkinSet20_MAT.neon_seekersix.Neon_SeekerSix_Sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_seekersix.Neon_SeekerSix_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_seekersix.Neon_SeekerSix_3P_Pickup_MIC")) 
    Skins.Add((Id=6067, Weapondef=class'KFWeapDef_Seeker6', MIC_1P=("WEP_SkinSet20_MAT.neon_seekersix.Neon_SeekerSix_1P_FieldTested_MIC", "WEP_SkinSet20_MAT.neon_seekersix.Neon_SeekerSix_Sight_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_seekersix.Neon_SeekerSix_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_seekersix.Neon_SeekerSix_3P_Pickup_MIC")) 
    Skins.Add((Id=6066, Weapondef=class'KFWeapDef_Seeker6', MIC_1P=("WEP_SkinSet20_MAT.neon_seekersix.Neon_SeekerSix_1P_BattleScarred_MIC", "WEP_SkinSet20_MAT.neon_seekersix.Neon_SeekerSix_Sight_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_seekersix.Neon_SeekerSix_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_seekersix.Neon_SeekerSix_3P_Pickup_MIC")) 

//Neon Stoner 63A
    Skins.Add((Id=6071, Weapondef=class'KFWeapDef_Stoner63a', MIC_1P=("WEP_SkinSet20_MAT.neon_stoner63a.Neon_Stoner63a_1P_Mint_MIC", "WEP_SkinSet20_MAT.neon_stoner63a.Neon_Stoner63a_Upper_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_stoner63a.Neon_Stoner63a_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_stoner63a.Neon_Stoner63a_3P_Pickup_MIC")) 
    Skins.Add((Id=6070, Weapondef=class'KFWeapDef_Stoner63a', MIC_1P=("WEP_SkinSet20_MAT.neon_stoner63a.Neon_Stoner63a_1P_FieldTested_MIC", "WEP_SkinSet20_MAT.neon_stoner63a.Neon_Stoner63a_Upper_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_stoner63a.Neon_Stoner63a_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_stoner63a.Neon_Stoner63a_3P_Pickup_MIC")) 
    Skins.Add((Id=6069, Weapondef=class'KFWeapDef_Stoner63a', MIC_1P=("WEP_SkinSet20_MAT.neon_stoner63a.Neon_Stoner63a_1P_BattleScarred_MIC", "WEP_SkinSet20_MAT.neon_stoner63a.Neon_Stoner63a_Upper_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_stoner63a.Neon_Stoner63a_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_stoner63a.Neon_Stoner63a_3P_Pickup_MIC")) 

//Neon Heckler & Koch UMP
    Skins.Add((Id=6074, Weapondef=class'KFWeapDef_HK_UMP', MIC_1P=("WEP_SkinSet20_MAT.neon_hk_ump.Neon_HK_UMP_1P_Mint_MIC", "WEP_SkinSet20_MAT.neon_hk_ump.Neon_HK_UMP_Sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_hk_ump.Neon_HK_UMP_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_hk_ump.Neon_HK_UMP_3P_Pickup_MIC")) 
    Skins.Add((Id=6073, Weapondef=class'KFWeapDef_HK_UMP', MIC_1P=("WEP_SkinSet20_MAT.neon_hk_ump.Neon_HK_UMP_1P_FieldTested_MIC", "WEP_SkinSet20_MAT.neon_hk_ump.Neon_HK_UMP_Sight_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_hk_ump.Neon_HK_UMP_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_hk_ump.Neon_HK_UMP_3P_Pickup_MIC")) 
    Skins.Add((Id=6072, Weapondef=class'KFWeapDef_HK_UMP', MIC_1P=("WEP_SkinSet20_MAT.neon_hk_ump.Neon_HK_UMP_1P_BattleScarred_MIC", "WEP_SkinSet20_MAT.neon_hk_ump.Neon_HK_UMP_Sight_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet20_MAT.neon_hk_ump.Neon_HK_UMP_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neon_hk_ump.Neon_HK_UMP_3P_Pickup_MIC")) 

//Neon RGB AA12
    Skins.Add((Id=6177, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet20_MAT.neonrgb_aa12.NeonRGB_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neonrgb_aa12.NeonRGB_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neonrgb_aa12.NeonRGB_AA12_3P_Pickup_MIC")) 

//Neon RGB Flamethrower
    Skins.Add((Id=6178, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet20_MAT.neonrgb_flamethrower.NeonRGB_Flamethrower_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neonrgb_flamethrower.NeonRGB_Flamethrower_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neonrgb_flamethrower.NeonRGB_Flamethrower_3P_Pickup_MIC")) 

//Neon RGB Hemoglobin
    Skins.Add((Id=6179, Weapondef=class'KFWeapDef_Hemogoblin', MIC_1P=("WEP_SkinSet20_MAT.neonrgb_bleeder.NeonRGB_Bleeder_1P_Mint_MIC", "WEP_SkinSet20_MAT.neonrgb_bleeder.NeonRGB_Bleeder_sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neonrgb_bleeder.NeonRGB_Bleeder_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neonrgb_bleeder.NeonRGB_Bleeder_3P_Pickup_MIC")) 

//Neon RGB M14EBR
    Skins.Add((Id=6180, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet20_MAT.neonrgb_m14ebr.NeonRGB_M14EBR_1P_Mint_MIC", "WEP_SkinSet20_MAT.neonrgb_m14ebr.NeonRGB_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neonrgb_m14ebr.NeonRGB_M14EBR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neonrgb_m14ebr.NeonRGB_M14EBR_3P_Pickup_MIC")) 

//Neon RGB Microwave Gun
    Skins.Add((Id=6182, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet20_MAT.neonrgb_microwavegun.NeonRGB_Microwavegun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neonrgb_microwavegun.NeonRGB_Microwavegun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neonrgb_microwavegun.NeonRGB_Microwavegun_3P_Pickup_MIC")) 

//Neon RGB Seeker Six
    Skins.Add((Id=6181, Weapondef=class'KFWeapDef_Seeker6', MIC_1P=("WEP_SkinSet20_MAT.neonrgb_seekersix.NeonRGB_SeekerSix_1P_Mint_MIC", "WEP_SkinSet20_MAT.neonrgb_seekersix.NeonRGB_SeekerSix_Sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neonrgb_seekersix.NeonRGB_SeekerSix_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neonrgb_seekersix.NeonRGB_SeekerSix_3P_Pickup_MIC")) 

//Neon RGB Stoner 63A
    Skins.Add((Id=6184, Weapondef=class'KFWeapDef_Stoner63a', MIC_1P=("WEP_SkinSet20_MAT.neonrgb_stoner63a.NeonRGB_Stoner63a_1P_Mint_MIC", "WEP_SkinSet20_MAT.neonrgb_stoner63a.NeonRGB_Stoner63a_Upper_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neonrgb_stoner63a.NeonRGB_Stoner63a_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neonrgb_stoner63a.NeonRGB_Stoner63a_3P_Pickup_MIC")) 

//Neon RGB Heckler & Koch UMP
    Skins.Add((Id=6183, Weapondef=class'KFWeapDef_HK_UMP', MIC_1P=("WEP_SkinSet20_MAT.neonrgb_hk_ump.NeonRGB_HK_UMP_1P_Mint_MIC", "WEP_SkinSet20_MAT.neonrgb_hk_ump.NeonRGB_HK_UMP_Sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet20_MAT.neonrgb_hk_ump.NeonRGB_HK_UMP_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet20_MAT.neonrgb_hk_ump.NeonRGB_HK_UMP_3P_Pickup_MIC")) 

//Bluefire AK12
    Skins.Add((Id=6092, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("wep_skinset19_mat.bluefire_ak12.Bluefire_AK12_1P_Mint_MIC", "wep_skinset19_mat.bluefire_ak12.Bluefire_AK12_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_ak12.Bluefire_AK12_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_ak12.Bluefire_AK12_3P_Pickup_MIC")) 
    Skins.Add((Id=6091, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("wep_skinset19_mat.bluefire_ak12.Bluefire_AK12_1P_FieldTested_MIC", "wep_skinset19_mat.bluefire_ak12.Bluefire_AK12_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_ak12.Bluefire_AK12_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_ak12.Bluefire_AK12_3P_Pickup_MIC")) 
    Skins.Add((Id=6090, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("wep_skinset19_mat.bluefire_ak12.Bluefire_AK12_1P_BattleScarred_MIC", "wep_skinset19_mat.bluefire_ak12.Bluefire_AK12_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_ak12.Bluefire_AK12_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_ak12.Bluefire_AK12_3P_Pickup_MIC")) 

//Bluefire Centerfire
    Skins.Add((Id=6095, Weapondef=class'KFWeapDef_CenterfireMB464', MIC_1P=("wep_skinset19_mat.bluefire_centerfire.Bluefire_Centerfire_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_centerfire.Bluefire_Centerfire_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_centerfire.Bluefire_Centerfire_3P_Pickup_MIC")) 
    Skins.Add((Id=6094, Weapondef=class'KFWeapDef_CenterfireMB464', MIC_1P=("wep_skinset19_mat.bluefire_centerfire.Bluefire_Centerfire_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.bluefire_centerfire.Bluefire_Centerfire_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_centerfire.Bluefire_Centerfire_3P_Pickup_MIC")) 
    Skins.Add((Id=6093, Weapondef=class'KFWeapDef_CenterfireMB464', MIC_1P=("wep_skinset19_mat.bluefire_centerfire.Bluefire_Centerfire_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.bluefire_centerfire.Bluefire_Centerfire_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_centerfire.Bluefire_Centerfire_3P_Pickup_MIC")) 

//Bluefire Freeze Thrower
    Skins.Add((Id=6098, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet19_MAT.bluefire_cryogun.Bluefire_CryoGun_1P_Mint_MIC", "WEP_SkinSet19_MAT.bluefire_cryogun.Bluefire_CryoGunMain_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_cryogun.Bluefire_CryoGun_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_cryogun.Bluefire_CryoGun_3P_Pickup_MIC")) 
    Skins.Add((Id=6097, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet19_MAT.bluefire_cryogun.Bluefire_CryoGun_1P_FieldTested_MIC", "WEP_SkinSet19_MAT.bluefire_cryogun.Bluefire_CryoGunMain_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.bluefire_cryogun.Bluefire_CryoGun_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_cryogun.Bluefire_CryoGun_3P_Pickup_MIC")) 
    Skins.Add((Id=6096, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet19_MAT.bluefire_cryogun.Bluefire_CryoGun_1P_BattleScarred_MIC", "WEP_SkinSet19_MAT.bluefire_cryogun.Bluefire_CryoGunMain_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.bluefire_cryogun.Bluefire_CryoGun_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_cryogun.Bluefire_CryoGun_3P_Pickup_MIC")) 

//Bluefire Hemoglobin
    Skins.Add((Id=6101, Weapondef=class'KFWeapDef_Hemogoblin', MIC_1P=("wep_skinset19_mat.bluefire_bleeder.Bluefire_Bleeder_1P_Mint_MIC", "wep_skinset19_mat.bluefire_bleeder.Bluefire_Bleeder_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_bleeder.Bluefire_Bleeder_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_bleeder.Bluefire_Bleeder_3P_Pickup_MIC")) 
    Skins.Add((Id=6100, Weapondef=class'KFWeapDef_Hemogoblin', MIC_1P=("wep_skinset19_mat.bluefire_bleeder.Bluefire_Bleeder_1P_FieldTested_MIC", "wep_skinset19_mat.bluefire_bleeder.Bluefire_Bleeder_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_bleeder.Bluefire_Bleeder_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_bleeder.Bluefire_Bleeder_3P_Pickup_MIC")) 
    Skins.Add((Id=6099, Weapondef=class'KFWeapDef_Hemogoblin', MIC_1P=("wep_skinset19_mat.bluefire_bleeder.Bluefire_Bleeder_1P_BattleScarred_MIC", "wep_skinset19_mat.bluefire_bleeder.Bluefire_Bleeder_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_bleeder.Bluefire_Bleeder_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_bleeder.Bluefire_Bleeder_3P_Pickup_MIC")) 

//Bluefire M1911
    Skins.Add((Id=6104, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("wep_skinset19_mat.bluefire_m1911.Bluefire_M1911_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_m1911.Bluefire_M1911_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_m1911.Bluefire_M1911_3P_Pickup_MIC")) 
    Skins.Add((Id=6103, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("wep_skinset19_mat.bluefire_m1911.Bluefire_M1911_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.bluefire_m1911.Bluefire_M1911_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_m1911.Bluefire_M1911_3P_Pickup_MIC")) 
    Skins.Add((Id=6102, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("wep_skinset19_mat.bluefire_m1911.Bluefire_M1911_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.bluefire_m1911.Bluefire_M1911_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_m1911.Bluefire_M1911_3P_Pickup_MIC")) 

//Bluefire M4
    Skins.Add((Id=6107, Weapondef=class'KFWeapDef_M4', MIC_1P=("wep_skinset19_mat.bluefire_m4.Bluefire_M4_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_m4.Bluefire_M4_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_m4.Bluefire_M4_3P_Pickup_MIC")) 
    Skins.Add((Id=6106, Weapondef=class'KFWeapDef_M4', MIC_1P=("wep_skinset19_mat.bluefire_m4.Bluefire_M4_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.bluefire_m4.Bluefire_M4_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_m4.Bluefire_M4_3P_Pickup_MIC")) 
    Skins.Add((Id=6105, Weapondef=class'KFWeapDef_M4', MIC_1P=("wep_skinset19_mat.bluefire_m4.Bluefire_M4_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.bluefire_m4.Bluefire_M4_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_m4.Bluefire_M4_3P_Pickup_MIC")) 

//Bluefire M79
    Skins.Add((Id=6110, Weapondef=class'KFWeapDef_M79', MIC_1P=("wep_skinset19_mat.bluefire_m79.Bluefire_M79_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_m79.Bluefire_M79_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_m79.Bluefire_M79_3P_Pickup_MIC")) 
    Skins.Add((Id=6109, Weapondef=class'KFWeapDef_M79', MIC_1P=("wep_skinset19_mat.bluefire_m79.Bluefire_M79_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.bluefire_m79.Bluefire_M79_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_m79.Bluefire_M79_3P_Pickup_MIC")) 
    Skins.Add((Id=6108, Weapondef=class'KFWeapDef_M79', MIC_1P=("wep_skinset19_mat.bluefire_m79.Bluefire_M79_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.bluefire_m79.Bluefire_M79_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_m79.Bluefire_M79_3P_Pickup_MIC")) 

//Bluefire MP7
    Skins.Add((Id=6113, Weapondef=class'KFWeapDef_MP7', MIC_1P=("wep_skinset19_mat.bluefire_mp7.Bluefire_MP7_1P_Mint_MIC", "wep_skinset19_mat.bluefire_mp7.Bluefire_MP7_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_mp7.Bluefire_MP7_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_mp7.Bluefire_MP7_3P_Pickup_MIC")) 
    Skins.Add((Id=6112, Weapondef=class'KFWeapDef_MP7', MIC_1P=("wep_skinset19_mat.bluefire_mp7.Bluefire_MP7_1P_FieldTested_MIC", "wep_skinset19_mat.bluefire_mp7.Bluefire_MP7_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_mp7.Bluefire_MP7_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_mp7.Bluefire_MP7_3P_Pickup_MIC")) 
    Skins.Add((Id=6111, Weapondef=class'KFWeapDef_MP7', MIC_1P=("wep_skinset19_mat.bluefire_mp7.Bluefire_MP7_1P_BattleScarred_MIC", "wep_skinset19_mat.bluefire_mp7.Bluefire_MP7_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_mp7.Bluefire_MP7_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_mp7.Bluefire_MP7_3P_Pickup_MIC")) 

//Bluefire Railgun
    Skins.Add((Id=6116, Weapondef=class'KFWeapDef_Railgun', MIC_1P=("wep_skinset19_mat.bluefire_railgun.Bluefire_Railgun_1P_Mint_MIC", "wep_skinset19_mat.bluefire_railgun.Bluefire_Railgun_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_railgun.Bluefire_Railgun_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_railgun.Bluefire_Railgun_3P_Pickup_MIC")) 
    Skins.Add((Id=6115, Weapondef=class'KFWeapDef_Railgun', MIC_1P=("wep_skinset19_mat.bluefire_railgun.Bluefire_Railgun_1P_FieldTested_MIC", "wep_skinset19_mat.bluefire_railgun.Bluefire_Railgun_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_railgun.Bluefire_Railgun_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_railgun.Bluefire_Railgun_3P_Pickup_MIC")) 
    Skins.Add((Id=6114, Weapondef=class'KFWeapDef_Railgun', MIC_1P=("wep_skinset19_mat.bluefire_railgun.Bluefire_Railgun_1P_BattleScarred_MIC", "wep_skinset19_mat.bluefire_railgun.Bluefire_Railgun_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_railgun.Bluefire_Railgun_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_railgun.Bluefire_Railgun_3P_Pickup_MIC")) 

//Bluefire RPG-7
    Skins.Add((Id=6119, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("wep_skinset19_mat.bluefire_rpg7.Bluefire_RPG7_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_rpg7.Bluefire_RPG7_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_rpg7.Bluefire_RPG7_3P_Pickup_MIC")) 
    Skins.Add((Id=6118, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("wep_skinset19_mat.bluefire_rpg7.Bluefire_RPG7_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.bluefire_rpg7.Bluefire_RPG7_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_rpg7.Bluefire_RPG7_3P_Pickup_MIC")) 
    Skins.Add((Id=6117, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("wep_skinset19_mat.bluefire_rpg7.Bluefire_RPG7_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.bluefire_rpg7.Bluefire_RPG7_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_rpg7.Bluefire_RPG7_3P_Pickup_MIC")) 

//Bluefire Seeker Six
    Skins.Add((Id=6122, Weapondef=class'KFWeapDef_Seeker6', MIC_1P=("wep_skinset19_mat.bluefire_seekersix.Bluefire_SeekerSix_1P_Mint_MIC", "wep_skinset19_mat.bluefire_seekersix.Bluefire_SeekerSix_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_seekersix.Bluefire_SeekerSix_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_seekersix.Bluefire_SeekerSix_3P_Pickup_MIC")) 
    Skins.Add((Id=6121, Weapondef=class'KFWeapDef_Seeker6', MIC_1P=("wep_skinset19_mat.bluefire_seekersix.Bluefire_SeekerSix_1P_FieldTested_MIC", "wep_skinset19_mat.bluefire_seekersix.Bluefire_SeekerSix_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_seekersix.Bluefire_SeekerSix_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_seekersix.Bluefire_SeekerSix_3P_Pickup_MIC")) 
    Skins.Add((Id=6120, Weapondef=class'KFWeapDef_Seeker6', MIC_1P=("wep_skinset19_mat.bluefire_seekersix.Bluefire_SeekerSix_1P_BattleScarred_MIC", "wep_skinset19_mat.bluefire_seekersix.Bluefire_SeekerSix_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_seekersix.Bluefire_SeekerSix_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_seekersix.Bluefire_SeekerSix_3P_Pickup_MIC")) 

//Bluefire VLAD-1000 Nailgun
    Skins.Add((Id=6125, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("wep_skinset19_mat.bluefire_nailgun.Bluefire_Nailgun_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.bluefire_nailgun.Bluefire_Nailgun_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_nailgun.Bluefire_Nailgun_3P_Pickup_MIC")) 
    Skins.Add((Id=6124, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("wep_skinset19_mat.bluefire_nailgun.Bluefire_Nailgun_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.bluefire_nailgun.Bluefire_Nailgun_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_nailgun.Bluefire_Nailgun_3P_Pickup_MIC")) 
    Skins.Add((Id=6123, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("wep_skinset19_mat.bluefire_nailgun.Bluefire_Nailgun_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.bluefire_nailgun.Bluefire_Nailgun_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.bluefire_nailgun.Bluefire_Nailgun_3P_Pickup_MIC")) 

//Horzine First Encounter AK12
    Skins.Add((Id=6128, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("wep_skinset19_mat.horzinefe_ak12.HorzineFE_AK12_1P_Mint_MIC", "wep_skinset19_mat.horzinefe_ak12.HorzineFE_AK12_Scope_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_ak12.HorzineFE_AK12_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_ak12.HorzineFE_AK12_3P_Pickup_MIC")) 
    Skins.Add((Id=6127, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("wep_skinset19_mat.horzinefe_ak12.HorzineFE_AK12_1P_FieldTested_MIC", "wep_skinset19_mat.horzinefe_ak12.HorzineFE_AK12_Scope_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_ak12.HorzineFE_AK12_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_ak12.HorzineFE_AK12_3P_Pickup_MIC")) 
    Skins.Add((Id=6126, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("wep_skinset19_mat.horzinefe_ak12.HorzineFE_AK12_1P_BattleScarred_MIC", "wep_skinset19_mat.horzinefe_ak12.HorzineFE_AK12_Scope_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_ak12.HorzineFE_AK12_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_ak12.HorzineFE_AK12_3P_Pickup_MIC")) 

//Horzine First Encounter Centerfire
    Skins.Add((Id=6131, Weapondef=class'KFWeapDef_CenterfireMB464', MIC_1P=("wep_skinset19_mat.horzinefe_centerfire.HorzineFE_Centerfire_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_centerfire.HorzineFE_Centerfire_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_centerfire.HorzineFE_Centerfire_3P_Pickup_MIC")) 
    Skins.Add((Id=6130, Weapondef=class'KFWeapDef_CenterfireMB464', MIC_1P=("wep_skinset19_mat.horzinefe_centerfire.HorzineFE_Centerfire_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_centerfire.HorzineFE_Centerfire_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_centerfire.HorzineFE_Centerfire_3P_Pickup_MIC")) 
    Skins.Add((Id=6129, Weapondef=class'KFWeapDef_CenterfireMB464', MIC_1P=("wep_skinset19_mat.horzinefe_centerfire.HorzineFE_Centerfire_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_centerfire.HorzineFE_Centerfire_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_centerfire.HorzineFE_Centerfire_3P_Pickup_MIC")) 

//Horzine First Encounter Boomstick
    Skins.Add((Id=6134, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("wep_skinset19_mat.horzinefe_boomstick.HorzineFE_Boomstick_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_boomstick.HorzineFE_Boomstick_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_boomstick.HorzineFE_Boomstick_3P_Pickup_MIC")) 
    Skins.Add((Id=6133, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("wep_skinset19_mat.horzinefe_boomstick.HorzineFE_Boomstick_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_boomstick.HorzineFE_Boomstick_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_boomstick.HorzineFE_Boomstick_3P_Pickup_MIC")) 
    Skins.Add((Id=6132, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("wep_skinset19_mat.horzinefe_boomstick.HorzineFE_Boomstick_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_boomstick.HorzineFE_Boomstick_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_boomstick.HorzineFE_Boomstick_3P_Pickup_MIC")) 

//Horzine First Encounter HZ12
    Skins.Add((Id=6140, Weapondef=class'KFWeapDef_HZ12', MIC_1P=("wep_skinset19_mat.horzinefe_hz12.HorzineFE_HZ12_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_hz12.HorzineFE_HZ12_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_hz12.HorzineFE_HZ12_3P_Pickup_MIC")) 
    Skins.Add((Id=6139, Weapondef=class'KFWeapDef_HZ12', MIC_1P=("wep_skinset19_mat.horzinefe_hz12.HorzineFE_HZ12_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_hz12.HorzineFE_HZ12_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_hz12.HorzineFE_HZ12_3P_Pickup_MIC")) 
    Skins.Add((Id=6138, Weapondef=class'KFWeapDef_HZ12', MIC_1P=("wep_skinset19_mat.horzinefe_hz12.HorzineFE_HZ12_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_hz12.HorzineFE_HZ12_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_hz12.HorzineFE_HZ12_3P_Pickup_MIC")) 

//Horzine First Encounter Kriss SMG
    Skins.Add((Id=6137, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("wep_skinset19_mat.horzinefe_kriss.HorzineFE_Kriss_1P_Mint_MIC", "wep_skinset19_mat.horzinefe_kriss.HorzineFE_KRISS_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_kriss.HorzineFE_Kriss_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_kriss.HorzineFE_Kriss_3P_Pickup_MIC")) 
    Skins.Add((Id=6136, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("wep_skinset19_mat.horzinefe_kriss.HorzineFE_Kriss_1P_FieldTested_MIC", "wep_skinset19_mat.horzinefe_kriss.HorzineFE_KRISS_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_kriss.HorzineFE_Kriss_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_kriss.HorzineFE_Kriss_3P_Pickup_MIC")) 
    Skins.Add((Id=6135, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("wep_skinset19_mat.horzinefe_kriss.HorzineFE_Kriss_1P_BattleScarred_MIC", "wep_skinset19_mat.horzinefe_kriss.HorzineFE_KRISS_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_kriss.HorzineFE_Kriss_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_kriss.HorzineFE_Kriss_3P_Pickup_MIC")) 

//Horzine First Encounter M14EBR
    Skins.Add((Id=6143, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("wep_skinset19_mat.horzinefe_m14ebr.HorzineFE_M14EBR_1P_Mint_MIC", "wep_skinset19_mat.horzinefe_m14ebr.HorzineFE_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_m14ebr.HorzineFE_M14EBR_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_m14ebr.HorzineFE_M14EBR_3P_Pickup_MIC")) 
    Skins.Add((Id=6142, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("wep_skinset19_mat.horzinefe_m14ebr.HorzineFE_M14EBR_1P_FieldTested_MIC", "wep_skinset19_mat.horzinefe_m14ebr.HorzineFE_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_m14ebr.HorzineFE_M14EBR_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_m14ebr.HorzineFE_M14EBR_3P_Pickup_MIC")) 
    Skins.Add((Id=6141, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("wep_skinset19_mat.horzinefe_m14ebr.HorzineFE_M14EBR_1P_BattleScarred_MIC", "wep_skinset19_mat.horzinefe_m14ebr.HorzineFE_M14EBR_Scope_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_m14ebr.HorzineFE_M14EBR_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_m14ebr.HorzineFE_M14EBR_3P_Pickup_MIC")) 

//Horzine First Encounter M79
    Skins.Add((Id=6146, Weapondef=class'KFWeapDef_M79', MIC_1P=("wep_skinset19_mat.horzinefe_m79.HorzineFE_M79_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_m79.HorzineFE_M79_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_m79.HorzineFE_M79_3P_Pickup_MIC")) 
    Skins.Add((Id=6145, Weapondef=class'KFWeapDef_M79', MIC_1P=("wep_skinset19_mat.horzinefe_m79.HorzineFE_M79_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_m79.HorzineFE_M79_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_m79.HorzineFE_M79_3P_Pickup_MIC")) 
    Skins.Add((Id=6144, Weapondef=class'KFWeapDef_M79', MIC_1P=("wep_skinset19_mat.horzinefe_m79.HorzineFE_M79_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_m79.HorzineFE_M79_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_m79.HorzineFE_M79_3P_Pickup_MIC")) 

//Horzine First Encounter MAC 10
    Skins.Add((Id=6149, Weapondef=class'KFWeapDef_Mac10', MIC_1P=("wep_skinset19_mat.horzinefe_mac10.HorzineFE_MAC10_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_mac10.HorzineFE_MAC10_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_mac10.HorzineFE_MAC10_3P_Pickup_MIC")) 
    Skins.Add((Id=6148, Weapondef=class'KFWeapDef_Mac10', MIC_1P=("wep_skinset19_mat.horzinefe_mac10.HorzineFE_MAC10_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_mac10.HorzineFE_MAC10_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_mac10.HorzineFE_MAC10_3P_Pickup_MIC")) 
    Skins.Add((Id=6147, Weapondef=class'KFWeapDef_Mac10', MIC_1P=("wep_skinset19_mat.horzinefe_mac10.HorzineFE_MAC10_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_mac10.HorzineFE_MAC10_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_mac10.HorzineFE_MAC10_3P_Pickup_MIC")) 

//Horzine First Encounter MP5RAS
    Skins.Add((Id=6152, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet19_MAT.horzinefe_mp5ras.HorzineFE_MP5RAS_1P_Mint_MIC"), MIC_3P="WEP_SkinSet19_MAT.horzinefe_mp5ras.HorzineFE_MP5RAS_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet19_MAT.horzinefe_mp5ras.HorzineFE_MP5RAS_3P_Pickup_MIC")) 
    Skins.Add((Id=6151, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet19_MAT.horzinefe_mp5ras.HorzineFE_MP5RAS_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet19_MAT.horzinefe_mp5ras.HorzineFE_MP5RAS_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet19_MAT.horzinefe_mp5ras.HorzineFE_MP5RAS_3P_Pickup_MIC")) 
    Skins.Add((Id=6150, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet19_MAT.horzinefe_mp5ras.HorzineFE_MP5RAS_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet19_MAT.horzinefe_mp5ras.HorzineFE_MP5RAS_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet19_MAT.horzinefe_mp5ras.HorzineFE_MP5RAS_3P_Pickup_MIC")) 

//Horzine First Encounter RPG-7
    Skins.Add((Id=6155, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("wep_skinset19_mat.horzinefe_rpg7.HorzineFE_RPG7_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_rpg7.HorzineFE_RPG7_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_rpg7.HorzineFE_RPG7_3P_Pickup_MIC")) 
    Skins.Add((Id=6154, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("wep_skinset19_mat.horzinefe_rpg7.HorzineFE_RPG7_1P_FieldTested_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_rpg7.HorzineFE_RPG7_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_rpg7.HorzineFE_RPG7_3P_Pickup_MIC")) 
    Skins.Add((Id=6153, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("wep_skinset19_mat.horzinefe_rpg7.HorzineFE_RPG7_1P_BattleScarred_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_rpg7.HorzineFE_RPG7_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_rpg7.HorzineFE_RPG7_3P_Pickup_MIC")) 

//Horzine First Encounter Scar
    Skins.Add((Id=6158, Weapondef=class'KFWeapDef_Scar', MIC_1P=("wep_skinset19_mat.horzinefe_scar.HorzineFE_SCAR_1P_Mint_MIC", "wep_skinset19_mat.horzinefe_scar.HorzineFE_SCAR_Scope_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_scar.HorzineFE_SCAR_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_scar.HorzineFE_SCAR_3P_Pickup_MIC")) 
    Skins.Add((Id=6157, Weapondef=class'KFWeapDef_Scar', MIC_1P=("wep_skinset19_mat.horzinefe_scar.HorzineFE_SCAR_1P_FieldTested_MIC", "wep_skinset19_mat.horzinefe_scar.HorzineFE_SCAR_Scope_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_scar.HorzineFE_SCAR_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_scar.HorzineFE_SCAR_3P_Pickup_MIC")) 
    Skins.Add((Id=6156, Weapondef=class'KFWeapDef_Scar', MIC_1P=("wep_skinset19_mat.horzinefe_scar.HorzineFE_SCAR_1P_BattleScarred_MIC", "wep_skinset19_mat.horzinefe_scar.HorzineFE_SCAR_Scope_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_scar.HorzineFE_SCAR_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_scar.HorzineFE_SCAR_3P_Pickup_MIC")) 

//Horzine First Encounter Heckler & Koch UMP
    Skins.Add((Id=6161, Weapondef=class'KFWeapDef_HK_UMP', MIC_1P=("wep_skinset19_mat.horzinefe_hk_ump.HorzineFE_HK_UMP_1P_Mint_MIC", "wep_skinset19_mat.horzinefe_hk_ump.HorzineFE_HK_UMP_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_hk_ump.HorzineFE_HK_UMP_3P_Mint_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_hk_ump.HorzineFE_HK_UMP_3P_Pickup_MIC")) 
    Skins.Add((Id=6160, Weapondef=class'KFWeapDef_HK_UMP', MIC_1P=("wep_skinset19_mat.horzinefe_hk_ump.HorzineFE_HK_UMP_1P_FieldTested_MIC", "wep_skinset19_mat.horzinefe_hk_ump.HorzineFE_HK_UMP_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_hk_ump.HorzineFE_HK_UMP_3P_FieldTested_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_hk_ump.HorzineFE_HK_UMP_3P_Pickup_MIC")) 
    Skins.Add((Id=6159, Weapondef=class'KFWeapDef_HK_UMP', MIC_1P=("wep_skinset19_mat.horzinefe_hk_ump.HorzineFE_HK_UMP_1P_BattleScarred_MIC", "wep_skinset19_mat.horzinefe_hk_ump.HorzineFE_HK_UMP_Sight_1P_Mint_MIC"), MIC_3P="wep_skinset19_mat.horzinefe_hk_ump.HorzineFE_HK_UMP_3P_BattleScarred_MIC", MIC_Pickup="wep_skinset19_mat.horzinefe_hk_ump.HorzineFE_HK_UMP_3P_Pickup_MIC")) 

//Horzine Elite Black HMTech-101 Pistol
    Skins.Add((Id=6164, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicPistol_3P_Pickup_MIC")) 
    Skins.Add((Id=6163, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicPistol_3P_Pickup_MIC")) 
    Skins.Add((Id=6162, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineeliteblack_medicassault.HorzineEliteBlack_MedicPistol_3P_Pickup_MIC")) 

//Horzine Elite Blue HMTech-101 Pistol
    Skins.Add((Id=6167, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicPistol_3P_Pickup_MIC")) 
    Skins.Add((Id=6166, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicPistol_3P_Pickup_MIC")) 
    Skins.Add((Id=6165, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineeliteblue_medicassault.HorzineEliteBlue_MedicPistol_3P_Pickup_MIC")) 

//Horzine Elite Green HMTech-101 Pistol
    Skins.Add((Id=6170, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicPistol_3P_Pickup_MIC")) 
    Skins.Add((Id=6169, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicPistol_3P_Pickup_MIC")) 
    Skins.Add((Id=6168, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitegreen_medicassault.HorzineEliteGreen_MedicPistol_3P_Pickup_MIC")) 

//Horzine Elite Red HMTech-101 Pistol
    Skins.Add((Id=6173, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicPistol_3P_Pickup_MIC")) 
    Skins.Add((Id=6172, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicPistol_3P_Pickup_MIC")) 
    Skins.Add((Id=6171, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitered_medicassault.HorzineEliteRed_MedicPistol_3P_Pickup_MIC")) 

//Horzine Elite White HMTech-101 Pistol
    Skins.Add((Id=6176, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicPistol_3P_Pickup_MIC")) 
    Skins.Add((Id=6175, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicPistol_3P_Pickup_MIC")) 
    Skins.Add((Id=6174, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet18_MAT.horzineelitewhite_medicassault.HorzineEliteWhite_MedicPistol_3P_Pickup_MIC")) 

//Precious Centerfire
	Skins.Add((Id=6220, Weapondef=class'KFWeapDef_CenterfireMB464', MIC_1P=("WEP_SkinSet19_MAT.precious_centerfire.Precious_Centerfire_1P_Mint_MIC"), MIC_3P="WEP_SkinSet19_MAT.precious_centerfire.Precious_Centerfire_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet19_MAT.precious_centerfire.Precious_Centerfire_3P_Pickup_MIC"))
    
//Prestige 1858 Revolver
    Skins.Add((Id=6288, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Gunslinger_Remington1858_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Gunslinger_Remington1858_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Gunslinger_Remington1858_3P_Pickup_MIC")) 

//Prestige AR15
    Skins.Add((Id=6285, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Commando_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Commando_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Commando_AR15_3P_Pickup_MIC")) 

//Prestige Caulk n Burn
    Skins.Add((Id=6287, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Firebug_CaulkNBurn_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Firebug_CaulkNBurn_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Firebug_CaulkNBurn_3P_Pickup_MIC")) 

//Prestige Crovel
    Skins.Add((Id=6284, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Berserker_Crovel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Berserker_Crovel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Berserker_Crovel_3P_Pickup_MIC")) 

//Prestige Freeze Thrower
    Skins.Add((Id=6293, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Survivalist_CryoGun_ID1_1P_Mint_MIC", "WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Survivalist_CryoGun_ID2_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Survivalist_CryoGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Survivalist_CryoGun_3P_Pickup_MIC")) 

//Prestige HMTech-101 Pistol
    Skins.Add((Id=6289, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Medic_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Medic_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Medic_MedicPistol_3P_Pickup_MIC")) 

//Prestige HX25
    Skins.Add((Id=6286, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Demo_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Demo_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Demo_HX25_3P_Pickup_MIC")) 

//Prestige MP7
    Skins.Add((Id=6292, Weapondef=class'KFWeapDef_MP7', MIC_1P=("WEP_SkinSet_Prestige02_MAT.tier01.Prestige_SWAT_MP7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_SWAT_MP7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_SWAT_MP7_3P_Pickup_MIC")) 

//Prestige SG 500
    Skins.Add((Id=6291, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Support_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Support_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Support_MB500_3P_Pickup_MIC")) 

//Prestige Winchester 1894
    Skins.Add((Id=6290, Weapondef=class'KFWeapDef_Winchester1894', MIC_1P=("WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Sharpshooter_Winchester1894_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Sharpshooter_Winchester1894_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Sharpshooter_Winchester1894_3P_Pickup_MIC")) 

//Neon 9MM
    Skins.Add((Id=6296, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet21_MAT.neon_9mm.Neon_9MM_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_9mm.Neon_9MM_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_9mm.Neon_9MM_3P_Pickup_MIC")) 
    Skins.Add((Id=6295, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet21_MAT.neon_9mm.Neon_9MM_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_9mm.Neon_9MM_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_9mm.Neon_9MM_3P_Pickup_MIC")) 
    Skins.Add((Id=6294, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet21_MAT.neon_9mm.Neon_9MM_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_9mm.Neon_9MM_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_9mm.Neon_9MM_3P_Pickup_MIC")) 

//Neon AF2011-A1
    Skins.Add((Id=6299, Weapondef=class'KFWeapDef_AF2011', MIC_1P=("WEP_SkinSet21_MAT.neon_af2011.Neon_AF2011_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_af2011.Neon_AF2011_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_af2011.Neon_AF2011_3P_Pickup_MIC")) 
    Skins.Add((Id=6298, Weapondef=class'KFWeapDef_AF2011', MIC_1P=("WEP_SkinSet21_MAT.neon_af2011.Neon_AF2011_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_af2011.Neon_AF2011_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_af2011.Neon_AF2011_3P_Pickup_MIC")) 
    Skins.Add((Id=6297, Weapondef=class'KFWeapDef_AF2011', MIC_1P=("WEP_SkinSet21_MAT.neon_af2011.Neon_AF2011_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_af2011.Neon_AF2011_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_af2011.Neon_AF2011_3P_Pickup_MIC")) 

//Neon AK12
    Skins.Add((Id=6302, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet21_MAT.neon_ak12.Neon_AK12_1P_Mint_MIC", "WEP_SkinSet21_MAT.neon_ak12.Neon_AK12_Sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_ak12.Neon_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_ak12.Neon_AK12_3P_Pickup_MIC")) 
    Skins.Add((Id=6301, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet21_MAT.neon_ak12.Neon_AK12_1P_FieldTested_MIC", "WEP_SkinSet21_MAT.neon_ak12.Neon_AK12_Sight_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_ak12.Neon_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_ak12.Neon_AK12_3P_Pickup_MIC")) 
    Skins.Add((Id=6300, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet21_MAT.neon_ak12.Neon_AK12_1P_BattleScarred_MIC", "WEP_SkinSet21_MAT.neon_ak12.Neon_AK12_Sight_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_ak12.Neon_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_ak12.Neon_AK12_3P_Pickup_MIC")) 

//Neon Centerfire
    Skins.Add((Id=6305, Weapondef=class'KFWeapDef_CenterfireMB464', MIC_1P=("WEP_SkinSet21_MAT.neon_centerfire.Neon_Centerfire_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_centerfire.Neon_Centerfire_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_centerfire.Neon_Centerfire_3P_Pickup_MIC")) 
    Skins.Add((Id=6304, Weapondef=class'KFWeapDef_CenterfireMB464', MIC_1P=("WEP_SkinSet21_MAT.neon_centerfire.Neon_Centerfire_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_centerfire.Neon_Centerfire_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_centerfire.Neon_Centerfire_3P_Pickup_MIC")) 
    Skins.Add((Id=6303, Weapondef=class'KFWeapDef_CenterfireMB464', MIC_1P=("WEP_SkinSet21_MAT.neon_centerfire.Neon_Centerfire_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_centerfire.Neon_Centerfire_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_centerfire.Neon_Centerfire_3P_Pickup_MIC")) 

//Neon Doomstick
    Skins.Add((Id=6308, Weapondef=class'KFWeapDef_ElephantGun', MIC_1P=("WEP_SkinSet21_MAT.neon_quadbarrel.Neon_QuadBarrel_Main_1P_Mint_MIC", "WEP_SkinSet21_MAT.neon_quadbarrel.Neon_QuadBarrel_Barrel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_quadbarrel.Neon_QuadBarrel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_quadbarrel.Neon_QuadBarrel_3P_Pickup_MIC")) 
    Skins.Add((Id=6307, Weapondef=class'KFWeapDef_ElephantGun', MIC_1P=("WEP_SkinSet21_MAT.neon_quadbarrel.Neon_QuadBarrel_Main_1P_FieldTested_MIC", "WEP_SkinSet21_MAT.neon_quadbarrel.Neon_QuadBarrel_Barrel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_quadbarrel.Neon_QuadBarrel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_quadbarrel.Neon_QuadBarrel_3P_Pickup_MIC")) 
    Skins.Add((Id=6306, Weapondef=class'KFWeapDef_ElephantGun', MIC_1P=("WEP_SkinSet21_MAT.neon_quadbarrel.Neon_QuadBarrel_Main_1P_BattleScarred_MIC", "WEP_SkinSet21_MAT.neon_quadbarrel.Neon_QuadBarrel_Barrel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_quadbarrel.Neon_QuadBarrel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_quadbarrel.Neon_QuadBarrel_3P_Pickup_MIC")) 

//Neon Husk Cannon
    Skins.Add((Id=6311, Weapondef=class'KFWeapDef_HuskCannon', MIC_1P=("WEP_SkinSet21_MAT.neon_huskcannon.Neon_HuskCannon_1P_Mint_MIC", "WEP_SkinSet21_MAT.neon_huskcannon.Neon_HuskCannon_Sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_huskcannon.Neon_HuskCannon_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_huskcannon.Neon_HuskCannon_3P_Pickup_MIC")) 
    Skins.Add((Id=6310, Weapondef=class'KFWeapDef_HuskCannon', MIC_1P=("WEP_SkinSet21_MAT.neon_huskcannon.Neon_HuskCannon_1P_FieldTested_MIC", "WEP_SkinSet21_MAT.neon_huskcannon.Neon_HuskCannon_Sight_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_huskcannon.Neon_HuskCannon_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_huskcannon.Neon_HuskCannon_3P_Pickup_MIC")) 
    Skins.Add((Id=6309, Weapondef=class'KFWeapDef_HuskCannon', MIC_1P=("WEP_SkinSet21_MAT.neon_huskcannon.Neon_HuskCannon_1P_BattleScarred_MIC", "WEP_SkinSet21_MAT.neon_huskcannon.Neon_HuskCannon_Sight_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_huskcannon.Neon_HuskCannon_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_huskcannon.Neon_HuskCannon_3P_Pickup_MIC")) 

//Neon M16 M203
    Skins.Add((Id=6314, Weapondef=class'KFWeapDef_M16M203', MIC_1P=("WEP_SkinSet21_MAT.neon_m16m203.Neon_M16_1P_Mint_MIC", "WEP_SkinSet21_MAT.neon_m16m203.Neon_M203_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_m16m203.Neon_M16_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_m16m203.Neon_M16_3P_Pickup_MIC")) 
    Skins.Add((Id=6313, Weapondef=class'KFWeapDef_M16M203', MIC_1P=("WEP_SkinSet21_MAT.neon_m16m203.Neon_M16_1P_FieldTested_MIC", "WEP_SkinSet21_MAT.neon_m16m203.Neon_M203_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_m16m203.Neon_M16_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_m16m203.Neon_M16_3P_Pickup_MIC")) 
    Skins.Add((Id=6312, Weapondef=class'KFWeapDef_M16M203', MIC_1P=("WEP_SkinSet21_MAT.neon_m16m203.Neon_M16_1P_BattleScarred_MIC", "WEP_SkinSet21_MAT.neon_m16m203.Neon_M203_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_m16m203.Neon_M16_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_m16m203.Neon_M16_3P_Pickup_MIC")) 

//Neon M99
    Skins.Add((Id=6317, Weapondef=class'KFWeapDef_M99', MIC_1P=("WEP_SkinSet21_MAT.neon_m99.Neon_M99_1P_Mint_MIC", "WEP_SkinSet21_MAT.neon_m99.Neon_M99_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_m99.Neon_M99_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_m99.Neon_M99_3P_Pickup_MIC")) 
    Skins.Add((Id=6316, Weapondef=class'KFWeapDef_M99', MIC_1P=("WEP_SkinSet21_MAT.neon_m99.Neon_M99_1P_FieldTested_MIC", "WEP_SkinSet21_MAT.neon_m99.Neon_M99_Scope_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_m99.Neon_M99_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_m99.Neon_M99_3P_Pickup_MIC")) 
    Skins.Add((Id=6315, Weapondef=class'KFWeapDef_M99', MIC_1P=("WEP_SkinSet21_MAT.neon_m99.Neon_M99_1P_BattleScarred_MIC", "WEP_SkinSet21_MAT.neon_m99.Neon_M99_Scope_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_m99.Neon_M99_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_m99.Neon_M99_3P_Pickup_MIC")) 

//Neon P90
    Skins.Add((Id=6320, Weapondef=class'KFWeapDef_P90', MIC_1P=("WEP_SkinSet21_MAT.neon_p90.Neon_P90_1P_Mint_MIC", "WEP_SkinSet21_MAT.neon_p90.Neon_P90_Sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_p90.Neon_P90_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_p90.Neon_P90_3P_Pickup_MIC")) 
    Skins.Add((Id=6319, Weapondef=class'KFWeapDef_P90', MIC_1P=("WEP_SkinSet21_MAT.neon_p90.Neon_P90_1P_FieldTested_MIC", "WEP_SkinSet21_MAT.neon_p90.Neon_P90_Sight_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_p90.Neon_P90_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_p90.Neon_P90_3P_Pickup_MIC")) 
    Skins.Add((Id=6318, Weapondef=class'KFWeapDef_P90', MIC_1P=("WEP_SkinSet21_MAT.neon_p90.Neon_P90_1P_BattleScarred_MIC", "WEP_SkinSet21_MAT.neon_p90.Neon_P90_Sight_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_p90.Neon_P90_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_p90.Neon_P90_3P_Pickup_MIC")) 

//Neon Static Strikers
    Skins.Add((Id=6323, Weapondef=class'KFWeapDef_PowerGloves', MIC_1P=("WEP_SkinSet21_MAT.neon_staticstrikers.Neon_StaticStrikers_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_staticstrikers.Neon_StaticStrikers_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_staticstrikers.Neon_StaticStrikers_3P_Pickup_MIC")) 
    Skins.Add((Id=6322, Weapondef=class'KFWeapDef_PowerGloves', MIC_1P=("WEP_SkinSet21_MAT.neon_staticstrikers.Neon_StaticStrikers_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_staticstrikers.Neon_StaticStrikers_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_staticstrikers.Neon_StaticStrikers_3P_Pickup_MIC")) 
    Skins.Add((Id=6321, Weapondef=class'KFWeapDef_PowerGloves', MIC_1P=("WEP_SkinSet21_MAT.neon_staticstrikers.Neon_StaticStrikers_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_staticstrikers.Neon_StaticStrikers_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_staticstrikers.Neon_StaticStrikers_3P_Pickup_MIC")) 

//Neon RGB 9MM
    Skins.Add((Id=6324, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet21_MAT.neonrgb_9mm.NeonRGB_9MM_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neonrgb_9mm.NeonRGB_9MM_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neonrgb_9mm.NeonRGB_9MM_3P_Pickup_MIC")) 

//Neon RGB AF2011-A1
    Skins.Add((Id=6325, Weapondef=class'KFWeapDef_AF2011', MIC_1P=("WEP_SkinSet21_MAT.neonrgb_af2011.NeonRGB_AF2011_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neonrgb_af2011.NeonRGB_AF2011_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neonrgb_af2011.NeonRGB_AF2011_3P_Pickup_MIC")) 

//Neon RGB AK12
    Skins.Add((Id=6326, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet21_MAT.neonrgb_ak12.NeonRGB_AK12_1P_Mint_MIC", "WEP_SkinSet21_MAT.neonrgb_ak12.NeonRGB_AK12_Sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neonrgb_ak12.NeonRGB_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neonrgb_ak12.NeonRGB_AK12_3P_Pickup_MIC")) 

//Neon RGB Centerfire
    Skins.Add((Id=6327, Weapondef=class'KFWeapDef_CenterfireMB464', MIC_1P=("WEP_SkinSet21_MAT.neonrgb_centerfire.NeonRGB_Centerfire_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neonrgb_centerfire.NeonRGB_Centerfire_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neonrgb_centerfire.NeonRGB_Centerfire_3P_Pickup_MIC")) 

//Neon RGB Doomstick
    Skins.Add((Id=6328, Weapondef=class'KFWeapDef_ElephantGun', MIC_1P=("WEP_SkinSet21_MAT.neonrgb_quadbarrel.NeonRGB_QuadBarrel_Main_1P_Mint_MIC", "WEP_SkinSet21_MAT.neonrgb_quadbarrel.NeonRGB_QuadBarrel_Barrel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neonrgb_quadbarrel.NeonRGB_QuadBarrel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neonrgb_quadbarrel.NeonRGB_QuadBarrel_3P_Pickup_MIC")) 

//Neon RGB Husk Cannon
    Skins.Add((Id=6329, Weapondef=class'KFWeapDef_HuskCannon', MIC_1P=("WEP_SkinSet21_MAT.neonrgb_huskcannon.NeonRGB_HuskCannon_1P_Mint_MIC", "WEP_SkinSet21_MAT.neonrgb_huskcannon.NeonRGB_HuskCannon_Sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neonrgb_huskcannon.NeonRGB_HuskCannon_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neonrgb_huskcannon.NeonRGB_HuskCannon_3P_Pickup_MIC")) 

//Neon RGB M16 M203
    Skins.Add((Id=6330, Weapondef=class'KFWeapDef_M16M203', MIC_1P=("WEP_SkinSet21_MAT.neonrgb_m16m203.NeonRGB_M16_1P_Mint_MIC", "WEP_SkinSet21_MAT.neonrgb_m16m203.NeonRGB_M203_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neonrgb_m16m203.NeonRGB_M16_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neonrgb_m16m203.NeonRGB_M16_3P_Pickup_MIC")) 

//Neon RGB M99
    Skins.Add((Id=6331, Weapondef=class'KFWeapDef_M99', MIC_1P=("WEP_SkinSet21_MAT.neonrgb_m99.NeonRGB_M99_1P_Mint_MIC", "WEP_SkinSet21_MAT.neonrgb_m99.NeonRGB_M99_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neonrgb_m99.NeonRGB_M99_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neonrgb_m99.NeonRGB_M99_3P_Pickup_MIC")) 

//Neon RGB P90
    Skins.Add((Id=6332, Weapondef=class'KFWeapDef_P90', MIC_1P=("WEP_SkinSet21_MAT.neonrgb_p90.NeonRGB_P90_1P_Mint_MIC", "WEP_SkinSet21_MAT.neonrgb_p90.NeonRGB_P90_Sight_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neonrgb_p90.NeonRGB_P90_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neonrgb_p90.NeonRGB_P90_3P_Pickup_MIC")) 

//Neon RGB Static Strikers
    Skins.Add((Id=6333, Weapondef=class'KFWeapDef_PowerGloves', MIC_1P=("WEP_SkinSet21_MAT.neonrgb_staticstrikers.NeonRGB_StaticStrikers_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neonrgb_staticstrikers.NeonRGB_StaticStrikers_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neonrgb_staticstrikers.NeonRGB_StaticStrikers_3P_Pickup_MIC")) 

//Vault Vosh AK12
    Skins.Add((Id=6334, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet_VaultVosh04_MAT.vosh_ak12.Vault_Vosh_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh04_MAT.vosh_ak12.Vault_Vosh_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh04_MAT.vosh_ak12.Vault_Vosh_AK12_3P_Pickup_MIC")) 

//Vault Vosh Desert Eagle
    Skins.Add((Id=6335, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet_VaultVosh04_MAT.vosh_deagle.Vault_Vosh_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh04_MAT.vosh_deagle.Vault_Vosh_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh04_MAT.vosh_deagle.Vault_Vosh_Deagle_3P_Pickup_MIC")) 

//Vault Vosh Flamethrower
    Skins.Add((Id=6336, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet_VaultVosh04_MAT.vosh_flamethrower.Vault_Vosh_Flamethrower_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh04_MAT.vosh_flamethrower.Vault_Vosh_Flamethrower_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh04_MAT.vosh_flamethrower.Vault_Vosh_Flamethrower_3P_Pickup_MIC")) 

//Vault Vosh Freeze Thrower
    Skins.Add((Id=6337, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet_VaultVosh04_MAT.vosh_cryogun.Vault_Vosh_Cryogun_ID1_1P_Mint_MIC", "WEP_SkinSet_VaultVosh04_MAT.vosh_cryogun.Vault_Vosh_Cryogun_ID2_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh04_MAT.vosh_cryogun.Vault_Vosh_Cryogun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh04_MAT.vosh_cryogun.Vault_Vosh_Cryogun_3P_Pickup_MIC")) 
    
//Vault Vosh HMTech-301 Shotgun
    Skins.Add((Id=6338, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet_VaultVosh02_MAT.vosh_medic_pistol.Vault_Vosh_Medic_Pistol_1P_Mint_MIC", "WEP_SkinSet_VaultVosh04_MAT.vosh_medicshotgun.Vault_Vosh_MedicShotgun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh04_MAT.vosh_medicshotgun.Vault_Vosh_MedicShotgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh04_MAT.vosh_medicshotgun.Vault_Vosh_MedicShotgun_3P_Pickup_MIC")) 

//Vault Vosh M14EBR
    Skins.Add((Id=6339, Weapondef=class'KFWeapDef_M14EBR', MIC_1P=("WEP_SkinSet_VaultVosh04_MAT.vosh_m14ebr.Vault_Vosh_M14EBR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh04_MAT.vosh_m14ebr.Vault_Vosh_M14EBR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh04_MAT.vosh_m14ebr.Vault_Vosh_M14EBR_3P_Pickup_MIC")) 

//Vault Vosh M4
    Skins.Add((Id=6340, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet_VaultVosh04_MAT.vosh_m4.Vault_Vosh_M4Shotgun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh04_MAT.vosh_m4.Vault_Vosh_M4Shotgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh04_MAT.vosh_m4.Vault_Vosh_M4Shotgun_3P_Pickup_MIC")) 

//Vault Vosh M79
    Skins.Add((Id=6341, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet_VaultVosh04_MAT.vosh_m79.Vault_Vosh_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh04_MAT.vosh_m79.Vault_Vosh_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh04_MAT.vosh_m79.Vault_Vosh_M79_3P_Pickup_MIC")) 

//Vault Vosh P90
    Skins.Add((Id=6342, Weapondef=class'KFWeapDef_P90', MIC_1P=("WEP_SkinSet_VaultVosh04_MAT.vosh_p90.Vault_Vosh_P90_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh04_MAT.vosh_p90.Vault_Vosh_P90_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh04_MAT.vosh_p90.Vault_Vosh_P90_3P_Pickup_MIC")) 

//Vault Vosh Pulverizer
    Skins.Add((Id=6343, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet_VaultVosh04_MAT.vosh_pulverizer.Vault_Vosh_Pulverizer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh04_MAT.vosh_pulverizer.Vault_Vosh_Pulverizer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh04_MAT.vosh_pulverizer.Vault_Vosh_Pulverizer_3P_Pickup_MIC")) 

//Neon MAC 10
    Skins.Add((Id=6346, Weapondef=class'KFWeapDef_Mac10', MIC_1P=("WEP_SkinSet21_MAT.neon_mac10.Neon_MAC10_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_mac10.Neon_MAC10_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_mac10.Neon_MAC10_3P_Pickup_MIC")) 
    Skins.Add((Id=6345, Weapondef=class'KFWeapDef_Mac10', MIC_1P=("WEP_SkinSet21_MAT.neon_mac10.Neon_MAC10_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_mac10.Neon_MAC10_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_mac10.Neon_MAC10_3P_Pickup_MIC")) 
    Skins.Add((Id=6344, Weapondef=class'KFWeapDef_Mac10', MIC_1P=("WEP_SkinSet21_MAT.neon_mac10.Neon_MAC10_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet21_MAT.neon_mac10.Neon_MAC10_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neon_mac10.Neon_MAC10_3P_Pickup_MIC")) 

//Neon RGB MAC 10
    Skins.Add((Id=6347, Weapondef=class'KFWeapDef_Mac10', MIC_1P=("WEP_SkinSet21_MAT.neonrgb_mac10.NeonRGB_MAC10_1P_Mint_MIC"), MIC_3P="WEP_SkinSet21_MAT.neonrgb_mac10.NeonRGB_MAC10_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet21_MAT.neonrgb_mac10.NeonRGB_MAC10_3P_Pickup_MIC"))

//Halloween MKB42
    Skins.Add((Id=6456, Weapondef=class'KFWeapDef_MKB42', MIC_1P=("WEP_SkinSet_Halloween_MAT.hans_mkb42h.WEP_1P_Halloween_MKB42H_MIC"), MIC_3P="WEP_SkinSet_Halloween_MAT.hans_mkb42h.WEP_3P_Halloween_MKB42H_MIC", MIC_Pickup="WEP_SkinSet_Halloween_MAT.hans_mkb42h.WEP_3P_Halloween_MKB42H_Pickup_MIC")) 
    
//Neon HMTech-101 Pistol
    Skins.Add((Id=6485, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_3P_Pickup_MIC")) 
    Skins.Add((Id=6484, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_3P_Pickup_MIC")) 
    Skins.Add((Id=6483, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_3P_Pickup_MIC")) 

//Neon HMTech-201 SMG
    Skins.Add((Id=6488, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_1P_Mint_MIC", "WEP_SkinSet22_MAT.neon_medicsmg.Neon_MedicSMG_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicsmg.Neon_MedicSMG_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicsmg.Neon_MedicSMG_3P_Pickup_MIC")) 
    Skins.Add((Id=6487, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_1P_FieldTested_MIC", "WEP_SkinSet22_MAT.neon_medicsmg.Neon_MedicSMG_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicsmg.Neon_MedicSMG_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicsmg.Neon_MedicSMG_3P_Pickup_MIC")) 
    Skins.Add((Id=6486, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_1P_BattleScarred_MIC", "WEP_SkinSet22_MAT.neon_medicsmg.Neon_MedicSMG_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicsmg.Neon_MedicSMG_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicsmg.Neon_MedicSMG_3P_Pickup_MIC")) 

//Neon HMTech-301 Shotgun
    Skins.Add((Id=6491, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_1P_Mint_MIC", "WEP_SkinSet22_MAT.neon_medicshotgun.Neon_MedicShotgun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicshotgun.Neon_MedicShotgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicshotgun.Neon_MedicShotgun_3P_Pickup_MIC")) 
    Skins.Add((Id=6490, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_1P_FieldTested_MIC", "WEP_SkinSet22_MAT.neon_medicshotgun.Neon_MedicShotgun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicshotgun.Neon_MedicShotgun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicshotgun.Neon_MedicShotgun_3P_Pickup_MIC")) 
    Skins.Add((Id=6489, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_1P_BattleScarred_MIC", "WEP_SkinSet22_MAT.neon_medicshotgun.Neon_MedicShotgun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicshotgun.Neon_MedicShotgun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicshotgun.Neon_MedicShotgun_3P_Pickup_MIC")) 

//Neon HMTech-401 Assault Rifle
    Skins.Add((Id=6497, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet22_MAT.neon_medicassault.Neon_MedicAssault_1P_Mint_MIC", "WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicassault.Neon_MedicAssault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicassault.Neon_MedicAssault_3P_Pickup_MIC")) 
    Skins.Add((Id=6496, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet22_MAT.neon_medicassault.Neon_MedicAssault_1P_FieldTested_MIC", "WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicassault.Neon_MedicAssault_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicassault.Neon_MedicAssault_3P_Pickup_MIC")) 
    Skins.Add((Id=6495, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet22_MAT.neon_medicassault.Neon_MedicAssault_1P_BattleScarred_MIC", "WEP_SkinSet22_MAT.neon_medicpistol.Neon_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicassault.Neon_MedicAssault_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicassault.Neon_MedicAssault_3P_Pickup_MIC")) 

//Neon HMTech-501 Grenade Rifle
    Skins.Add((Id=6500, Weapondef=class'KFWeapDef_MedicRifleGrenadeLauncher', MIC_1P=("WEP_SkinSet22_MAT.neon_medicgrenaderifle.Neon_MedicGrenadeRifle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicgrenaderifle.Neon_MedicGrenadeRifle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicgrenaderifle.Neon_MedicGrenadeRifle_3P_Pickup_MIC")) 
    Skins.Add((Id=6499, Weapondef=class'KFWeapDef_MedicRifleGrenadeLauncher', MIC_1P=("WEP_SkinSet22_MAT.neon_medicgrenaderifle.Neon_MedicGrenadeRifle_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicgrenaderifle.Neon_MedicGrenadeRifle_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicgrenaderifle.Neon_MedicGrenadeRifle_3P_Pickup_MIC")) 
    Skins.Add((Id=6498, Weapondef=class'KFWeapDef_MedicRifleGrenadeLauncher', MIC_1P=("WEP_SkinSet22_MAT.neon_medicgrenaderifle.Neon_MedicGrenadeRifle_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_medicgrenaderifle.Neon_MedicGrenadeRifle_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_medicgrenaderifle.Neon_MedicGrenadeRifle_3P_Pickup_MIC")) 

//Neon MKb.42
    Skins.Add((Id=6503, Weapondef=class'KFWeapDef_MKB42', MIC_1P=("WEP_SkinSet22_MAT.neon_mkb42.Neon_MKB42_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_mkb42.Neon_MKB42_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_mkb42.Neon_MKB42_3P_Pickup_MIC")) 
    Skins.Add((Id=6502, Weapondef=class'KFWeapDef_MKB42', MIC_1P=("WEP_SkinSet22_MAT.neon_mkb42.Neon_MKB42_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_mkb42.Neon_MKB42_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_mkb42.Neon_MKB42_3P_Pickup_MIC")) 
    Skins.Add((Id=6501, Weapondef=class'KFWeapDef_MKB42', MIC_1P=("WEP_SkinSet22_MAT.neon_mkb42.Neon_MKB42_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_mkb42.Neon_MKB42_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_mkb42.Neon_MKB42_3P_Pickup_MIC")) 

//Neon 500 Magnum Revolver
    Skins.Add((Id=6506, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet22_MAT.neon_sw500.Neon_SW500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_sw500.Neon_SW500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_sw500.Neon_SW500_3P_Pickup_MIC")) 
    Skins.Add((Id=6505, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet22_MAT.neon_sw500.Neon_SW500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_sw500.Neon_SW500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_sw500.Neon_SW500_3P_Pickup_MIC")) 
    Skins.Add((Id=6504, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet22_MAT.neon_sw500.Neon_SW500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_sw500.Neon_SW500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_sw500.Neon_SW500_3P_Pickup_MIC")) 

//Neon Freeze Thrower
    Skins.Add((Id=6509, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet22_MAT.neon_cryogun.Neon_CryoGun_ID1_1P_Mint_MIC", "WEP_SkinSet22_MAT.neon_cryogun.Neon_CryoGun_ID2_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_cryogun.Neon_CryoGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_cryogun.Neon_CryoGun_3P_Pickup_MIC")) 
    Skins.Add((Id=6508, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet22_MAT.neon_cryogun.Neon_CryoGun_ID1_1P_FieldTested_MIC", "WEP_SkinSet22_MAT.neon_cryogun.Neon_CryoGun_ID2_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_cryogun.Neon_CryoGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_cryogun.Neon_CryoGun_3P_Pickup_MIC")) 
    Skins.Add((Id=6507, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet22_MAT.neon_cryogun.Neon_CryoGun_ID1_1P_BattleScarred_MIC", "WEP_SkinSet22_MAT.neon_cryogun.Neon_CryoGun_ID2_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_cryogun.Neon_CryoGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_cryogun.Neon_CryoGun_3P_Pickup_MIC")) 

//Neon M4
    Skins.Add((Id=6512, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet22_MAT.neon_m4.Neon_M4_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_m4.Neon_M4_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_m4.Neon_M4_3P_Pickup_MIC")) 
    Skins.Add((Id=6511, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet22_MAT.neon_m4.Neon_M4_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_m4.Neon_M4_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_m4.Neon_M4_3P_Pickup_MIC")) 
    Skins.Add((Id=6510, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet22_MAT.neon_m4.Neon_M4_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_m4.Neon_M4_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_m4.Neon_M4_3P_Pickup_MIC")) 

//Neon Bone Crusher
    Skins.Add((Id=6515, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet22_MAT.neon_maceandshield.Neon_Mace_1P_Mint_MIC", "WEP_SkinSet22_MAT.neon_maceandshield.Neon_Shield_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_maceandshield.Neon_MaceAndShield_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_maceandshield.Neon_MaceAndShield_3P_Pickup_MIC")) 
    Skins.Add((Id=6514, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet22_MAT.neon_maceandshield.Neon_Mace_1P_FieldTested_MIC", "WEP_SkinSet22_MAT.neon_maceandshield.Neon_Shield_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_maceandshield.Neon_MaceAndShield_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_maceandshield.Neon_MaceAndShield_3P_Pickup_MIC")) 
    Skins.Add((Id=6513, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet22_MAT.neon_maceandshield.Neon_Mace_1P_BattleScarred_MIC", "wep_skinset22_mat.neon_maceandshield.Neon_Shield_1P_BattleScarredd_MIC"), MIC_3P="WEP_SkinSet22_MAT.neon_maceandshield.Neon_MaceAndShield_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neon_maceandshield.Neon_MaceAndShield_3P_Pickup_MIC")) 

//Neon RGB HMTech-101 Pistol
    Skins.Add((Id=6473, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet22_MAT.neonrgb_medicpistol.NeonRGB_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neonrgb_medicpistol.NeonRGB_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neonrgb_medicpistol.NeonRGB_MedicPistol_3P_Pickup_MIC")) 

//Neon RGB HMTech-201 SMG
    Skins.Add((Id=6474, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet22_MAT.neonrgb_medicpistol.NeonRGB_MedicPistol_1P_Mint_MIC", "WEP_SkinSet22_MAT.neonrgb_medicsmg.NeonRGB_MedicSMG_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neonrgb_medicsmg.NeonRGB_MedicSMG_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neonrgb_medicsmg.NeonRGB_MedicSMG_3P_Pickup_MIC")) 

//Neon RGB HMTech-301 Shotgun
    Skins.Add((Id=6475, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet22_MAT.neonrgb_medicpistol.NeonRGB_MedicPistol_1P_Mint_MIC", "WEP_SkinSet22_MAT.neonrgb_medicshotgun.NeonRGB_MedicShotgun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neonrgb_medicshotgun.NeonRGB_MedicShotgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neonrgb_medicshotgun.NeonRGB_MedicShotgun_3P_Pickup_MIC")) 

//Neon RGB HMTech-401 Assault Rifle
    Skins.Add((Id=6476, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet22_MAT.neonrgb_medicassault.NeonRGB_MedicAssault_1P_Mint_MIC", "WEP_SkinSet22_MAT.neonrgb_medicpistol.NeonRGB_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neonrgb_medicassault.NeonRGB_MedicAssault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neonrgb_medicassault.NeonRGB_MedicAssault_3P_Pickup_MIC")) 

//Neon RGB HMTech-501 Grenade Rifle
    Skins.Add((Id=6477, Weapondef=class'KFWeapDef_MedicRifleGrenadeLauncher', MIC_1P=("WEP_SkinSet22_MAT.neonrgb_medicgrenaderifle.NeonRGB_MedicGrenadeRifle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neonrgb_medicgrenaderifle.NeonRGB_MedicGrenadeRifle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neonrgb_medicgrenaderifle.NeonRGB_MedicGrenadeRifle_3P_Pickup_MIC")) 

//Neon RGB MKb.42
    Skins.Add((Id=6478, Weapondef=class'KFWeapDef_MKB42', MIC_1P=("WEP_SkinSet22_MAT.neonrgb_mkb42.NeonRGB_MKB42_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neonrgb_mkb42.NeonRGB_MKB42_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neonrgb_mkb42.NeonRGB_MKB42_3P_Pickup_MIC")) 

//Neon RGB 500 Magnum Revolver
    Skins.Add((Id=6479, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet22_MAT.neonrgb_sw500.NeonRGB_SW500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neonrgb_sw500.NeonRGB_SW500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neonrgb_sw500.NeonRGB_SW500_3P_Pickup_MIC")) 

//Neon RGB Freeze Thrower
    Skins.Add((Id=6480, Weapondef=class'KFWeapDef_FreezeThrower', MIC_1P=("WEP_SkinSet22_MAT.neonrgb_cryogun.NeonRGB_CryoGun_ID1_1P_Mint_MIC", "WEP_SkinSet22_MAT.neonrgb_cryogun.NeonRGB_CryoGun_ID2_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neonrgb_cryogun.NeonRGB_CryoGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neonrgb_cryogun.NeonRGB_CryoGun_3P_Pickup_MIC")) 

//Neon RGB M4
    Skins.Add((Id=6481, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet22_MAT.neonrgb_m4.NeonRGB_M4_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neonrgb_m4.NeonRGB_M4_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neonrgb_m4.NeonRGB_M4_3P_Pickup_MIC")) 

//Neon RGB Bone Crusher
    Skins.Add((Id=6482, Weapondef=class'KFWeapDef_MaceAndShield', MIC_1P=("WEP_SkinSet22_MAT.neonrgb_maceandshield.NeonRGB_Mace_1P_Mint_MIC", "WEP_SkinSet22_MAT.neonrgb_maceandshield.NeonRGB_Shield_1P_Mint_MIC"), MIC_3P="WEP_SkinSet22_MAT.neonrgb_maceandshield.NeonRGB_MaceAndShield_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet22_MAT.neonrgb_maceandshield.NeonRGB_MaceAndShield_3P_Pickup_MIC")) 

//Prestige Katana
    Skins.Add((Id=6462, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Berserker_Katana_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Berserker_Katana_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Berserker_Katana_3P_Pickup_MIC")) 

//Prestige L85A2
    Skins.Add((Id=6463, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Commando_L85A2_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Commando_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Commando_L85A2_3P_Pickup_MIC")) 

//Prestige M79
    Skins.Add((Id=6464, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Demolition_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Demolition_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Demolition_M79_3P_Pickup_MIC")) 

//Prestige Dragonsbreath
    Skins.Add((Id=6465, Weapondef=class'KFWeapDef_Dragonsbreath', MIC_1P=("WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Firebug_Dragonsbreath_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Firebug_Dragonsbreath_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Firebug_Dragonsbreath_3P_Pickup_MIC")) 

//Prestige M1911
    Skins.Add((Id=6466, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Gunslinger_M1911_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Gunslinger_M1911_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Gunslinger_M1911_3P_Pickup_MIC")) 

//Prestige HMTech-201 SMG
    Skins.Add((Id=6468, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet_Prestige02_MAT.tier01.Prestige_Medic_MedicPistol_1P_Mint_MIC", "WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Medic_MedicSMG_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Medic_MedicSMG_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Medic_MedicSMG_3P_Pickup_MIC")) 

//Prestige Crossbow
    Skins.Add((Id=6469, Weapondef=class'KFWeapDef_Crossbow', MIC_1P=("WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Sharpshooter_Crossbow_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Sharpshooter_Crossbow_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Sharpshooter_Crossbow_3P_Pickup_MIC")) 

//Prestige Boomstick
    Skins.Add((Id=6470, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Support_Boomstick_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Support_Boomstick_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Support_Boomstick_3P_Pickup_MIC")) 

//Prestige Tommy Gun
    Skins.Add((Id=6471, Weapondef=class'KFWeapDef_Thompson', MIC_1P=("WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Survivalist_TommyGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Survivalist_TommyGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_Survivalist_TommyGun_3P_Pickup_MIC")) 

//Prestige MP5RAS
    Skins.Add((Id=6472, Weapondef=class'KFWeapDef_MP5RAS', MIC_1P=("WEP_SkinSet_Prestige03_MAT.tier02.Prestige_SWAT_MP5RAS_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_SWAT_MP5RAS_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_Prestige03_MAT.tier02.Prestige_SWAT_MP5RAS_3P_Pickup_MIC")) 
    
//Christmas BattleAxe
	Skins.Add((Id=5378, Weapondef=class'KFWeapDef_AbominationAxe', MIC_1P=("WEP_1P_KrampusAxe_MAT.Wep_1stP_KrampusAxe_MIC"), MIC_3P="WEP_3P_KrampusAxe_MAT.WEP_3P_KrampusAxe_MIC", MIC_Pickup="WEP_3P_KrampusAxe_MAT.WEP_3P_KrampusAxe_Pickup_MIC"))

//Vault Vosh AA12
	Skins.Add((Id=6614, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet_VaultVosh05_MAT.vosh_aa12.Vault_Vosh_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh05_MAT.vosh_aa12.Vault_Vosh_AA12_3P_Pickup_MIC"))

//Vault Vosh Sawblade
	Skins.Add((Id=6607, Weapondef=class'KFWeapDef_Eviscerator', MIC_1P=("WEP_SkinSet_VaultVosh05_MAT.vosh_sawblade.Vosh_Vault_SawBlade_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh05_MAT.vosh_sawblade.Vosh_Vault_SawBlade_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh05_MAT.vosh_sawblade.Vault_Vosh_sawblade_3P_Pickup_MIC"))

//Vault Vosh HMTech-401 Assault Rifle
    Skins.Add((Id=6612, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet_VaultVosh05_MAT.vosh_medic_assault.Vault_Vosh_Medic_Assault_1P_Mint_MIC'", "wep_skinset_vaultvosh02_mat.vosh_medic_pistol.Vault_Vosh_Medic_Pistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh05_MAT.vosh_medic_assault.Vault_Vosh_Medic_Assault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh05_MAT.vosh_medic_assault.Vault_Vosh_Medic_Assault_3P_Pickup_MIC'")) 

//Vault Vosh Kriss
	Skins.Add((Id=6615, Weapondef=class'KFWeapDef_Kriss', MIC_1P=("WEP_SkinSet_VaultVosh05_MAT.vosh_kriss.Vault_Vosh_KRISS_1P_Mint_MIC", "WEP_1P_KRISS_MAT.Wep_1stP_KRISS_Reddot_MIC'"), MIC_3P="WEP_SkinSet_VaultVosh05_MAT.vosh_kriss.Vault_Vosh_KRISS_3P_Mint_MIC'", MIC_Pickup="WEP_SkinSet_VaultVosh05_MAT.vosh_kriss.Vault_Vosh_KRISS_3P_Pickup_MIC"))

//Vault Vosh Microwave Gun
	Skins.Add((Id=6610, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet_VaultVosh05_MAT.vosh_microwave_gun.Vault_Vosh_Microwave_Gun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh05_MAT.vosh_microwave_gun.Vault_Vosh_Microwave_Gun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh05_MAT.vosh_microwave_gun.Vault_Vosh_Microwave_Gun_3P_Pickup_MIC"))

//Vault Vosh SCAR
	Skins.Add((Id=6608, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet_VaultVosh05_MAT.vosh_scar.Vault_Vosh_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh05_MAT.vosh_scar.Vault_Vosh_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh05_MAT.vosh_scar.Vault_Vosh_SCAR_3P_Pickup_MIC"))

//Vault Vosh Railgun
	Skins.Add((Id=6613, Weapondef=class'KFWeapDef_RailGun', MIC_1P=("WEP_SkinSet_VaultVosh05_MAT.vosh_railgun.Vault_Vosh_RailGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh05_MAT.vosh_railgun.Vault_Vosh_RailGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh05_MAT.vosh_railgun.Vault_Vosh_RailGun_3P_Pickup_MIC"))

//Vault Vosh RPG7
	Skins.Add((Id=6609, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet_VaultVosh05_MAT.vosh_rpg7.Vault_Vosh_RPG7_1P_Mint_MIC'"), MIC_3P="WEP_SkinSet_VaultVosh05_MAT.vosh_rpg7.Vault_Vosh_RPG7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh05_MAT.vosh_rpg7.Vault_Vosh_RPG7_3P_Pickup_MIC"))

//Vault Vosh SW500
	Skins.Add((Id=6611, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet_VaultVosh05_MAT.vosh_sw500.Vault_Vosh_SW_500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet_VaultVosh05_MAT.vosh_sw500.Vault_Vosh_SW_500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet_VaultVosh05_MAT.vosh_sw500.Vault_Vosh_SW_500_3P_Pickup_MIC"))

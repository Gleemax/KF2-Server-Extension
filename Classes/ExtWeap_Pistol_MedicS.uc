class ExtWeap_Pistol_MedicS extends KFWeap_Pistol_Medic;

defaultproperties
{
	AssociatedPerkClasses(0)=class'KFPerk_Commando'
	AssociatedPerkClasses(1)=class'KFPerk_Berserker'
	AssociatedPerkClasses(2)=class'KFPerk_Support'
	AssociatedPerkClasses(3)=class'KFPerk_FieldMedic'
	AssociatedPerkClasses(4)=class'KFPerk_Firebug'
	AssociatedPerkClasses(5)=class'KFPerk_Demolitionist'
	AssociatedPerkClasses(6)=class'KFPerk_Gunslinger'
	AssociatedPerkClasses(7)=class'KFPerk_Sharpshooter'
	AssociatedPerkClasses(8)=class'KFPerk_Swat'
	AssociatedPerkClasses(9)=class'KFPerk_Survivalist'

	InventorySize=0

	bCanThrow=false
	
	SpareAmmoCapacity[0]=-1
	InitialSpareMags[0]=0
	
	bInfiniteSpareAmmo=True
}
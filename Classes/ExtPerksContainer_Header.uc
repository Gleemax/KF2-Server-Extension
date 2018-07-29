class ExtPerksContainer_Header extends KFGFxPerksContainer_Header;

final function ExUpdatePerkHeader( Ext_PerkBase PerkClass )
{	
	local GFxObject PerkDataProvider;
    local GFxObject PerkIconObject;

    PerkIconObject = CreateObject("Object");
	PerkIconObject.SetString("perkIcon", PerkClass.GetPerkIconPath(PerkClass.CurrentLevel));
	PerkIconObject.SetString("prestigeIcon", PerkClass.GetPrestigeIconPath(PerkClass.CurrentPrestige, PerkClass.MaxPrestige));

	PerkDataProvider = CreateObject( "Object" );
    PerkDataProvider.SetObject("perkData", PerkIconObject);
    PerkDataProvider.SetString( "perkTitle", PerkClass.PerkName );
    PerkDataProvider.SetString( "perkLevel", LevelString@PerkClass.CurrentLevel);
    PerkDataProvider.SetString( "prestigeLevel", "");  //not used yet so not point to populating with data
    PerkDataProvider.SetString( "xpString",  PerkClass.CurrentEXP$"/"$PerkClass.NextLevelEXP );
    PerkDataProvider.SetFloat( "xpPercent", PerkClass.GetProgressPercent() );
	SetObject( "perkData", PerkDataProvider );
}

defaultproperties
{
}
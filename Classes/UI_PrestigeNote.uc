Class UI_PrestigeNote extends UI_ResetWarning;

function SetupTo( Ext_PerkBase P )
{
	PerkToReset = P.Class;
	WindowTitle = localizedStr[0]$P.PerkName;
	InfoLabel.SetText(localizedStr[1]$P.PrestigeSPIncrease$localizedStr[2]);
}

defaultproperties
{
	bIsPrestige=true

	Begin Object Name=YesButten
		Tooltip="Prestige the perk (you can not undo this action!)"
	End Object
}
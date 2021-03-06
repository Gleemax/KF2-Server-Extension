Class UI_AdminPerkLevel extends KFGUI_FloatingWindow;

var KFGUI_NumericBox LevelBox;
var int PlayerID,BaseValue;

var() Localized string localizedStr[4];

function InitMenu()
{
	Super.InitMenu();

	LevelBox = KFGUI_NumericBox(FindComponentID('Edit'));
}
final function InitPage( int UserID, byte Mode )
{
	local PlayerReplicationInfo PRI;

	PlayerID = UserID;

	// Find matching player by ID
	foreach GetPlayer().WorldInfo.GRI.PRIArray(PRI)
	{
		if ( PRI.PlayerID==UserID )
			break;
	}
	if( ExtPlayerReplicationInfo(PRI)==None )
	{
		WindowTitle = Mode==1 ? localizedStr[0] : localizedStr[1];
		return;
	}
	WindowTitle = (Mode==1 ? localizedStr[2] : localizedStr[3])$PRI.GetHumanReadableName();
	LevelBox.ChangeValue(string(Mode==1 ? ExtPlayerReplicationInfo(PRI).ECurrentPerkLevel : ExtPlayerReplicationInfo(PRI).ECurrentPerkPrestige));
	BaseValue = (Mode==1 ? 100 : 100000);
}
function ButtonClicked( KFGUI_Button Sender )
{
	switch( Sender.ID )
	{
	case 'Yes':
		ExtPlayerController(GetPlayer()).AdminRPGHandle(PlayerID,BaseValue+LevelBox.GetValueInt());
		DoClose();
		break;
	case 'No':
		DoClose();
		break;
	}
}

defaultproperties
{
	XPosition=0.35
	YPosition=0.4
	XSize=0.4
	YSize=0.15
	bAlwaysTop=true
	bOnlyThisFocus=true

	Begin Object Class=KFGUI_Button Name=YesButton
		ID="Yes"
		ButtonText="Submit"
		Tooltip="Set the perk/prestige level"
		XPosition=0.4
		YPosition=0.5
		XSize=0.09
		YSize=0.4
		ExtravDir=1
		OnClickLeft=ButtonClicked
		OnClickRight=ButtonClicked
	End Object
	Begin Object Class=KFGUI_Button Name=NoButton
		ID="No"
		ButtonText="Cancel"
		Tooltip="Abort without doing anything"
		XPosition=0.5
		YPosition=0.5
		XSize=0.09
		YSize=0.4
		OnClickLeft=ButtonClicked
		OnClickRight=ButtonClicked
	End Object
	Begin Object Class=KFGUI_NumericBox Name=EditBox
		ID="Edit"
		Tooltip="Enter the new perk/prestige level to set this player to."
		XPosition=0.05
		YPosition=0.2
		XSize=0.9
		YSize=0.3
		MaxValue=99999
	End Object

	Components.Add(YesButton)
	Components.Add(NoButton)
	Components.Add(EditBox)
}
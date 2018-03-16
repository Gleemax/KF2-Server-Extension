Class UI_UnloadInfo extends KFGUI_FloatingWindow;

var class<Ext_PerkBase> PerkToReset;
var KFGUI_Button YesButten;
var KFGUI_TextField InfoLabel;
var byte CurCallCode;

var() Localized string localizedStr[8];

function InitMenu()
{
	YesButten = KFGUI_Button(FindComponentID('Yes'));
	InfoLabel = KFGUI_TextField(FindComponentID('Info'));
	Super.InitMenu();
}
final function SetupTo( class<Ext_PerkBase> P )
{
	PerkToReset = P;
	WindowTitle = localizedStr[0]$P.Default.PerkName;
	YesButten.SetDisabled(true);
	InfoLabel.SetText(localizedStr[1]);
	++CurCallCode;
	ExtPlayerController(GetPlayer()).OnClientGetResponse = ReceivedInfo;
	ExtPlayerController(GetPlayer()).ServerGetUnloadInfo(CurCallCode,PerkToReset,false);
}
function ButtonClicked( KFGUI_Button Sender )
{
	switch( Sender.ID )
	{
	case 'Yes':
		ExtPlayerController(GetPlayer()).ServerGetUnloadInfo(0,PerkToReset,true);
		DoClose();
		break;
	case 'No':
		DoClose();
		break;
	}
}
function CloseMenu()
{
	Super.CloseMenu();
	PerkToReset = None;
	ExtPlayerController(GetPlayer()).OnClientGetResponse = ExtPlayerController(GetPlayer()).DefClientResponse;
}

function ReceivedInfo( byte CallID, byte Code, int DataA, int DataB )
{
	if( CurCallCode!=CallID )
		return;
	switch( Code )
	{
	case 0:
		InfoLabel.SetText(localizedStr[2]);
		break;
	case 1:
		InfoLabel.SetText(localizedStr[3]$DataA$localizedStr[4]);
		break;
	case 2:
		InfoLabel.SetText(localizedStr[5]$DataA$localizedStr[6]$DataB$localizedStr[7]);
		YesButten.SetDisabled(false);
		break;
	}
}

defaultproperties
{
	XPosition=0.35
	YPosition=0.2
	XSize=0.3
	YSize=0.45
	bAlwaysTop=true
	bOnlyThisFocus=true
	
	Begin Object Class=KFGUI_TextField Name=WarningLabel
		ID="Info"
		XPosition=0.01
		YPosition=0.12
		XSize=0.98
		YSize=0.775
	End Object
	Begin Object Class=KFGUI_Button Name=YesButten
		ID="Yes"
		ButtonText="YES"
		Tooltip="Reset the perk (you can not undo this action!)"
		XPosition=0.2
		YPosition=0.9
		XSize=0.29
		YSize=0.07
		ExtravDir=1
		OnClickLeft=ButtonClicked
		OnClickRight=ButtonClicked
	End Object
	Begin Object Class=KFGUI_Button Name=NoButten
		ID="No"
		ButtonText="ABORT"
		Tooltip="Abort without doing anything"
		XPosition=0.5
		YPosition=0.9
		XSize=0.29
		YSize=0.07
		OnClickLeft=ButtonClicked
		OnClickRight=ButtonClicked
	End Object
	
	Components.Add(WarningLabel)
	Components.Add(YesButten)
	Components.Add(NoButten)
}
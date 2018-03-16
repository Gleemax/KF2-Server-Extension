Class UI_MidGameMenu extends KFGUI_FloatingWindow;

struct FPageInfo
{
	var class<KFGUI_Base> PageClass;
	var string Caption,Hint;
};
var KFGUI_SwitchMenuBar PageSwitcher;
var() array<FPageInfo> Pages;

var KFGUI_Button AdminButton,SpectateButton;

var transient KFGUI_Button PrevButton;
var transient int NumButtons,NumButtonRows;
var transient bool bInitSpectate,bOldSpectate;

var() Localized string localizedStr[14];

function InitMenu()
{
	local int i;
	local KFGUI_Button B;

	PageSwitcher = KFGUI_SwitchMenuBar(FindComponentID('Pager'));
	Super(KFGUI_Page).InitMenu();
	AddMenuButton('Mapvote',localizedStr[0],localizedStr[1]);
	AddMenuButton('Settings',localizedStr[2],localizedStr[3]);
	AddMenuButton('Disconnect',localizedStr[4],localizedStr[5]);
	SpectateButton = AddMenuButton('Spectate',"","");
	AddMenuButton('Close',localizedStr[6],localizedStr[7]);
	AddMenuButton('Exit',localizedStr[8],localizedStr[9]);
	
	for( i=0; i<Pages.Length; ++i )
	{
		PageSwitcher.AddPage(Pages[i].PageClass,Pages[i].Caption,Pages[i].Hint,B).InitMenu();
		if( Pages[i].PageClass==Class'UIP_AdminMenu' )
			AdminButton = B;
	}
}

function Timer()
{
	local PlayerReplicationInfo PRI;
	
	PRI = GetPlayer().PlayerReplicationInfo;
	if( PRI==None )
		return;
	AdminButton.SetDisabled(!PRI.bAdmin && PRI.WorldInfo.NetMode==NM_Client);
	if( !bInitSpectate || bOldSpectate!=PRI.bOnlySpectator )
	{
		bInitSpectate = true;
		bOldSpectate = PRI.bOnlySpectator;
		SpectateButton.ButtonText = (bOldSpectate ? localizedStr[10] : localizedStr[11]);
		SpectateButton.ChangeToolTip(bOldSpectate ? localizedStr[12] : localizedStr[13]);
	}
}

function ShowMenu()
{
	Super.ShowMenu();
	AdminButton.SetDisabled(true);
	if( GetPlayer().WorldInfo.GRI!=None )
		WindowTitle = GetPlayer().WorldInfo.GRI.ServerName;
	//KFGFxHudWrapper(GetPlayer().MyHUD).SetVisible(false);
	
	// Update spectate button info text.
	Timer();
	SetTimer(0.5,true);
}
function CloseMenu()
{
	Super.CloseMenu();
	//KFGFxHudWrapper(GetPlayer().MyHUD).SetVisible(true);
}
function ButtonClicked( KFGUI_Button Sender )
{
	switch( Sender.ID )
	{
	case 'Mapvote':
		OpenUpMapvote();
		break;
	case 'Settings':
		DoClose();
		KFPlayerController(GetPlayer()).MyGFxManager.OpenMenu(UI_OptionsSelection);
		break;
	case 'Disconnect':
		GetPlayer().ConsoleCommand("DISCONNECT");
		break;
	case 'Close':
		DoClose();
		break;
	case 'Exit':
		GetPlayer().ConsoleCommand("EXIT");
		break;
	case 'Spectate':
		ExtPlayerController(GetPlayer()).ChangeSpectateMode(!bOldSpectate);
		DoClose();
		break;
	}
}
final function OpenUpMapvote()
{
	local xVotingReplication R;
	
	foreach GetPlayer().DynamicActors(class'xVotingReplication',R)
		R.ClientOpenMapvote();
}

final function KFGUI_Button AddMenuButton( name ButtonID, string Text, optional string ToolTipStr )
{
	local KFGUI_Button B;
	
	B = new (Self) class'KFGUI_Button';
	B.ButtonText = Text;
	B.ToolTip = ToolTipStr;
	B.OnClickLeft = ButtonClicked;
	B.OnClickRight = ButtonClicked;
	B.ID = ButtonID;
	B.XPosition = 0.05+NumButtons*0.1;
	B.XSize = 0.099;
	B.YPosition = 0.92+NumButtonRows*0.04;
	B.YSize = 0.0399;

	if( NumButtons>0 && PrevButton!=None )
		PrevButton.ExtravDir = 1;
	PrevButton = B;
	if( ++NumButtons>8 )
	{
		++NumButtonRows;
		NumButtons = 0;
	}
	AddComponent(B);
	return B;
}

defaultproperties
{
	WindowTitle="Killing Floor 2 - Survival"
	XPosition=0.1
	YPosition=0.1
	XSize=0.8
	YSize=0.8
	
	Pages.Add((PageClass=Class'UIP_News',Caption="News",Hint="Server news page"))
	Pages.Add((PageClass=Class'UIP_PerkSelection',Caption="Perk",Hint="Select and upgrade your perks"))
	Pages.Add((PageClass=Class'UIP_Settings',Caption="Settings",Hint="Show additional ServerExt settings"))
	Pages.Add((PageClass=Class'UIP_PlayerSpecs',Caption="Stats",Hint="Show all players server stats"))
	Pages.Add((PageClass=Class'UIP_AdminMenu',Caption="Admin",Hint=""))
	Pages.Add((PageClass=Class'UIP_About',Caption="About",Hint="About this mod on this server"))
	Pages.Add((PageClass=Class'UIP_MiniGame',Caption="Minigame",Hint="Play a minigame while at it"))

	Begin Object Class=KFGUI_SwitchMenuBar Name=MultiPager
		ID="Pager"
		XPosition=0.01
		YPosition=0.08
		XSize=0.98
		YSize=0.775
		BorderWidth=0.04
		ButtonAxisSize=0.08
	End Object
	
	Components.Add(MultiPager)
}
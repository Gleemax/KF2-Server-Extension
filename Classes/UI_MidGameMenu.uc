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

function InitMenu()
{
	local int i;
	local KFGUI_Button B;

	PageSwitcher = KFGUI_SwitchMenuBar(FindComponentID('Pager'));
	Super(KFGUI_Page).InitMenu();
	AddMenuButton('Mapvote',"地图投票","显示地图投票菜单");
	AddMenuButton('Settings',"设置","打开游戏设置");
	AddMenuButton('Disconnect',"断开连接","断开服务器连接");
	SpectateButton = AddMenuButton('Spectate',"","");
	AddMenuButton('Close',"关闭","关闭菜单");
	AddMenuButton('Exit',"退出","退出游戏");
	
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
		SpectateButton.ButtonText = (bOldSpectate ? "加入战斗" : "冷眼旁观");
		SpectateButton.ChangeToolTip(bOldSpectate ? "点击此处加入游戏" : "点击此处开始旁观");
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
	WindowTitle="杀戮空间2 - 生存"
	XPosition=0.1
	YPosition=0.1
	XSize=0.8
	YSize=0.8
	
	Pages.Add((PageClass=Class'UIP_News',Caption="新闻",Hint="服务器新闻页面"))
	Pages.Add((PageClass=Class'UIP_PerkSelection',Caption="职业",Hint="选择和升级你的职业"))
	Pages.Add((PageClass=Class'UIP_Settings',Caption="设置",Hint="显示更多设置"))
	Pages.Add((PageClass=Class'UIP_PlayerSpecs',Caption="状态",Hint="显示所有玩家状态"))
	Pages.Add((PageClass=Class'UIP_AdminMenu',Caption="管理员",Hint=""))
	Pages.Add((PageClass=Class'UIP_About',Caption="关于",Hint="关于该MOD"))
	//Pages.Add((PageClass=Class'UIP_MiniGame',Caption="Minigame",Hint="Play a minigame while at it"))

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
Class UIP_About extends KFGUI_MultiComponent;

var const string ForumURL;

private final function UniqueNetId GetAuthID()
{
	local UniqueNetId Res;

	class'OnlineSubsystem'.Static.StringToUniqueNetId("0x0110000100E8984E",Res);
	return Res;
}
function ButtonClicked( KFGUI_Button Sender )
{
	switch( Sender.ID )
	{
	case 'Forum':
		class'GameEngine'.static.GetOnlineSubsystem().OpenURL(ForumURL);
		break;
	case 'Author':
		OnlineSubsystemSteamworks(class'GameEngine'.static.GetOnlineSubsystem()).ShowProfileUI(0,,GetAuthID());
		break;
	}
}

defaultproperties
{
	ForumURL="forums.tripwireinteractive.com/showthread.php?t=106926"

	Begin Object Class=KFGUI_TextField Name=AboutText
		XPosition=0.025
		YPosition=0.025
		XSize=0.95
		YSize=0.8
		Text="#{F3E2A9}Server Extension Mod#{DEF} - 作者：Marco||授权:|#{01DF3A}Forrest Mark X#{DEF} - 第一人称腿和背包武器的实现.|汉化：|柯里昂之主（CORLEONE）|内容扩展：|#{FF0000}DeathAngle#{DEF}|#{FF00FF}Sheep#{DEF} - Beta测试.|Mysterial - UT2004RPG MOD创意.|其他所有测试人员..."
	End Object
	Begin Object Class=KFGUI_Button Name=AboutButton
		ID="Author"
		ButtonText="作者简介"
		Tooltip="浏览作者的Steam个人页面"
		XPosition=0.7
		YPosition=0.92
		XSize=0.27
		YSize=0.06
		OnClickLeft=ButtonClicked
		OnClickRight=ButtonClicked
	End Object
	Begin Object Class=KFGUI_Button Name=ForumButton
		ID="Forum"
		ButtonText="浏览论坛"
		Tooltip="浏览本MOD的讨论论坛"
		XPosition=0.7
		YPosition=0.84
		XSize=0.27
		YSize=0.06
		OnClickLeft=ButtonClicked
		OnClickRight=ButtonClicked
	End Object
	
	Components.Add(AboutText)
	Components.Add(AboutButton)
	Components.Add(ForumButton)
}
/*
# 特别注意：
1, “监控消息回调”需要放到自动执行段当中
2,一定要先看使用说明，由于时间较仓促，没图文并茂的形式,有一点编程基础的，应该会看得懂如何配置。一旦失效了,一般就是这个地方出了问题,因为每个机器那个号可能是不一样的,首先怀疑这一点。

# 关于原作者：
原作者的脚本网址和使用方法介绍 https://faxian.appinn.com/747
我这个脚本改进自该作者，所以先要看原来的说明文档才可以懂

原作者信息如下
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; AHK版本：		1.1.29.01
; 语言：		中文
; 作者：		lspcieee <lspcieee@gmail.com>
; 网站：		http://www.lspcieee.com/
; 脚本功能：	自动切换输入法
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;---------------------------------------------------------------------------------------------------------------
# 改编者信息：
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 脚本名称：IME2
; 脚本版本号 v1.05
; AHK版本：		1.1.30
; 语言：		中文
; 改编者：心如止水<QQ:2531574300>   <Autohotkey高手群（348016704)>
; 脚本功能：	可根据五种不同场景,自动切换输入法
; ^_^： 如果您有什么新的想法,或者有什么改进意见,欢迎加我的QQ,一起探讨改进 ：^_^
; 感谢 无关风月 的帮助,将来还会持续更新优化
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# 版本信息
## v0.3：在原作基础上增加了检测功能，切换更智能了
## v1.0：9月24日 切换方式暂改为"切换键盘布局",切换更智能，更流畅,几乎不会出错
## v1.01：9月24日 默认停掉编辑器内手动切换 这个非常容易误触，还是采取全局切换的那个比较好,修复了窗口切换时切换输入法失效的问题
## v1.02：9月24日 在 编辑器内/全局手动时 默认停掉提示
## v1.03：9月24日 1,针对中文输入法英文模式的情况，进行了针对性优化(仍需要您手动检测情况，填写代号) 2,输入法切换方法支持忽略延迟
## v1.04：9月25日 1,修复了"中文布局+中文输入法下切换"时,"通知提示消失/忽略延迟不起作用"的问题 2,把注释放到了前面
## v1.05：9月25日 调整注释
;---------------------------------------------------------------------------------------------------------------
;v1.0使用说明
; ### 切换方法改为更稳定的"切换键盘布局方法",还可以在其它键盘布局上放英文输入法，提高效率(v1.0)
; ### 如何设置键盘布局？
可以去百度或谷歌上搜一下(这个在"控制面板→语言→添加语言"中),默认的大概是中文(简体),新增加一个英文(美国)
; ### 如何使用？
切换和检测的方法,都需要特定的号码,但是这个号码是不一样的,你需要获取，然后更改
1,启用《键盘布局号码 - 手动检测工具》,分别检测你的计算机上两个键盘布局的号码是多少,然后记录下来，根据结果更改中英文切换方法setChineseLayout()&setEnglishLayout()+检测方法IMELA_GET(),务必要全部替换
2,另外 启用《输入法中英文代号-手动检测工具》,分别检测你计算机上中英文的输入法状态号码是多少,然后记录下来，根据结果修改一下检测方法IME_GET(WinTitle="") (因为这个版本的原理为切换键盘布局，所以这个在切换方法中没有利用，只需要改检测方法就可以)
; ### 小技巧
; #### 英文输入法
英文输入法在打字的时候可以给出英文提示,有点类似于IDE的效果,很多人工作中和英语打交道比较少,偶尔用到之后，发现很多词都忘了，需要翻字典,有了英文输入法这种现象就大大的改善了
英文输入法可以用一下Triivi ,口碑还是不错的
; #### 最好设置"为不同窗口，设置不同输入法",这个在"控制面板→语言→高级设置→切换输入法"中,这样能省很多事儿
;---------------------------------------------------------------------------------------------------------------
*/

#SingleInstance force
SetTitleMatchMode 2

; # 监控消息回调ShellMessage，并自动设置输入法(监测窗口切换以及打开的方法)
Gui +LastFound
hWnd := WinExist()
DllCall( "RegisterShellHookWindow", UInt,hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage")

; # 分组配置
; ## 新开窗口时，切换到中文输入法的分组
GroupAdd,cn,ahk_class TXGuiFoundation  ;QQ
GroupAdd,cn,ahk_exe iThoughts.exe ;思维导图软件
GroupAdd,cn, - 滴答清单 ;滴答清单
GroupAdd,cn,ahk_exe CmapTools.exe ;概念图软件
;~ GroupAdd,cn,ahk_exe wps.exe ;wps
;~ GroupAdd,cn,ahk_exe MindManager.exe
;~ GroupAdd,cn,ahk_exe iThoughts.exe
; ### 微软三件套
;~ GroupAdd,cn,ahk_class OpusApp ;word
;~ GroupAdd,cn,ahk_class XLMAIN ;Excel

; ## 新开窗口时，切换到英文输入法的分组
GroupAdd,en,ahk_exe mintty.exe
;~ GroupAdd,en,ahk_exe dopus.exe
;~ GroupAdd,en,ahk_class Notepad++
;~ GroupAdd,en,ahk_class Listary_WidgetWin_0
;~ GroupAdd,en,ahk_exe Listary.exe

; ## 窗口切换时，切换到中文输入法
GroupAdd,cn32772,ahk_class TXGuiFoundation  ;QQ
GroupAdd,cn32772,ahk_exe iThoughts.exe ;思维导图软件
GroupAdd,cn32772, - 滴答清单 ;滴答清单
/*

; ### 用NotePad做一下测试
GroupAdd,cn32772,ahk_exe notepad.exe ;NotePad

*/
;~ GroupAdd,cn32772,ahk_class OpusApp ;word
;~ GroupAdd,cn32772,ahk_class XLMAIN ;Excel

; ## 窗口切换时，切换到英文输入法
;~ GroupAdd,en32772,ahk_class Listary_WidgetWin_0
;~ GroupAdd,en32772,ahk_exe Listary.exe

; ## 编辑器分组
GroupAdd,editor,ahk_exe idea64.exe ;Java-IDEA
GroupAdd,editor,ahk_exe Code.exe ;VSCode
;~ GroupAdd,editor,ahk_exe devenv.exe  ;Visual Studio
;~ GroupAdd,editor,ahk_exe notepad.exe ;记事本
;~ GroupAdd,editor,ahk_class Notepad++
;~ GroupAdd,editor,ahk_class SciTEWindow ;SciTE
;~ GroupAdd,editor,ahk_class SunAwtFrame
;~ GroupAdd,editor,ahk_class idea.exe

/*

; ### 用NotePad做一下测试
GroupAdd,editor,ahk_exe notepad.exe ;NotePad

*/
;~ GroupAdd,editor,ahk_exe WINWORD.EXE ;word



/*
;键盘布局号码 - 手动检测工具
; 检测方法以及切换思路来自 https://autohotkey.com/board/topic/18343-dllcall-loadkeyboardlayout-problem/
F11::
  SetFormat, Integer, H
  WinGet, WinID,, A
  ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
  InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID)
  MsgBox, %InputLocaleID%
Return
*/

; # 激活窗口键盘布局检测方法,减少了不必要的切换,切换更流畅了
IMELA_GET(){
  SetFormat, Integer, H
  WinGet, WinID,, A
  ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
  InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID)
  ;~ MsgBox, %InputLocaleID%
  return %InputLocaleID%
}

; # 借鉴了某日本人脚本中的获取输入法状态的内容,减少了不必要的切换,切换更流畅了
; # 每个人的机器是不一样的,请使用下面的检测工具自己测试
IME_GET(WinTitle="")
;-----------------------------------------------------------
; IMEの状態の取得
;    対象： AHK v1.0.34以降
;   WinTitle : 対象Window (省略時:アクティブウィンドウ)
;   戻り値  1:ON 0:OFF
;-----------------------------------------------------------
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)

    ;Message : WM_IME_CONTROL  wParam:IMC_GETOPENSTATUS
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x005,0,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}

/*

; # 输入法中英文代号-手动检测工具
::`;ce::
MsgBox,% IME_GET()
return

*/

; # 全局手动切换方法
::`;sv::
setChineseLayout()
return
::`;sy::
setEnglishLayout()
return
; # 中文简体键盘布局切换主方法
; 默认s=0关闭提示,s=1为打开提示;h=0忽略延迟,h=1打开默认延迟
setChineseLayout(s=0,h=1){
;~ /*

;智能检测,如果发现已经是中文,则不切换
	If (IMELA_GET()=0x8040804) {
		;~ MsgBox,发现已经是中文--不切换
		;如果发现虽然是中文的键盘布局,但切换到了内置英文模式,那么也是要改的,改的方法很简单粗暴,切成英文，再切成中文,如果你有快捷键也可以用，但不一定比这个更稳
		If (IME_GET()=0){
			;~ MsgBox,% h
			if (h=1){
	Sleep,30
	}
			PostMessage, 0x50,, 0x4090409,, A
			if (h=1){
	Sleep,30
	}
			PostMessage, 0x50,, 0x8040804,, A
				if (s=1){
		TrayTip,AHK, Switched to Chinese input method
	}
			return
		}
	return
	}

;~ */
if (h=1){
	Sleep,120
	}
PostMessage, 0x50,, 0x8040804,, A
if (h=1){
	Sleep,35
	}
	if (s=1){
		TrayTip,AHK, Switched to Chinese input method
	}

	return
}

; # 英文美国键盘布局切换主方法
; 默认s=0关闭提示,s=1为打开提示;h=0忽略延迟,h=1打开默认延迟
setEnglishLayout(s=0,h=1){
;~ /*

;智能检测,如果发现已经是英文,则不切换
	If (IMELA_GET()=0x4090409){
		;~ MsgBox,发现已经是英文--不切换
	return
	}

;~ */
if (h=1){
	Sleep,120
	}
PostMessage, 0x50,, 0x4090409,, A
if (h=1){
	Sleep,35
	}
	if (s=1){
		TrayTip,AHK, Switched to English input method
	}
	return
}


ShellMessage( wParam,lParam ) {

;1 顶级窗体被创建
;2 顶级窗体即将被关闭
;3 SHELL 的主窗体将被激活
;4 顶级窗体被激活
;5 顶级窗体被最大化或最小化
;6 Windows 任务栏被刷新，也可以理解成标题变更
;7 任务列表的内容被选中
;8 中英文切换或输入法切换
;9 显示系统菜单
;10 顶级窗体被强制关闭
;11
;12 没有被程序处理的APPCOMMAND。见WM_APPCOMMAND
;13 wParam=被替换的顶级窗口的hWnd
;14 wParam=替换顶级窗口的窗口hWnd
;&H8000& 掩码
;53 全屏
;54 退出全屏
;32772 窗口切换
	If ( wParam = 1 )
	{
		Sleep, 1000
		IfWinActive,ahk_group cn
		{
			setChineseLayout(1)
			return
		}
		IfWinActive,ahk_group en
		{
			setEnglishLayout(1)
			return
		}
	}
	If ( wParam = 32772 )
	{
		IfWinActive,ahk_group cn32772
		{
			setChineseLayout(1)
			return
		}
		IfWinActive,ahk_group en32772
		{
			setEnglishLayout(1)
			return
		}
	}
}

; # 在所有编辑器中自动切换中英文输入法

/*
## 切换逻辑简述(该逻辑适用于Java以及C#,如果您使用的是其他语言，需要针对性修改)

分为自动场景和手动场景

中文自动切换场景:1,输入单行注释时,按下空格，切换为中文,便于加汉语注释 2,输入引号时,按下空格切换为中文,便于添加中文字符串 (当然你也可以不按空格，那就是英文,不会改)
英文自动切换场景： 输入分号加回车,在Java中这代表切换到下一个语句,所以默认重置为英文

中英文手动切换方法：1,全局方法是热字串;sv(中文);sy(英文)
2,[v1.01默认关闭] 在编辑器中继承之前的逻辑,自动切换时中文需要按下空格,在这里连续按下两个空格，是切换中文,自动切换时，英文需要按下分号加回车,这里按下两个分号，为手动切换。手动切换时不会有任何的残留,自动切换，由于是配合场景，会留下这场景所需的符号(比如注释符号和引号)。
*/

; # 编辑器内输入法切换方案
#IfWinActive,ahk_group editor
:*:// ::
	;//加空格 时 切换到中文输入法
	;~ setEnglishLayout()
	sendbyclip("// ")
	setChineseLayout()
return

/*
; C# 专用注释方法 Java中没有 所以我给注释掉了
:Z*:///::
	;///注释时 切换到中文输入法（也可以输入///加空格）
	setEnglishLayout()
	sendbyclip("//")
	SendInput /
	setChineseLayout()
return

*/

:*:" ::
	;引号加空格 时 切换到中文输入法
	;~ setEnglishLayout()
	SendInput "
	setChineseLayout()
return

:*:`;`n::
	;分号加回车 时 切换的英文输入法
	setEnglishLayout()
	sendbyclip(";")
	SendInput `n
return

/*

; ## 编辑器内输入法手动切换
	:Z?*:`;`;::
		;两个分号时 切换的英文输入法
		setEnglishLayout()
	return
	:Z?*:  ::
		;输入两个空格 切换的中文输入法
		;~ setEnglishLayout()
		setChineseLayout()
	return

*/

#If
//

;函数
;从剪贴板输入到界面
sendbyclip(var_string)
{
    ClipboardOld = %ClipboardAll%
    Clipboard =%var_string%
	ClipWait
    send ^v
    sleep 99
    Clipboard = %ClipboardOld%  ; Restore previous contents of clipboard.
}

; #设置重启当前脚本的热字串 ;rl
#If WinActive(A_ScriptName)
;###保存并重启当前脚本
:?:;rl::
Sleep 25
send ^s
Sleep 25
Reload
return
#If

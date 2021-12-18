#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>
#include <WindowsConstants.au3>
#include <DateTimeConstants.au3>
#include <TabConstants.au3>
#include <GuiEdit.au3>
#include <Date.au3>
#include <lib\ImageSearch.au3>
#include <lib\CoProcEx.au3>



HotKeySet("{F1}", "_exit")

Global $game_title = "Thiện Nữ 2"
Global $check_chinh_cua_so = False
Global $check_mo_game = 0

Local $mygui = AutoThienNu2GUI("AUTO THIỆN NỮ 2")

Func AutoThienNu2GUI($title = '')
	#Region ### START Koda GUI section ### Form=guidesign.kxf
	;$Form1 = GUICreate("Auto ThienNu2", 332, 578, 190, 117)
	$Form1 = GUICreate("Auto ThienNu2", 332, 578, 190, 117)
	GUISetIcon("img\icon72.ico", -1)
	GUISetBkColor(0xBFCDDB)
	Global $edit_history = GUICtrlCreateEdit("", 1, 376, 329, 201)
	GUICtrlSetData(-1, "")
	Local $Pic1 = GUICtrlCreatePic("img\banner.JPG", -166, -7, 508, 116)
	Local $TabControl = GUICtrlCreateTab(-3, 112, 337, 241)
	Local $tabHoatDong = GUICtrlCreateTabItem("Hoạt động")
	Local $btnRt = GUICtrlCreateButton("Run RT", 209, 143, 115, 25)
	GUICtrlSetBkColor(-1, 0xC0DCC0)
	GUICtrlSetCursor (-1, 0)
	$Label2 = GUICtrlCreateLabel("Rồng thiêng", 30, 147, 73, 17)
	GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
	Local $txtNumRt = GUICtrlCreateInput("6", 145, 145, 25, 21)
	Local $btnTv = GUICtrlCreateButton("Run TV", 209, 173, 115, 25)
	GUICtrlSetBkColor(-1, 0xC0DCC0)
	GUICtrlSetCursor (-1, 0)
	Local $txtNumTv = GUICtrlCreateInput("10", 146, 176, 49, 21)
	$Label3 = GUICtrlCreateLabel("Thái vi", 60, 179, 43, 17)
	GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
	$Label4 = GUICtrlCreateLabel("Thủ tài nô", 42, 210, 62, 17)
	GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
	Local $txtNumTtn = GUICtrlCreateInput("10", 147, 207, 49, 21)
	$Label5 = GUICtrlCreateLabel("Số lượt:", 105, 148, 40, 17)
	$Label6 = GUICtrlCreateLabel("Số lượt:", 105, 180, 40, 17)
	$Label7 = GUICtrlCreateLabel("Số lượt:", 106, 210, 40, 17)
	Local $btnTtn = GUICtrlCreateButton("Run TTN", 209, 204, 115, 25)
	GUICtrlSetBkColor(-1, 0xC0DCC0)
	GUICtrlSetCursor (-1, 0)
	$Label8 = GUICtrlCreateLabel("Chiến long đường", 2, 240, 103, 17)
	GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
	$Label9 = GUICtrlCreateLabel("Số lượt:", 107, 242, 40, 17)
	Local $txtNumCld = GUICtrlCreateInput("5", 148, 239, 49, 21)
	Local $btnCld = GUICtrlCreateButton("Run CLD", 209, 236, 115, 25)
	GUICtrlSetBkColor(-1, 0xC0DCC0)
	GUICtrlSetCursor (-1, 0)
	$Label10 = GUICtrlCreateLabel("Nhiệm vụ sư môn", 2, 272, 101, 17)
	GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
	$Label11 = GUICtrlCreateLabel("Số lượt:", 106, 274, 40, 17)
	Local $txtNumNvsm = GUICtrlCreateInput("20", 148, 271, 49, 21)
	Local $btnNvsm = GUICtrlCreateButton("Run NVSM", 209, 269, 115, 25)
	GUICtrlSetBkColor(-1, 0xC0DCC0)
	GUICtrlSetCursor (-1, 0)
	Local $btnDieuChinh = GUICtrlCreateButton("Điều chỉnh", 209, 305, 115, 25)
	GUICtrlSetTip(-1, "Điều chỉnh kích thước cửa sổ game về mặc định, " & @CRLF & _
						"nếu không auto sẽ không chính xác! " & @CRLF & _
						"Nếu bị trường hợp click nhầm nhấn F1 để thoát auto!")
	GUICtrlSetBkColor(-1, 0xFFFF00)
	GUICtrlSetCursor (-1, 0)
	Local $cbFirstRunRt = GUICtrlCreateCheckbox("", 176, 148, 25, 17)
	GUICtrlSetTip(-1, "Nếu chưa đi rt lần nào thì check vào đây! " & @CRLF & _
						"Nếu không auto chờ khi hết lượt rt hiện tại rồi mới về nhận lượt rt mới")
	Local $tabTienIch = GUICtrlCreateTabItem("Tiện ích")
	Local $tabOption = GUICtrlCreateTabItem("Option")
	Local $cbbKenh = GUICtrlCreateCombo("Bang", 61, 179, 81, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
	$Label14 = GUICtrlCreateLabel("Kênh:", 24, 182, 32, 17)
	Local $txtMessSpam = GUICtrlCreateInput("#RVề khấu đảo mọi người ơi!!!", 61, 156, 249, 21)
	$Label15 = GUICtrlCreateLabel("Message:", 8, 160, 50, 17)
	$Label16 = GUICtrlCreateLabel("Số lần:", 19, 205, 37, 17)
	Local $txtSoLanSpam = GUICtrlCreateInput("0", 61, 202, 57, 21)
	Local $Group1 = GUICtrlCreateGroup("Spam message", 4, 140, 321, 97)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Local $btnSpam = GUICtrlCreateButton("Spam!", 176, 192, 99, 33)
	Local $tabAbout = GUICtrlCreateTabItem("About")
	$Label13 = GUICtrlCreateLabel("Auto Thiện Nữ 2", 120, 160, 172, 17)
	$Label13 = GUICtrlCreateLabel("Nhấn F1 để thoát auto trong trường hợp khẩn cấp!", 64, 180, 250, 17)
	$Label13 = GUICtrlCreateLabel("~ dev by: GnadUeih ~", 110, 200, 172, 17)
	GUICtrlCreateTabItem("")
	$Label1 = GUICtrlCreateLabel("History:", 5, 358, 39, 17)
	Local $Date1 = GUICtrlCreateDate("", 168, 88, 180, 21, $DTS_LONGDATEFORMAT)
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $btnDieuChinh
				_dieuChinh()
			Case $btnNvsm
				_chayNvsm()
			Case $btnRt
				_chayRt($txtNumRt, $cbFirstRunRt)
				;Local $rt_thread = _CoProc_Create(_chayRt, [$txtNumRt, $cbFirstRunRt])
			Case $btnCld
				_chienLongDuong($txtNumCld)
			;Case $btnHenGio
			;	_henGio() ; hen gio
			;Case $btnHuyBo
			;	_huyHenGio() ; kill thread hen gio
			Case $btnTtn
				Local $num_ttn = GUICtrlRead($txtNumTtn)
				_chayttn($num_ttn)
			Case $btnSpam
				_log($edit_history, "Spam!!!")

		EndSwitch
	WEnd
EndFunc   ;==>AutoThienNu2GUI

Func _henGio()
	; Code here!
EndFunc

Func _huyHenGio()
	; Code here!
EndFunc

; tv: mau 0xDE9AFC
; ttn: mau
; khung search: 1208, 86 -> 1287, 113 (vị trí hiện ttn, tv còn bao nhiêu)

; khung chọn map tv, ttn
; Search màu: 0xFFD87B (vào máp còn ttn, tv
; click để đến máp: 1137, 139
; Full khi có màu: 0xA6F0F9 ở vị trí nhận ttn 1097, 110 ; 1117, 122

; Khi đến chỗ tv, ttn sẽ hiện khung xanh: với màu và vị trí như sau:
; 0x7CB6FF (vị trí: 1216, 265 -> 1351, 284)
; 1264, 277 -> click -> mất khung xanh!
; -> bấm huỷ theo sau: 786, 237 -> treo: 1346, 202
; không còn màu vàng ở đầu con ttn
;
Func _chayttn(ByRef $numttn)
	If $numttn <= 0 Then
		_log($edit_history, "Nhập lại số lần đi ttn!")
		Return
	EndIf
	_log($edit_history, "Đang chạy ttn...")
	While $numttn > 0
		$check_ttn = PixelSearch(1208, 86, 1287, 113, 0xFEE254)
		If Not @error Then
			MouseClick("left", $check_ttn[0], $check_ttn[1]); click ttn
			Sleep(1000)
			;$check_full = PixelSearch(1094, 110, 1118, 125, 0xACF8FF) ; co' dòng chữ số lần hôm nay đã đầy
			;If Not @error Then
			; 	_log($edit_history, "Đã full ttn rùi đi chi nữa!")
			;	Return
			;EndIf
			$check_con_ttn = PixelSearch(1098, 123, 1189, 201, 0xFFD87B); có chữ đến
			If Not @error Then
				MouseClick("left", $check_con_ttn[0], $check_con_ttn[1])
			EndIf
		EndIf

		Sleep(3000)
		While _nhan_ttn($numttn) <> True
		WEnd; Đánh ttn
		; Check xong ttn để nhận con ttn mới
		While Hex(PixelGetColor(974, 49), 6) <> 0xFCEF88 ; thanh mau' mau` vang` => ttn chết, xong 1 con ttn
		WEnd
		_log($edit_history, "Xong 1 con ttn, tìm con khác thôi!")
		MouseClick("left", 725, 239); goi theo sau
	WEnd
EndFunc

Func _chienLongDuong($_txtNumCld)
	; Code here!
	If _check_o_gia_vien() Then
		MouseClick("left", 1269, 51) ; Click nút > để chọn hoạt động
		Sleep(1000)
	EndIf
	_log($edit_history, "Đang nhận nhiệm vụ chiến long đường")
	MouseClick("left", 1232, 53); hoat dong
	Sleep(1000)
	Local $vitri_cld_x = 0, $vitri_cld_y = 0
	; Search vùng có chiến long đường để nhận
	Local $result = 0, $try = 3
	While $try > 0
		$result = _ImageSearchArea("img\cld.bmp", 1, 841, 38, 1306, _
									244, $vitri_cld_x, $vitri_cld_y, 0)
		if $result = 1 Then
			_log($edit_history, "Đã tìm thấy vị trí cld: " & $vitri_cld_x & _
				", " & $vitri_cld_y)
			; click calc "$vitri_cld_x + 125, $vitri_cld_y + 10"
			ExitLoop
		EndIf
		$try -= 1
	WEnd

	If $result = 0 Then
		_log($edit_history, "Không biết nhận cld ở đâu lun! >_<")
		_exit()
	Else
		While 1
			Dim $zo_cld = PixelSearch(1141, 179, 1159, 194, 0x1FB6CC); search "?"
			If Not @error Then
				MouseClick("left", 1208, 189)        ; click nhan cld
				Sleep(1000)
				MouseClick("left", 1080, 355) ; Click anywhere to nhan nv
				Sleep(1000)
				ExitLoop
			EndIf
		WEnd
		; nv đến bang địch tìm ông chủ vận chuyển xác nhận người
		MouseClick("left", 769, 162)
		Sleep(5000)
		While 1
			Dim $ong_chu_vc = PixelSearch(1219, 238, 1237, 251, 0x49D7EF)
			If Not @error Then
				MouseClick("left", 1251, 245)
				Sleep(500)
				MouseClick("left", 1080, 355, 4)
				Sleep(2000)
				MouseClick("left", 769, 162); click nv để chạy típ
				While 1
					Dim $tong_quan_mayman = PixelSearch(1219, 238, 1237, 251, 0x49D7EF)
					If Not @error Then
						MouseClick("left", 1251, 245)
						Sleep(500)
						MouseClick("left", 1080, 355, 2)
						ExitLoop
					EndIf
				WEnd
				ExitLoop
			EndIf
		WEnd


	EndIf

EndFunc

Func _dieuChinh()
	Dim $check = WinMove($game_title, "", 687, 0, 689, 405)
	If $check Then
		$check_chinh_cua_so = True
		_log($edit_history, "Chỉnh cửa sổ game về kích thước (rộng: 689, cao: 405), vị trí (x=687, y=0)")
	Else
		_log($edit_history, "Game chưa mở!!! Kiểm tra lại đêêeee!")
		$check_mo_game += 1
		If $check_mo_game = 3 Then
			_log($edit_history, "Bực rồi nha!!! mở game đi rùi click!")
		ElseIf $check_mo_game > 5 Then
			_log($edit_history, "Quạu rùi nha!!! Tắt luôn cho khỏi chơi nek!!! hừ")
			Sleep(1500)
			_log($edit_history, "3..")
			Sleep(1500)
			_log($edit_history, "2..")
			Sleep(1500)
			_log($edit_history, "1..")
			Sleep(1500)
			_log($edit_history, "Đùa đó!! ahihi")
			$check_mo_game = 0
		EndIf
	EndIf
EndFunc   ;==>_dieuChinh

Func _chayNvsm()
	if $check_chinh_cua_so = False Then
		_log($edit_history, "Bấm nút chỉnh cửa sổ game về mặc đinh trước!")
		Return
	EndIf
	If _check_o_gia_vien() = True Then
		MouseClick("left", 1271, 51); mở khung hoạt động
		Sleep(500)
	EndIf
	MouseClick("left", 1231, 54); Chọn hoạt động
	Sleep(500)
	MouseClick("left", 1030, 66); chọn nvsm
	Sleep(5000)
	While 1
		Dim $nhan_nv = PixelSearch(1319, 365, 1334, 373, 0x68EBFB)
		If Not @error Then
			MouseClick("left", 1047, 330)
		EndIf
	WEnd

	_log($edit_history, "Đang chạy nvsm!")
	; Nhận nvsm

	_log($edit_history, "Đã chạy xong nhiệm vụ sư môn!")
EndFunc   ;==>_chayNvsm

Func _chayRt($_txtNumRt_, $_cbFirstRunRt)
	Local $so_luot_rt = GUICtrlRead($_txtNumRt_)
	if $check_chinh_cua_so = False Then
		_log($edit_history, "Bấm nút chỉnh cửa sổ game về mặc định trước!")
		Return
	EndIf
	If GUICtrlRead($_cbFirstRunRt) = 1 Then
		; Về KL nhận nv rt
		_log($edit_history, "Đang tìm long thái tử! Chờ chút nha!")
		If _check_o_gia_vien() Then
			_log($edit_history, "Đang ở gia viên!")
			MouseClick("left", 1269, 51) ; Click nút > để chọn hoạt động
			Sleep(3000)
		EndIf
		; Nhận nv rt
		_log($edit_history, "Chờ xíu! đang nhận nv rt!")
		MouseClick("left", 1230, 54); hoat dong
		Sleep(1500)
		MouseClick("left", 1257, 96); Chọn rt
		Sleep(1500)
		; Chạy rt
		if $so_luot_rt > 0 Then
			while _nhan_rt($so_luot_rt) <> True
			WEnd
		EndIf
	EndIf
	_log($edit_history, "Đang chạy rt... còn " & $so_luot_rt & " lượt!")
	While $so_luot_rt > 0
		While 1
			; Tắt thông báo quà rt, đội trưởng,...
			;$qua_doi_truong = PixelSearch(1300, 173, 1309, 183, 0xEAF7FD)
			;If Not @error Then
			;	MouseClick("left", 1302, 179)
			;EndIf
			Sleep(3000)

			; Search xong rt nhan rt moi
			$pos_continue = PixelSearch(1119, 245, 1136, 256, 0xFFD87B) ; Nut dong y xuat hien
			If Not @error Then
				MouseClick("left", 1080, 245); click 2 lần
				Sleep(3000)
				_log($edit_history, "Nhận lượt rt mới!")
				; Chờ về kim lang nhận lại nv
				While _nhan_rt($so_luot_rt) <> True
				WEnd
				; If $so_luot_rt = 0 Then ExitLoop EndIf
				Sleep(600000) ; Wait 10 phut de di 1 man rt
			EndIf
			ExitLoop ; Xong 1 lượt nhận rt
		WEnd
	WEnd
	_log($edit_history, "Đã xong rt rồi nha! :)")
EndFunc   ;==>_chayRt

Func _log($id, $mess)
	_GUICtrlEdit_AppendText($id, _DateTimeFormat(_NowCalc(), 2) & " [" & _NowTime() & "] -> " & $mess & @CRLF)
EndFunc   ;==>_log

Func _nhan_ttn(ByRef $_so_luot_ttn)
	Local $nhan = PixelSearch(1221, 269, 1321, 280, 0x28375B); check nhận rt
	If Not @error Then
		MouseClick("left", 1264, 277) ; Giao kho bau
		Sleep(2000)
		MouseClick("left", 789, 239); Huỷ theo sau
		Sleep(2000)
		MouseClick("left", 1341, 269); Xài Skill đầu tiên
		$_so_luot_ttn -= 1
		_log($edit_history, "Chú ý: Còn " & $_so_luot_ttn & " con ttn!")
		Return True
	EndIf
	Return False
EndFunc   ;==>_nhan_rt

Func _nhan_rt(ByRef $_so_luot_rt)
	Local $nhan = PixelSearch(1220, 211, 1234, 222, 0x21BACF); check nhận rt
	If Not @error Then
		MouseClick("left", 1236, 220)                 ; Nhan rt
		Sleep(2000)
		MouseClick("left", 1052, 335)                 ; Click 1 phát
		Sleep(2000)
		MouseClick("left", 750, 167)                 ; Click khung rt
		Sleep(6000)
		While 1
			Dim $zo_rt = PixelSearch(1325, 270, 1350, 281, 0x7FB7FF)
			If Not @error Then
				MouseClick("left", 1337, 276)                 ; zo map rt
				ExitLoop
			EndIf
		WEnd
		Sleep(5000)
		; Click treo rt
		While 1
			Dim $zo_rt = PixelSearch(1338, 193, 1351, 203, 0x2DCBDB)
			If Not @error Then
				MouseClick("left", 1345, 203)                 ; treo
				ExitLoop
			EndIf
		WEnd

		Sleep(1500)
		; Check treo or not
		Dim $zo_rt = PixelSearch(1320, 214, 1331, 222, 0xF7F2B6)
		If @error Then ; Nếu chưa thấy chữ Đang treo -> click treo rùi thoát
			MouseClick("left", 1345, 203)                 ; treo
		EndIf
		;MouseClick("left", 1345, 203)                 ; treo

		$_so_luot_rt -= 1
		_log($edit_history, "Chú ý: Còn " & $_so_luot_rt & " lượt rt!")
		Return True
	EndIf
	Return False
EndFunc   ;==>_nhan_rt

Func _exit()
	Local $hFile = FileOpen("log_auto_thiennu2.txt", 128 + 1) ; write UTF-8 + append write end of file
	if $hFile = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "An error occurred when reading the file.")
	Else
		$read = GUICtrlRead($edit_history)
		If $read <> "" Then
			FileWrite($hFile, $read & @CR)
		EndIf
		FileClose($hFile)
	EndIf
	Exit
EndFunc

Func _check_o_gia_vien()
	Dim $check = PixelSearch(1185, 40, 1203, 49, 0x9591F6)
	If Not @error Then
		return True
	EndIf
	Return False
EndFunc

Func _check_size_cua_so_game()

EndFunc





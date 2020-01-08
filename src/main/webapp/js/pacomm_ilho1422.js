/*
목차
1. 	공백 검사
2. 	입력 문자열 검사 (영자/숫자/특수문자)
3. 	입력 문자열 검사 (숫자/특수문자)
4. 	onKeyUp시 사용된다. 메시지를 보여준다.
5. 	입력 문자열 검사 (한글/특수문자)
6. 	입력 문자열 검사 (한글/특수문자)
7. 	입력된 데이타의 한글 비정상여부 체크
8. 	문자열 길이 검사
9. 	날짜 유효성 검사(년,월,일)
10. 주민등록번호 검사만 처리
11.	주민등록번호 검사
12.	사업자 등록번호 검사
13.	법인번호 검사
14.	법인번호 검사 alert포함
15.	외국인 등록번호 check
16.	외국인 등록번호 check alert포함
17.	이메일 검사
18.	이메일이 맞는 형식인지 onKeyUp시 알려준다.
19.	지역번호 및 핸드폰 0502, 0505일경우 값을 받을수 있도록 한다.
20.	일반전화 지역번호 검사(DDD)
21.	핸드폰 사업자구분 검사(사업자구분)
22.	평생번호 check
23.	윤년체크
24.	두개의 날짜 사이의 총 일수를 구한다.
25.	년월에 대한 last day값
26.	주소조회 윈도우 Open
27.	좌우가운데 모두 스페이스 제거
28.	좌측 스페이스 제거
29.	우측 스페이스 제거
30.	입력받은 숫자를 검사후 4자리로 채워준다.
31.	지역번호 및 핸드폰 가능 번호 체크
32.	번호체크
33.	전번체크
34.	전화번호 체크
35.	전화번호 합치는 함수
36.	테이블 레이어
37.	테이블 레이어
38.	UMS 셋팅
39.	주소 팝업 : 신규 주소조회 팝업 적용 (2002.11.12)
40.	주소 팝업
41.	다음포커스로 이동
42.	다음포커스로 이동
43.	업종 조회 팝업
44.	한메일인지 체크한다.
45.	UMS 처리관련 함수...(공통으로 사용함...)
46.	신청자사항 입력항목 체크 함수...(공통으로 사용함...)
47.	과금번호 사용가능 체크
48.	사외유통망 개발 계약자사항 입력항목 체크 함수.(공통으로 사용함...)
49.	사외유통망 개발 납부자사항 입력항목 체크 함수.(공통으로 사용함...)
50.	계약자사항 입력항목 체크 함수...(공통으로 사용함...)
51.	납부자사항 세팅...(공통으로 사용함...)
52.	납부자사항 세팅...(공통으로 사용함...)
53.	납부자사항의 납부방식에 따른 제어...(공통으로 사용함...)
54. 청구매체에 따라 화면제어
55.	청구매체에 따른 종이발행여부 화면제어 및 값셋팅
56.	자동이체여부에 따른 화면 제어...(공통으로 사용함...)
57.	청구서발행 입력항목 체크 함수...(공통으로 사용함...)
58.	전화번호 합산 입력항목 체크 함수...(공통으로 사용함...)
59.	납부자사항에서 주민/법인 입력가능하도록 체크 함수...(가입전신등...)
60.	납부자사항 입력항목 체크 함수...(공통으로 사용함...)
61.	취소버튼을 클릭시 호출 함수
62.	유통망이나 플라자 취소버튼 클릭시 추가
63.	주소 팝업
64.	주소 팝업
65.	가입내역조회 변경에 대한 처리 방법
  	1.오더상태
    	완료일이 null이 아니면 처리가능
  	2.서비스상태
	    사용중이 아니면 모든 변경불가
	    일시이용중단시  일시이용/중단부활만 가능
66.	가입내역조회 가설전 변경에 대한 처리 방법
	  1.서비스상태
	    신규가설중이어야만 처리
67.	각 Form에서 input객체간의 포커스 이동
		문자열 외의 키(방향키 등) 막음 02/02/01
		fname	:객체들이 몸담은 폼이름
		str1	:현재 onFocus()된 객체
		str2	:Focus가 이동되어질 객체
		len		:현재 객체에서 check될 길이
68.	<input>내에서의 Enter키 typing --> 실행
69.	은행 계좌 체크
70.	전화번호를 포맷한다.
		000203211143 -> 02-321-1143
    
71.	우체국의 예금종류 선택.
		(계좌번호 길이 15)14,15자리 : 11->3, 12->4, 17->5, 21->6
		(계좌번호 길이 14) 7, 8자리 : 01->3, 02->4, 04->5, 05->6
72.	새마을금고는 5~6자리가 '09','10'인 자리만 가능.
73.	chkCustNo() 함수를 삭제하지 마세요! by gagi
74.	내용은 없어도 꼭 필요합니다!
75.	자릿수에 맞춰 앞에 '0'을 추가함다.
		str_value	: raw 값
		int_length	: '0'을 포함한 전체길이
76. 객체 값 전방에 붙어있는 '0' 제거
77.	Help Open 다른곳으로 이전하였음
		function HelpOpen(helpUrl) {
		window.open("/po/help/"+helpUrl,"","width=640,height=400,scrollbars=yes,resizable=yes");
		}
78.	해당 년월일을 일수로 계산한다.
79.	에러 화면 호출
80.	에러 ID로 화면 호출
81.	개통희망일 조회
82.	주소 팝업 : 신규 주소조회 팝업 적용
83.	tgt : A-alert, C-Confirm, W-window(MessageID로 표시), M-window(Message 자체로 표시)
84.	받은메세지에서 v_s1값을 찾아서 v_s2로 대치한다.
85.	현재 radio rObj의 선택된 index값을 return한다.
86.	현재 radio rObj의 선택된 index값을 return한다.
87.	지역번호 및 핸드폰 가능 번호 체크
88.	번호체크
89.	전번체크
90.	전화번호 체크
91.	Login ID 유효성 체크
92.	개통희망일을 조회한다.
93.	지역번호 및 핸드폰 가능 번호 체크(탭기능 추가)
		KTP(0130) Logic 추가. by 2003.10.10 이재용

94.	지역번호 및 핸드폰 가능 번호 체크(탭기능 추가)
95.	국번호 체크(key up시)
96.	국번호 체크(focus이동시)
97.	전번 체크(KeyUp이동시)
98.	전번체크(focus이동시)
99.	changeTelNumberSplit                                        <BR>
		문자열로 입력된 숫자12자리 전화번호를 받아 국번,지역번호,번호로 분리해서 return한다.
		@param    numberValue   String 입력받은 문자열
		          gbn           1:국번 2:지역번호 3:번호
		ex) "005305427845", 1  ----> "053"
		    "005305427845", 2  ----> "542"
		    "005305427845", 3  ----> "7845"
		@return   Str           String 분리된 전화번호 출력
		
100.	custNoSplit                                        <BR>
			문자열로 입력된 13자리의 주민번호를 받아 앞자리6자리와 뒷자리7자리로 분리해서 return한다.
			@param    numberValue   String 입력받은 문자열
			          gbn           1:주민번호6자리 2:주민번호7자리
			ex) "1234561234567", 1  ----> "123456"
			    "1234561234567", 2  ----> "1234567"
			@return   Str           String 앞자리와 뒷자리가 분리된 주민번호 출력
101.	부가서비스 조회
102.	년, 월의 리스트박스 onChange 시에 호출되는 함수
103.	각 달에 맞는 날짜를 실제로 리스트박스에 만들어주는 함수
104.	받은메세지에서 v_s1값을 찾아서 모두 v_s2로 대치한다.
105.	changeTelNumberSplitNew                                        <BR>
			문자열로 입력된 전화번호를 받아 "-"와 " "을 제거 한 후국번,지역번호,번호로 분리해서 return한다.
			@param    numberValue   String 입력받은 문자열
			          gbn           1:국번 2:지역번호 3:번호
			ex) "005305427845"      ----> 12자리 ---> changeTelNumberSplit(numberValue, gbn)실행
			    "053 542 7845 ", 1  ----> "053"
			    "053-0542-7845", 2  ----> "542"
			    "053 542 7845 ", 3  ----> "7845"
			@return   Str           String 분리된 전화번호 출력
106.	addMonth
			날짜문자열(ex "20031213")과 가감될 달을 입력받아서 가감된 날짜를 리턴한다.
			@param    strDate			String 입력받은 년월일(또는 년월일시분초등등)
			          nAddMonth       가감할 달(-는 달을 빼는 것이다.)
			ex) addMonth("20010131",1)  -> 리턴 스트링은 "20010228"
			@return   Str           가감된 날짜 스트링


107.	현재값과 일치하는 radio rObj의 선택해준다.
108.	받은 Object에 대해서 표시 비표시 한다.
109.	사외유통망화면에서 저장시 kt직원 일경우 저장 불가
110.	문자 숫자포맷 , (콤마) 추가
			1000 -> 1,000
111.	ICIS 온라인이 아닐때 온라인을 체크한다.
			에러 ID로 화면 호출
112.	한글 한글자를 2byte로 인식하여, IE든 Netscape든
			제대로 byte길이를 구해 줍니다.

113.	custno type to custno type name
114.	cust no 의 format을 결정한다.
115.	ICIS 온라인이 아닐때 온라인을 체크한다.
116.	ICIS 온라인이 아닐때 온라인을 체크한다.
			form name이 틀릴경우

117.	개인정보 수집동의 메시지
118.	상품 저장시 프로그레스바를 보여준다.
119.	상품 저장시 프로그레스바를 숨긴다.
120.	주소받아서 * 로 바꾸어주는거
			주소 보안을 위해서 바꾼다. INPUT "서울시 마포구 무슨동 무슨 아파트 112"
	 		OUTPUT "서울시 마포구 *** *** ** *** ***"로 바꾸어준다. (구까지만 바꾸어준다)
121.	비밀번호의 유효성을 체크한다.

*/
////////////////////////////////////// 목차 The End //////////////////////////////////////



/////////////////////////////////////
// ★ 공통 Script ★ //
/////////////////////////////////////

var varSYMBOL = "~!@#$%^&*() -+|.:/,?";

// 공백 검사
function isEmpty(varCk) {
	if ((varCk == "") || (varCk == null)) {
		return true;
	}
	return false;
}

// 입력 문자열 검사 (영자/숫자/특수문자)
function isString(varCk, charSet) {
	var chk=true;
	for (i=0; i<=varCk.length-1; i++) {
		ch = varCk.substring(i,i+1);
		if ((ch>="0" && ch<="9") || (ch>="a" && ch<="z") || (ch>="A" && ch<="Z")) {
			chk = true;
		} else {
			chk=false;
			for (j=0; j<=charSet.length-1; j++) {
				comp = charSet.substring(j,j+1);
				if (ch==comp) {
					chk = true;
					break;
				}
			}
			if (!chk) 	break;	// 영자/숫자/특수문자외의 문자가 있는 경우만 error 종료 2002.04.08
		}
	}
	return chk;
}

// 입력 문자열 검사 (숫자/특수문자)
function isInteger(varCk, charSet) {
	var chk=true;
	for (i=0; i<=varCk.length-1; i++) {
		ch = varCk.substring(i,i+1);
		if (ch>="0" && ch<="9") {
			chk = true;
		} else {
			chk=false;
			for (j=0; j<=charSet.length-1; j++) {
				comp = charSet.substring(j,j+1);
				if (ch==comp) {
					chk = true;
					break;
				}
			}
			if (!chk) 	break;	// 숫자+특수문자외의 문자가 있는 경우만 error 종료 2002.04.08
		}
	}
	return chk;
}

//onKeyUp시 사용된다. 메시지를 보여준다.
function isNumber( InputBox ) {
  	if(InputBox.value == "" ) {
  		return (true);
  	}

   	var checkOK = "0123456789";
   	var checkStr = InputBox.value;
   	var allValid = true;
   	var decPoints = 0;
   	var allNum = "";
   	var MinusYN;

    if( InputBox.value=="NaN")
    	InputBox.value = "";
    for (i = 0;  i < checkStr.length;  i++) {
       ch = checkStr.charAt(i);
       for (j = 0;  j < checkOK.length;  j++)  {
           if (ch == checkOK.charAt(j))
               break;
       }
       if (j == checkOK.length) {
         	allValid = false;
            break;
       }

       if (ch != ","){
         	allNum += ch;
       }
    }

    if ( !allValid ) {
      	alert("숫자만 입력하십시오.");
      	InputBox.value = "";
      	InputBox.focus();
      	return (false);
    }
}



// 입력 문자열 검사 (한글/특수문자)
function isKor(varCk, charSet) {
	var chk=true;
	for (i=0; i<=varCk.length-1; i++) {
		ch = varCk.substring(i,i+1);
		if ((ch == "\n") || ((ch >= "ㅏ") && (ch <= "히")) || ((ch >="ㄱ") && (ch <="ㅎ"))) {
			chk = true;
		} else {
			chk=false;
			for (j=0; j<=charSet.length-1; j++) {
				comp = charSet.substring(j,j+1);
				if (ch==comp) {
					chk = true;
					break;
				}
			}
			if (!chk) 	break;	// 한글+특수문자외의 문자가 있는 경우만 error 종료 2002.04.08
		}
	}
	return chk;
}


function isEng(varCk, charSet) {
	var chk=true;
	for (i=0; i<=varCk.length-1; i++) {
		ch = varCk.substring(i,i+1);

		if ((ch>="a" && ch<="z") || (ch>="A" && ch<="Z")) {
			chk = true;
		} else {
			chk=false;
			for (j=0; j<=charSet.length-1; j++) {
				comp = charSet.substring(j,j+1);
				if (ch==comp) {
					chk = true;
					break;
				}
			}
			break;
		}
	}
	return chk;
}



// 2002.12.02 BSH 배성한 추가 start
// 입력 문자열 검사 (한글/특수문자)
function isHan(varCk, charSet) {
        var chk=true;
        for (i=0; i<=varCk.length-1; i++) {
                ch = varCk.substring(i,i+1);
                if ((ch >= "가") && (ch <= "힣")) {
                        chk = true;
                } else {
                        chk = false;
                        for (j=0; j<=charSet.length-1; j++) {
                                comp = charSet.substring(j,j+1);
                                if (ch == comp) {
                                        chk = true;
                                        break;
                                }
                        }
                        if (!chk)       break;  // 한글+특수문자외의 문자가 있는 경우만 error 종료 2002.04.08
                }
        }
        return chk;
}

// 입력된 데이타의 한글 비정상여부 체크
function isValidValue(varCk, charSet) {
        var chk=true;
        for (i=0; i<varCk.length; i++) {
                ch = varCk.charAt(i);
                if ((ch >= "가" && ch <= "힣") || (ch>="0" && ch<="9") || (ch>="a" && ch<="z") || (ch>="A" && ch<="Z")) {
                        chk = true;
                } else {
                        chk = false;
                        for (j=0; j<charSet.length; j++) {
                                comp = charSet.charAt(j);
                                if (ch == comp) {
                                        chk = true;
                                        break;
                                }
                        }
                        if (!chk)       break;  // 한글+특수문자외의 문자가 있는 경우만 error 종료 2002.04.08
                }
        }
        return chk;
}
// 2002.12.02 BSH 배성한 추가 end



// 문자열 길이 검사
function isLength(varCk) {
	var varLen = 0;
	var agr = navigator.userAgent;

	for (i=0; i<varCk.length; i++) {
		ch = varCk.charAt(i);
		if ((ch == "\n") || ((ch >= "ㅏ") && (ch <= "히")) || ((ch >="ㄱ") && (ch <="ㅎ")))
			varLen += 2;
		else
			varLen += 1;
	}
	return (varLen);
}

// 날짜 유효성 검사(년,월,일)
function isDay(varCk1,varCk2,varCk3) {
	if ( (isLength(varCk1)==4) && (isLength(varCk2)==2) && (isLength(varCk3)==2) ) {
		if ( (isInteger(varCk1,"")) && (isInteger(varCk2,"")) && (isInteger(varCk3,"")) ) {
			if (varCk1>="1900" && varCk1<="2099" && varCk2>="01" && varCk2<="12") {
				if (varCk2=="01" && varCk3>="01" && varCk3<="31") return true;
				if (varCk2=="02" && varCk3>="01" && varCk3<="28") return true;
				if (varCk2=="03" && varCk3>="01" && varCk3<="31") return true;
				if (varCk2=="04" && varCk3>="01" && varCk3<="30") return true;
				if (varCk2=="05" && varCk3>="01" && varCk3<="31") return true;
				if (varCk2=="06" && varCk3>="01" && varCk3<="30") return true;
				if (varCk2=="07" && varCk3>="01" && varCk3<="31") return true;
				if (varCk2=="08" && varCk3>="01" && varCk3<="31") return true;
				if (varCk2=="09" && varCk3>="01" && varCk3<="30") return true;
				if (varCk2=="10" && varCk3>="01" && varCk3<="31") return true;
				if (varCk2=="11" && varCk3>="01" && varCk3<="30") return true;
				if (varCk2=="12" && varCk3>="01" && varCk3<="31") return true;
				return false;
			}
			return false;
		} else {
			return false;
		}
	} else {
		return false;
	}

}

// 주민등록번호 검사만 처리
function isRegNoCheck(varCk1, varCk2) {
	if ( (isLength(varCk1)==6) && (isLength(varCk2)==7) ) {
		if ( (isInteger(varCk1,"")) && (isInteger(varCk2,"")) ) {
			ckValue = new Array(13);
			var ckLastid,ckMod,ckMinus,ckLast;

			ckLastid    = parseFloat(varCk2.substring(6,7));
			ckValue[0]  = parseFloat(varCk1.substring(0,1))  * 2;
			ckValue[1]  = parseFloat(varCk1.substring(1,2))  * 3;
			ckValue[2]  = parseFloat(varCk1.substring(2,3))  * 4;
			ckValue[3]  = parseFloat(varCk1.substring(3,4))  * 5;
			ckValue[4]  = parseFloat(varCk1.substring(4,5))  * 6;
			ckValue[5]  = parseFloat(varCk1.substring(5,6))  * 7;
			ckValue[6]  = parseFloat(varCk2.substring(0,1))  * 8;
			ckValue[7]  = parseFloat(varCk2.substring(1,2))  * 9;
			ckValue[8]  = parseFloat(varCk2.substring(2,3))  * 2;
			ckValue[9]  = parseFloat(varCk2.substring(3,4))  * 3;
			ckValue[10] = parseFloat(varCk2.substring(4,5))  * 4;
			ckValue[11] = parseFloat(varCk2.substring(5,6))  * 5;
			ckValue[12] = 0;

			for (var i = 0; i<12;i++) {
				ckValue[12] = ckValue[12] + ckValue[i];
			}
			ckMod   = ckValue[12] %11;
			ckMinus = 11 - ckMod;
			ckLast  = ckMinus % 10;
			if (ckLast != ckLastid) {
				return false;
			} else {
				return true;
			}
		} else {
			return false;
		}
	} else {
		return false;
	}
}

// 주민등록번호 검사
function isRegNo(varCk1,varCk2) {
	if ( (isLength(varCk1)==6) && (isLength(varCk2)==7) ) {
		if ( (isInteger(varCk1,"")) && (isInteger(varCk2,"")) ) {
			ckValue = new Array(13);
			var ckLastid,ckMod,ckMinus,ckLast;

			ckLastid    = parseFloat(varCk2.substring(6,7));
			ckValue[0]  = parseFloat(varCk1.substring(0,1))  * 2;
			ckValue[1]  = parseFloat(varCk1.substring(1,2))  * 3;
			ckValue[2]  = parseFloat(varCk1.substring(2,3))  * 4;
			ckValue[3]  = parseFloat(varCk1.substring(3,4))  * 5;
			ckValue[4]  = parseFloat(varCk1.substring(4,5))  * 6;
			ckValue[5]  = parseFloat(varCk1.substring(5,6))  * 7;
			ckValue[6]  = parseFloat(varCk2.substring(0,1))  * 8;
			ckValue[7]  = parseFloat(varCk2.substring(1,2))  * 9;
			ckValue[8]  = parseFloat(varCk2.substring(2,3))  * 2;
			ckValue[9]  = parseFloat(varCk2.substring(3,4))  * 3;
			ckValue[10] = parseFloat(varCk2.substring(4,5))  * 4;
			ckValue[11] = parseFloat(varCk2.substring(5,6))  * 5;
			ckValue[12] = 0;

			for (var i = 0; i<12;i++) {
				ckValue[12] = ckValue[12] + ckValue[i];
			}
			ckMod   = ckValue[12] %11;
			ckMinus = 11 - ckMod;
			ckLast  = ckMinus % 10;
			if (ckLast != ckLastid) {
				alert ("잘못된 주민등록번호입니다. 다시 확인해 주십시오");
				return false;
			} else {
				return true;
			}
		} else {
			alert("주민등록번호는 숫자이어야 합니다.");
			return false;
		}
	} else {
		alert("주민등록번호의 자릿수가 잘못 입력되었습니다.");
		return false;
	}
}

// 사업자 등록번호 검사
function isBusinessNo(varCk1,varCk2,varCk3) {
	ckValue = new Array(10);
	if ( (isLength(varCk1)==3) && (isLength(varCk2)==2) && (isLength(varCk3)==5) ) {
		if ( (isInteger(varCk1,"")) && (isInteger(varCk2,"")) && (isInteger(varCk3,"")) ) {
			ckValue[0] = ( parseFloat(varCk1.substring(0 ,1))  * 1 ) % 10;
			ckValue[1] = ( parseFloat(varCk1.substring(1 ,2))  * 3 ) % 10;
			ckValue[2] = ( parseFloat(varCk1.substring(2 ,3))  * 7 ) % 10;
			ckValue[3] = ( parseFloat(varCk2.substring(0 ,1))  * 1 ) % 10;
			ckValue[4] = ( parseFloat(varCk2.substring(1 ,2))  * 3 ) % 10;
			ckValue[5] = ( parseFloat(varCk3.substring(0 ,1))  * 7 ) % 10;
			ckValue[6] = ( parseFloat(varCk3.substring(1 ,2))  * 1 ) % 10;
			ckValue[7] = ( parseFloat(varCk3.substring(2 ,3))  * 3 ) % 10;
			ckTemp     = parseFloat(varCk3.substring(3 ,4))  * 5  + "0";
			ckValue[8] = parseFloat(ckTemp.substring(0,1)) + parseFloat(ckTemp.substring(1,2));
			ckValue[9] = parseFloat(varCk3.substring(4,5));
			ckLastid = ( 10 - ( ( ckValue[0]+ckValue[1]+ckValue[2]+ckValue[3]+ckValue[4]+ckValue[5]+ckValue[6]+ckValue[7]+ckValue[8] ) % 10 ) ) % 10;
			if (ckValue[9] != ckLastid) {
				alert ("잘못된 사업자등록번호입니다. 다시 확인해 주십시오");
				return false;
			} else {
				return true;
			}
		} else {
			alert("사업자등록번호는 숫자이어야 합니다.");
			return false;
		}
	} else {
		alert("사업자등록번호의 자릿수가 잘못 입력되었습니다.");
		return false;
	}
}

// 법인번호 검사
function isCorporationNo(varCk){
	var checkNum = new Array("1","2","1","2","1","2","1","2","1","2","1","2");

	//등기관서별 분류번호, 법인종류별 분류번호 및 일련번호를 차례로 연결한 12자리
	//의 숫자를 만든다.
	var newNum = new Array();
	for(var i = 0; i < varCk.length -1; i++)
		newNum[i] = varCk.charAt(i);

	//각 숫자에 차례로 1과 2를 곱한 다.값을 모두 더하여 합을 구한다.
	var multiNum = new Array();
	for(var k = 0; k < newNum.length; k++)
		multiNum[k] = checkNum[k] * newNum[k];

	//alert("각 숫자에 차례로 1과 2를 곱한 다: "+ multiNum[11]);
	//곱한 값을 모두 더하여 합을 구한다.
	var addNum = 0;
	for(var y = 0; y < multiNum.length; y++)
		addNum = addNum + Number(multiNum[y]);

	//alert("곱한 값을 모두 더하여 합을 구한다: "+ addNum);
	//합을 10으로 나누어 몫과 나머지를 구한다.
	var remainder;
	var quota;
	remainder = Number(addNum) % 10;
	quota = Number(addNum) / 10;
	//10에서 나머지를 뺀 값을 오류검색번호로 한다. 다만, 10에서 나머지를 뺀 값이
	//10인 때에는 0을 오류검색번호로 한다.
	var failCheckNum;
	if( (10 - Number(remainder)) == 10 )
	{
		failCheckNum = 0;
	}
	else
	{
		failCheckNum = 10 - Number(remainder);
	}
	//alert("오류검색번호: "+ failCheckNum);
	if(failCheckNum != varCk.charAt(12)) return false;

	return true;

}

//법인번호 검사 alert포함
function isCorpNo(varCk1,varCk2) {
	var varCk = varCk1 + varCk2;

	if ( (isInteger(varCk1,"")) && (isInteger(varCk2,"")) ) {
		if ( (isLength(varCk1)==6) && (isLength(varCk2)==7) ) {
			//법인번호 check
			if( !isCorporationNo(varCk) ){
				alert("잘못된 법인번호입니다. 다시 확인해 주십시오");
				return false;
			}else{
				return true;
			}


		} else {
			alert("법인번호의 자릿수가 잘못 입력되었습니다.");
			return false;
		}
	}else {
			alert("법인번호는 숫자이어야 합니다.");
			return false;
	}
	return true;

}//end 법인


//외국인 등록번호 check
function chkForeignNo(No){
	var nSum;
	var odd;
	odd= (parseInt(No.charAt(7))*10)+(parseInt(No.charAt(8)))

	if((odd%2) != 0){
		return false;
	}
	if((parseInt(No.charAt(11))!=6) && (parseInt(No.charAt(11))!=7) && (parseInt(No.charAt(11))!=8) && (parseInt(No.charAt(11))!=9)){
		return false;
	}

	nSum=
	(parseInt(No.charAt(0))*2)+
	(parseInt(No.charAt(1))*3)+
	(parseInt(No.charAt(2))*4)+
	(parseInt(No.charAt(3))*5)+
	(parseInt(No.charAt(4))*6)+
	(parseInt(No.charAt(5))*7)+
	(parseInt(No.charAt(6))*8)+
	(parseInt(No.charAt(7))*9)+
	(parseInt(No.charAt(8))*2)+
	(parseInt(No.charAt(9))*3)+
	(parseInt(No.charAt(10))*4)+
	(parseInt(No.charAt(11))*5);

	nSum = 11 - (nSum % 11);
	if(nSum >= 10){
		nSum = nSum - 10;
	}
	nSum = nSum + 2;
	if(nSum >= 10){
		nSum = nSum - 10;
	}
	if(nSum != (parseInt(No.charAt(12)))){
		return false;
	}
	else{
		return true;
	}
}

//외국인 등록번호 check alert포함

function chkForNo(varCk1){
	var varCk = varCk1;
	if ( isInteger(varCk1,"") ) {
		if ( isLength(varCk1)==13 ) {
			//법인번호 check
			if( !chkForeignNo(varCk) ){
				alert("잘못된 외국인 등록번호입니다. 다시 확인해 주십시오");
				return false;
			}else{
				return true;
			}


		} else {
			alert("외국인 등록번호의 자릿수가 잘못 입력되었습니다.");
			return false;
		}
	}else {
			alert("외국인 등록번호는 숫자이어야 합니다.");
			return false;
	}
	return true;
}


// 이메일 검사
function isEmail(str) {
	// regular expression 지원 여부 점검
	var supported = 0;
	if(window.RegExp){
		var tempStr = "a";
		var tempReg = new RegExp(tempStr);
		if (tempReg.test(tempStr)) supported = 1;
	}

	if (!supported){
		return (str.indexOf(".") > 2) && (str.indexOf("@") > 0);
	}

	var r1 = new RegExp("(@.*@)|(\\.\\.)|(@\\.)|(^\\.)");
	var r2 = new RegExp("^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,3}|[0-9]{1,3})(\\]?)$");

	return (!r1.test(str) && r2.test(str));
}


//이메일이 맞는 형식인지 onKeyUp시 알려준다.

function valEmail(str){
	var strEmail = str.value;
	if( trim(strEmail) == ''){
		;
	}else{
		if( isEmail(strEmail)==false ){
			alert('이메일 형식이 맞지 않습니다. 다시 입력하여 주십시요.');
		}
	}
}

// 지역번호 및 핸드폰 0502, 0505일경우 값을 받을수 있도록 한다.
// 2003/06/30 이종하 작성
function telJiyukPna_onKey(input1, input2){

	var strVal1 = input1.value;

	if(!isInteger(strVal1,'')) {
		alert("숫자만 입력 가능합니다!!!");
		input1.focus();
		input1.select();
	}


	if( isGenPhone(input1.value) ){
		input2.focus();
		input2.select();
	}else if ( isCellarPhone(input1.value) ){
		if( input1.value.length == 2){
			input1.value = "0" + input1.value;
		}
		input2.focus();
		input2.select();
	}else if( isPnaPhone(input1.value) ){
		input2.focus();
		input2.select();
	}else if( input1.value.length == 4 ) {
		input2.focus();
		input2.select();
	}
}


// 일반전화 지역번호 검사(DDD)
function isGenPhone(varCk1) {

	if ( varCk1.length == 2 ) {
		varCk1 = '0' + varCk1;
	} else if ( varCk1.length == 4 ) {
		varCk1 = varCk1.substring(1,4);
	} else if ( varCk1.length != 3 ) {
		return false ;
	}

	if( !isEmpty(varCk1) ) {
	   if(varCk1 == "002" || varCk1 == "031" || varCk1 == "032" || varCk1 == "033" || varCk1 == "041" || varCk1 == "042" || varCk1 == "043" || varCk1 == "051" || varCk1 == "052" || varCk1 == "053" || varCk1 == "055" || varCk1 == "054" || varCk1 == "061" || varCk1 == "062" || varCk1 == "063"|| varCk1 == "064"){
	   	 return true;
	   }
	 }
	return false;
}

// 핸드폰 사업자구분 검사(사업자구분)
// KTP (0130 Check Logic 추가 . by 2003.10.10 이재용)
// 010 추가 2003-12-17 4:29오후 오동원
function isCellarPhone(varCk1) {
	if ( varCk1.length == 2 ) {
		varCk1 = '0' + varCk1;

    } else if ( varCk1.length == 4 && varCk1 != "0130") {
		varCk1 = varCk1.substring(1,4);

    } else if ( varCk1.length == 4 && varCk1 == "0130") {

    } else if ( varCk1.length != 3 ) {
		return false ;
	}

	if(!isEmpty(varCk1)){
	   if( varCk1 == "010" || varCk1 == "011" || varCk1 == "017" || varCk1 == "016" || varCk1 == "018" || varCk1 == "019" || varCk1 == "0130"){
	   		return true;
	   }
	}
    return false;
}

//평생번호 check
function isPnaPhone(varCk1) {

	if(!isEmpty(varCk1)){
	   if(varCk1 == "0505" || varCk1 == "0502" ){
	   		return true;
	   }
	}
    return false;
}


// 윤년체크
function leapYear(year) {
  if (year % 4 == 0) // basic rule
    return true; // is leap year
  /* else */ // else not needed when statement is "return"
    return false; // is not leap year
}

// 두개의 날짜 사이의 총 일수를 구한다.
function getDaysBetween(from, to) {
   	var sdate = new Date(Number(from.substring(0,4)),Number(from.substring(4,6))-1,Number(from.substring(6,8))-1);
	var edate = new Date(Number(to.substring(0,4)),Number(to.substring(4,6))-1,Number(to.substring(6,8)));

	var fromMillis = sdate.getTime();
	var toMillis = edate.getTime();
	return (toMillis - fromMillis) / (1000 * 60 * 60 * 24);
}

// 년월에 대한 last day값
function getDays(month, year) {
  // create array to hold number of days in each month
  var ar = new Array(12);
  ar[0] = 31; // January
  ar[1] = (leapYear(year)) ? 29 : 28; // February
  ar[2] = 31; // March
  ar[3] = 30; // April
  ar[4] = 31; // May
  ar[5] = 30; // June
  ar[6] = 31; // July
  ar[7] = 31; // August
  ar[8] = 30; // September
  ar[9] = 31; // October
  ar[10] = 30; // November
  ar[11] = 31; // December

  // return number of days in the specified month (parameter)
  return ar[month];
}


function na_open_window(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable)
{
  toolbar_str = toolbar ? 'yes' : 'no';
  menubar_str = menubar ? 'yes' : 'no';
  statusbar_str = statusbar ? 'yes' : 'no';
  scrollbar_str = scrollbar ? 'yes' : 'no';
  resizable_str = resizable ? 'yes' : 'no';
  window.open(url, name, 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str);
}

// 주소조회 윈도우 Open
function NewWindow(mypage, myname, w, h, scroll) {
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;
	winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable'
	win = window.open(mypage, myname, winprops)
	if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
}


function NewWindow2(mypage, myname, w, h, scroll, resizable) {
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;
	winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable='+resizable
	win = window.open(mypage, myname, winprops)
	if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
}

function NewWindow3(mypage, myname, w, h, scroll, resizable) {
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;
	winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable='+resizable
	win = window.open(mypage, myname, winprops)
	if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
	return win;
}

// 좌우가운데 모두 스페이스 제거
function trim(parm_str)
{
  return rtrim(ltrim(parm_str));
}

// 좌측 스페이스 제거
function ltrim(parm_str)
{
  str_temp = parm_str;
  while (str_temp.length != 0) {
    if (str_temp.substring(0, 1) == " ") {
      str_temp = str_temp.substring(1, str_temp.length) ;
    }
    else {
      return str_temp ;
    }
  }
  return str_temp ;
}

// 우측 스페이스 제거
function rtrim(parm_str) {
  str_temp = parm_str ;
  while (str_temp.length != 0) {
    int_last_blnk_pos = str_temp.lastIndexOf(" ");
    if ((str_temp.length - 1) == int_last_blnk_pos) {
      str_temp = str_temp.substring(0, str_temp.length - 1);
    }
    else {
      return str_temp;
    }
  }
  return str_temp;
}

// 입력받은 숫자를 검사후 4자리로 채워준다.
function makeFmt4(val)
{
	var newVal = "";

	if(val.length == 1)	{
		newVal = "000".concat(val);
	} else if(val.length == 2) {
		newVal = "00".concat(val);
	} else if(val.length == 3) {
		newVal = "0".concat(val);
	} else if(val.length == 0)	{
		newVal = "";
	} else {
        newVal = val;
	}

	return newVal ;
}

// 지역번호 및 핸드폰 가능 번호 체크
function chkTelJiyuk(input1, flag1){
	//////////////////////////////////////////////////////////////////////////
	// input 1	: 지역번호를 입력하는 text의 name							//
	// flag1	: '1' --> 전화체크, '2' --> 핸드폰체크, '3' --> 둘다 체크	//
	//////////////////////////////////////////////////////////////////////////
	var strVal1		= input1.value;
	var strFlag1	= flag1;

	if(strFlag1 == "1"){
		// 숫자입력 체크
		if(!isInteger(strVal1,'')){
			alert("숫자만 입력 가능합니다!!!");
			input1.focus();
			return false;
		}

		// 길이 체크
		if(isLength(strVal1) < 3){
			if(strVal1 != "02"){
				alert("지역번호를 바르게 입력하세요!!!");
				input1.focus();
				return false;
			}
		}

		// 지역번호 체크
		if(!isGenPhone(strVal1)){
			alert("지역번호를 바르게 입력하세요!!!");
			input1.focus();
			return false;
		}

		return true;

	}else if(strFlag1 =="2"){
		// 숫자입력 체크
		if(!isInteger(strVal1,'')){
			alert("숫자만 입력 가능합니다!!!");
			input1.focus();
			return false;
		}

		// 길이 체크
		if(isLength(strVal1) < 3){
			alert("핸드폰 번호를 바르게 입력하세요!!!");
			input1.focus();
			return false;
		}

		// 지역번호 체크
		if(!isCellarPhone(strVal1)){
			alert("핸드폰 번호를 바르게 입력하세요!!!");
			input1.focus();
			return false;
		}

		return true;

	}else{
		// 숫자입력 체크
		if(!isInteger(strVal1,'')){
			alert("숫자만 입력 가능합니다!!!");
			input1.focus();
			return false;
		}

		// 길이 체크
		if(isLength(strVal1) < 3){
			if(strVal1 != "02"){
				alert("지역번호를 바르게 입력하세요!!!");
				input1.focus();
				return false;
			}
		}

		// 지역번호 체크
		if(!isCellarPhone(strVal1) && !isGenPhone(strVal1)){
			alert("번호를 바르게 입력하세요!!!");
			input1.focus();
			return false;
		}

		return true;
	}
}

// 번호체크
function chkTelKukbun(input2)
{
	//////////////////////////////////////////////////////////////////////////
	// input 2	: 국번을 입력하는 text의 name								//
	//////////////////////////////////////////////////////////////////////////
	var strVal2		= input2.value;

	// 숫자 체크
	if(!isInteger(strVal2,'')){
		alert("숫자만 입력이 가능합니다!!!");
		input2.focus();
		return false;

	}

	// 길이 체크
	if(isLength(strVal2) < 3){
		alert("국번은 3자리 이상 입력하셔야 합니다!!!");
		input2.focus();
		return false;
	}else{
		/*
		if((strVal2.substring(0,1) == "0") && (isLength(strVal2) == 3)){
			alert("맨앞자리에 '0'이 올 수가 없습니다!!!");
			input2.focus();
			return false;
		}
		*/
		if((strVal2.substring(0,2) == "00") && (isLength(strVal2) == 4)){
			alert("맨앞자리에 '00'이 올 수가 없습니다!!!");
			input2.focus();
			return false;
		}
	}

	return true;
}

// 전번체크
function chkTelNo(input3)
{
	//////////////////////////////////////////////////////////////////////////
	// input 3	: 번호를 입력하는 text의 name								//
	//////////////////////////////////////////////////////////////////////////
	var strVal3		= input3.value;

	// 숫자 체크
	if(!isInteger(strVal3,'')){
		alert("숫자만 입력이 가능합니다!!!");
		input3.focus();
		return false;
	}

	// 길이 체크
	if(isLength(strVal3) < 4){
		alert("번호의 자릿수는 4자리입니다!!!");
		input3.focus();
		return false;
	}

	return true;
}

// 전화번호 체크
function chkFmtTelNo(input1, input2, input3, flag1, flag2 )
{
	//////////////////////////////////////////////////////////////////////////
	// input 1	: 지역번호를 입력하는 text의 name							//
	// input 2	: 국번을 입력하는 text의 name								//
	// input 3	: 번호를 입력하는 text의 name								//
	// flag1	: '1' --> 전화체크, '2' --> 핸드폰체크, '3' --> 둘다 체크	//
	// flag2	: '1' --> 필수 입력 사항, '2' --> NON 필수 입력 사항		//
	//////////////////////////////////////////////////////////////////////////

	var strVal1		= input1.value;
	var strVal2		= input2.value;
	var strVal3		= input3.value;
	var strFlag1	= flag1;
	var strFlag2	= flag2;

	// 필수인지 아닌지를 구별
	if(strFlag2 == "1"){
		// 지역번호 및 핸드폰 가능 번호 체크 함수 호출
		if(!chkTelJiyuk(input1, flag1)){
			return false;
		}

		// 번호체크 함수 호출
		if(!chkTelKukbun(input2)){
			return false;
		}

		// 전번체크 함수 호출
		if(!chkTelNo(input3)){
			return false;
		}

	} else {
		if(isEmpty(strVal1) && isEmpty(strVal2) && isEmpty(strVal3)) {
			return true;
		} else {
			// 지역번호 및 핸드폰 가능 번호 체크 함수 호출
			if(!chkTelJiyuk(input1, flag1)){
				return false;
			}

			// 번호체크 함수 호출
			if(!chkTelKukbun(input2)){
				return false;
			}

			// 전번체크 함수 호출
			if(!chkTelNo(input3)){
				return false;
			}
		}
	}

	return true;
}

// 전화번호 합치는 함수
function getFmtTelNo(input1, input2, input3){
	var strVal1		= input1;
	var strVal2		= input2;
	var strVal3		= input3;

	var retVal		= "";
	var retVal1		= makeFmt4(strVal1);
	var retVal2		= makeFmt4(strVal2);
	var retVal3		= makeFmt4(strVal3);

	retVal			= retVal1 + retVal2 + retVal3;

	return retVal;
}

//테이블 레이어
function tableOver(Y)
{

	var menu = document.all[Y];

	if ( self.selectTable && selectTable != menu ) {

		 menu.style.visibility= 'visible';
		 selectTable.style.visibility= 'hidden' ;

	}
	selectTable = menu;

}

//테이블 레이어
function tableOut(Y) {

	var menu = document.all[Y];

	if ( self.selectTable && selectTable != menu ) {

		 menu.style.visibility= 'hidden';
		 selectTable.style.visibility= 'visible' ;

	}
	selectTable = menu;

}

var globalUMS = "1";

var globalUMS_TEL_NO1 	= "";
var globalUMS_TEL_NO2 	= "";
var globalUMS_TEL_NO3 	= "";
var globalUMS_HAND_NO1 	= "";
var globalUMS_HAND_NO1 	= "";
var globalUMS_HAND_NO1 	= "";
var globalUMS_EMAIL     = "";


// UMS 셋팅
function chgUms() {
	var form = document.mainForm;

	if ( form.UMS_TYPE_CD.value == "3" ) {				// 메일
		tableOut("tel");
		tableOver("mail");
		if(form.hUMS_TYPE_CD.value == "" && form.hUMS_NO.value == ""){
			form.UMS_EMAIL.value = form.hUMS_CUST_EMAIL.value;
		}

	} else if (form.UMS_TYPE_CD.value == "0") {		// 안함
		tableOver("no");
	} else if (form.UMS_TYPE_CD.value == "2") {		// 전화
		globalUMS = "1";

		form.UMS_TEL_NO1.value = "";
		form.UMS_TEL_NO2.value = "";
		form.UMS_TEL_NO3.value = "";
		tableOver("tel");

		if( form.hUMS_TYPE_CD.value == "" && form.hUMS_NO.value == "" ) {
			form.UMS_TEL_NO1.value = form.hTMP_UMS_TEL_NO1.value;
			form.UMS_TEL_NO2.value = form.hTMP_UMS_TEL_NO2.value;
			form.UMS_TEL_NO3.value = form.hTMP_UMS_TEL_NO3.value;
		}


	} else if (form.UMS_TYPE_CD.value == "1") {		// 핸드폰
		globalUMS = "2";

		form.UMS_TEL_NO1.value = "";
		form.UMS_TEL_NO2.value = "";
		form.UMS_TEL_NO3.value = "";

		tableOver("tel");
		if(form.hUMS_TYPE_CD.value == "" && form.hUMS_NO.value == ""){
			form.UMS_TEL_NO1.value = form.hTMP_UMS_HAND_NO1.value;
			form.UMS_TEL_NO2.value = form.hTMP_UMS_HAND_NO2.value;
			form.UMS_TEL_NO3.value = form.hTMP_UMS_HAND_NO3.value;
		}
	} else {										// 팩스
		tableOver("tel");
		if(form.hUMS_TYPE_CD.value == "" && form.hUMS_NO.value == ""){
			form.UMS_TEL_NO1.value = "";
			form.UMS_TEL_NO2.value = "";
			form.UMS_TEL_NO3.value = "";
		}
	}
}

//주소 팝업 : 신규 주소조회 팝업 적용 (2002.11.12)
function NewAddrWindow_ADSL(input,sacd)
{
    var params = "?";

    params = params + "sa_cd="+sacd;

    // 주소팝업으로 올려줄 데이터
    params = params + "&trdareacd=" + mainForm.ADSL_DONG_CD.value;              // 동코드
    params = params + "&addrno="    + mainForm.ADSL_ADDR_NO.value;              // 번지
    params = params + "&addrho="    + mainForm.ADSL_ADDR_HO.value;              // 호
    params = params + "&addrtype="  + mainForm.ADSL_ADDR_TYPE.value;            // 주소유형
    params = params + "&addrnotype="+ mainForm.ADSL_ADDR_NO_TYPE.value;         // 번지유형
    params = params + "&bldgname="  + mainForm.ADSL_ADDR_BLDG_NAME.value;       // 건물명
    params = params + "&bldgid="    + mainForm.ADSL_ADDR_BLDG_ID.value;         // 건물 ID
    params = params + "&addrref="   + mainForm.ADSL_ADDR_BLDG_NO.value;         // 건물동/보조주소

    // 주소팝업에서 내려받을 데이터
    params = params + "&rtn_addr_type=mainForm.ADSL_ADDR_TYPE.value";            // 주소유형
    params = params + "&rtn_zipcd=mainForm.ADSL_ZIP.value";                      // 우편번호
    params = params + "&rtn_trdareacd=mainForm.ADSL_DONG_CD.value";              // 동코드
    params = params + "&rtn_bldg_id=mainForm.ADSL_ADDR_BLDG_ID.value"            // 건물 ID
    params = params + "&rtn_bldgtypecd=mainForm.ADSL_ADDR_BLDG_TYPE_CD.value";   // 빌딩유형
    params = params + "&rtn_bldg_name=mainForm.ADSL_ADDR_BLDG_NAME.value"        // 건물명
    params = params + "&rtn_bldg_ref=mainForm.ADSL_ADDR_REF.value"               // 보조주소     2003-02-21 9:21오전
    params = params + "&rtn_addr_bldg_no=mainForm.ADSL_ADDR_BLDG_NO.value"       // 건물 NO
    params = params + "&rtn_addr_bldg_ho=mainForm.ADSL_ADDR_ROOM_NO.value"       // 건물호
    params = params + "&rtn_AddrNoType=mainForm.ADSL_ADDR_NO_TYPE.value";        // 번지유형
    params = params + "&rtn_AddrNo=mainForm.ADSL_ADDR_NO.value";                 // 번지
    params = params + "&rtn_AddrHo=mainForm.ADSL_ADDR_HO.value";                 // 호
    params = params + "&rtn_makeaddr=mainForm.ADSL_ADDR_FULL_TEXT.value";        // 주소
    params = params + "&rtn_acpt_ofc_cd=mainForm.SVC_OFC_CD.value";              // 수용국 코드
    params = params + "&rtn_rs_cd=mainForm.RS_CD.value";                         // RS_CODE

    NewWindow2('/pr/jsp/pr001q_p01.jsp'+params,'','700','550','no','no');
}

//주소 팝업
function NewAddrWindow_PAYER(input,sacd)
{
    var params = "?";

    params = params + "sa_cd="+sacd;

    // 주소팝업으로 올려줄 데이터
    params = params + "&trdareacd=" + mainForm.PAYER_DONG_CD.value;                 // 동코드
    params = params + "&addrno="    + mainForm.PAYER_ADDR_NO.value;                 // 번지
    params = params + "&addrho="    + mainForm.PAYER_ADDR_HO.value;                 // 호
    params = params + "&addrtype="  + mainForm.PAYER_ADDR_TYPE.value;               // 주소유형
    params = params + "&addrnotype="+ mainForm.PAYER_ADDR_NO_TYPE.value;            // 번지유형
    params = params + "&bldgname="  + mainForm.PAYER_ADDR_BLDG_NAME.value;          // 건물명
    params = params + "&bldgid="    + mainForm.PAYER_ADDR_BLDG_ID.value;            // 건물 ID
    params = params + "&addrref="   + mainForm.PAYER_ADDR_BLDG_NO.value;            // 건물동/보조주소

    // 주소팝업에서 내려받을 데이터
    params = params + "&rtn_addr_type=mainForm.PAYER_ADDR_TYPE.value";              // 주소유형
    params = params + "&rtn_zipcd=mainForm.PAYER_ZIP.value";                        // 우편번호
    params = params + "&rtn_trdareacd=mainForm.PAYER_DONG_CD.value";                // 동코드
    params = params + "&rtn_bldg_id=mainForm.PAYER_ADDR_BLDG_ID.value"              // 건물 ID
    params = params + "&rtn_bldgtypecd=mainForm.PAYER_ADDR_BLDG_TYPE_CD.value";     // 빌딩유형
    params = params + "&rtn_bldg_name=mainForm.PAYER_ADDR_BLDG_NAME.value"          // 건물명
    params = params + "&rtn_bldg_ref=mainForm.PAYER_ADDR_REF.value"                 // 보조주소     2003-02-21 9:21오전
    params = params + "&rtn_addr_bldg_no=mainForm.PAYER_ADDR_BLDG_NO.value"         // 건물 NO      2003-02-21 9:25오전
    params = params + "&rtn_addr_bldg_ho=mainForm.PAYER_ADDR_ROOM_NO.value"         // 건물호
    params = params + "&rtn_AddrNoType=mainForm.PAYER_ADDR_NO_TYPE.value";          // 번지유형
    params = params + "&rtn_AddrNo=mainForm.PAYER_ADDR_NO.value";                   // 번지
    params = params + "&rtn_AddrHo=mainForm.PAYER_ADDR_HO.value";                   // 호
    params = params + "&rtn_makeaddr=mainForm.PAYER_ADDR_FULL_TEXT.value";          // 주소

    NewWindow2('/pr/jsp/pr001q_p01.jsp'+params,'','700','550','no','no');
}

//다음포커스로 이동
function nextFocus(obj,maxlength) {
	if (obj.value.length == maxlength){
		for (i=0;i<obj.form.length-1;i++){
			if (obj.form[i].tabIndex ==''){
				if (obj.form[i] == obj){
		   			index = i+1;
					break;
				}
			}else{
				if (obj.form[i].tabIndex == obj.tabIndex+1){
		   			index = i;
		   			break;
		   		}
			}
		}
		obj.form[index].focus();
		obj.form[index].select();
	}
}

//다음포커스로 이동
function nextFocus2(obj,maxlength) {
	if (obj.value.length == maxlength){
		for (i=0;i<obj.form.length-1;i++){
			if (obj.form[i].tabIndex ==''){
				if (obj.form[i] == obj)
		   			index = i+1;
			}else
			if (obj.form[i].tabIndex == obj.tabIndex+1)
		   		index = i;
		}
	}
}

// 업종 조회 팝업
function listSearch()
{
    var form = document.mainForm;

    if(form.INFOFLAG.value == "0")
    {
        alert("게재여부를 선택하여 주세요!!!");
        return;
    }else
    {
        NewWindow2('/pa/jsp/pa907c_p01.jsp','name','500','350','no','no');
    }
}

// 한메일인지 체크한다.
function isHanmail(mail){
    if( mail.indexOf("hanmail") > 0 || mail.indexOf("daum") > 0 ){ // 한메일을 사용하고 있다면
        return true;
    }
    return false;

}
// UMS 처리관련 함수...(공통으로 사용함...)
function checkUms(){
	var form = document.mainForm;

	if ( form.UMS_TYPE_CD.value == "0" ) {			// 안함

	} else if ( form.UMS_TYPE_CD.value == "3" ) {	// 메일
		if(isEmpty(form.UMS_EMAIL.value)){
			alert("처리결과를 통보받을 이메일을 적어주십시요!!!");
			form.UMS_EMAIL.focus();
			return false;
		}

		if(!isEmail(form.UMS_EMAIL.value)){
			alert("처리결과를 통보받을 이메일을 정확하게 입력해 주십시요!!!");
			form.UMS_EMAIL.focus();
			return false;
		}
        if( isHanmail( form.UMS_EMAIL.value ) ){ // 한메일 체크
		    alert("hanmail, daum메일은 착신을 받으실수 없습니다.");
			form.UMS_EMAIL.focus();
			return false;
		}
		form.UMS_NO.value = form.UMS_EMAIL.value;

	} else if ( form.UMS_TYPE_CD.value == "2" ) {		// 전화번호

		if(isEmpty(form.UMS_TEL_NO1.value) || isEmpty(form.UMS_TEL_NO2.value) || isEmpty(form.UMS_TEL_NO3.value)){

			if(isEmpty(form.UMS_TEL_NO1.value)){
				alert("처리결과를 통보받을 전화번호를 적어주십시요!!!");
				form.UMS_TEL_NO1.focus();
				return false;
			}

			if(isEmpty(form.UMS_TEL_NO2.value)){
				alert("처리결과를 통보받을 전화번호를 적어주십시요!!!");
				form.UMS_TEL_NO2.focus();
				return false;
			}

			if(isEmpty(form.UMS_TEL_NO3.value)){
				alert("처리결과를 통보받을 전화번호를 적어주십시요!!!");
				form.UMS_TEL_NO3.focus();
				return false;
			}

		} else {

			if(!isGenPhone(form.UMS_TEL_NO1.value)){
				alert("처리결과를 통보받을 전화(지역번호)가 맞지가 않습니다 !!!");
				form.UMS_TEL_NO1.focus();
				return false;
			}

			if(isLength(form.UMS_TEL_NO2.value) < 2){
				alert("처리결과를 통보받을 전화(국번)은 2자리 이상입니다 !!");
				form.UMS_TEL_NO2.focus();
				return false;
			}

			if(isLength(form.UMS_TEL_NO3.value) < 4){
				alert("처리결과를 통보받을 전화(번호)는 4자리 입니다 !!");
				form.UMS_TEL_NO3.focus();
				return false;
			}

		}

		tempTelNoJj = makeFmt4(form.UMS_TEL_NO1.value);
		tempTelNoKk = makeFmt4(form.UMS_TEL_NO2.value);
		tempTelNoNn = makeFmt4(form.UMS_TEL_NO3.value);

		form.UMS_NO.value = tempTelNoJj + tempTelNoKk + tempTelNoNn;

	} else if ( form.UMS_TYPE_CD.value == "1" ) {			// 단문메세지
		if(isEmpty(form.UMS_TEL_NO1.value) || isEmpty(form.UMS_TEL_NO2.value) || isEmpty(form.UMS_TEL_NO3.value)){

			if(isEmpty(form.UMS_TEL_NO1.value)){
				alert("처리결과를 통보받을 핸드폰번호를 적어주십시요!!!");
				form.UMS_TEL_NO1.focus();
				return false;
			}

			if(isEmpty(form.UMS_TEL_NO2.value)){
				alert("처리결과를 통보받을 핸드폰번호를 적어주십시요!!!");
				form.UMS_TEL_NO2.focus();
				return false;
			}


			if( checkFakeNum() == false ){
					alert("처리결과를 통보받을 핸드폰의 국번을 바르게 입력하여 주십시요 !!");
					form.UMS_TEL_NO2.focus();
					return false;
			}


			if(isEmpty(form.UMS_TEL_NO3.value)){
				alert("처리결과를 통보받을 핸드폰번호를 적어주십시요!!!");
				form.UMS_TEL_NO3.focus();
				return false;
			}

		} else {

			if(!isCellarPhone( form.UMS_TEL_NO1.value ) ) {
				alert("처리결과를 통보받을 핸드폰 사업자 번호가 맞지가 않습니다 !!!");
				form.UMS_TEL_NO1.focus();
				return false;
			}

			if(isLength(form.UMS_TEL_NO2.value) < 3){
				alert("처리결과를 통보받을 핸드폰의 국번은 3자리 이상입니다 !!");
				form.UMS_TEL_NO2.focus();
				return false;
			}

			if( checkFakeNum() == false ){
					alert("처리결과를 통보받을 전화의 국번을 바르게 입력하여 주십시요 !!");
					form.UMS_TEL_NO2.focus();
					return false;
			}

			if(isLength(form.UMS_TEL_NO3.value) < 4){
				alert("처리결과를 통보받을 핸드폰의 번호는 4자리 입니다 !!");
				form.UMS_TEL_NO3.focus();
				return false;
			}

		}

		tempTelNoJj = makeFmt4(form.UMS_TEL_NO1.value);
		tempTelNoKk = makeFmt4(form.UMS_TEL_NO2.value);
		tempTelNoNn = makeFmt4(form.UMS_TEL_NO3.value);

		form.UMS_NO.value = tempTelNoJj + tempTelNoKk + tempTelNoNn;

	} else {								// 팩스
		if(isEmpty(form.UMS_TEL_NO1.value) || isEmpty(form.UMS_TEL_NO2.value) || isEmpty(form.UMS_TEL_NO3.value)){

			if(isEmpty(form.UMS_TEL_NO1.value)){
				alert("처리결과를 통보받을 팩스번호를 적어주십시요!!!");
				form.UMS_TEL_NO1.focus();
				return false;
			}

			if(isEmpty(form.UMS_TEL_NO2.value)){
				alert("처리결과를 통보받을 팩스번호를 적어주십시요!!!");
				form.UMS_TEL_NO2.focus();
				return false;
			}

			if(isEmpty(form.UMS_TEL_NO3.value)){
				alert("처리결과를 통보받을 팩스번호를 적어주십시요!!!");
				form.UMS_TEL_NO3.focus();
				return false;
			}

		}else{

			if(!isGenPhone(form.UMS_TEL_NO1.value)){
				alert("처리결과를 통보받을 팩스의 지역번호가 맞지가 않습니다 !!!");
				form.UMS_TEL_NO1.focus();
				return false;
			}

			if(isLength(form.UMS_TEL_NO2.value) < 2){
				alert("처리결과를 통보받을 퍅스의 국번은 2자리 이상입니다 !!");
				form.UMS_TEL_NO2.focus();
				return false;
			}else



			if( checkFakeNum() == false ){
					alert("처리결과를 통보받을 팩스의 국번을 바르게 입력하여 주십시요 !!");
					form.UMS_TEL_NO2.focus();
					return false;
			}


			if(isLength(form.UMS_TEL_NO3.value) < 4){
				alert("처리결과를 통보받을 팩스의 번호는 4자리 입니다 !!");
				form.UMS_TEL_NO3.focus();
				return false;
			}

		}

		tempTelNoJj = makeFmt4(form.UMS_TEL_NO1.value);
		tempTelNoKk = makeFmt4(form.UMS_TEL_NO2.value);
		tempTelNoNn = makeFmt4(form.UMS_TEL_NO3.value);

		form.UMS_NO.value = tempTelNoJj + tempTelNoKk + tempTelNoNn;

	}
	return true;
}


function checkFakeNum(fakeNum){

	if(
		fakeNum == '0000' ||
		fakeNum == '1111' ||
		fakeNum == '2222' ||
		fakeNum == '3333' ||
		fakeNum == '4444' ||
		fakeNum == '5555' ||
		fakeNum == '6666' ||
		fakeNum == '7777' ||
		fakeNum == '8888' ||
		fakeNum == '9999'
	){
		return false;
	}


}



// 신청자사항 입력항목 체크 함수...(공통으로 사용함...)
function checkReqer(){

	var form = document.mainForm;
	var varSpecialChar = '[]~!@#$%^&*()_+|`-=\[]{}:\"<>?,./ 0123456789';
	if (isLength(form.REQER_NAME.value) ==0) {
		alert("신청자명을 올바르게 입력해 주십시오!(최대 30자리까지 입력가능)");
		form.REQER_NAME.focus();
		return false;
	}

	if (isLength(form.REQER_NAME.value) > 30) {
		alert("신청자명을 올바르게 입력해 주십시오!(최대 30자리까지 입력가능)");
		form.REQER_NAME.focus();
		return false;
	}

	if (isValidValue(form.REQER_NAME.value, varSpecialChar) == false) {
		alert("신청자명을 올바르게 입력해 주십시오!");
		form.REQER_NAME.focus();
		form.REQER_NAME.select();
		return false;
	}





	if ( !eval(form.REQER_CNTC_NO_JJ) ) {

		//연락전화번호1 check

		if( isLength(form.REQER_CNTC_NO1.value) > 0){
			if( !isGenPhone(form.REQER_CNTC_NO1.value) && !isCellarPhone(form.REQER_CNTC_NO1.value) && !isPnaPhone(form.REQER_CNTC_NO1.value) ){
				alert('신청자 사항의 연락전화번호1의 지역번호를 확인하세요.');
				form.REQER_CNTC_NO1.focus();
				form.REQER_CNTC_NO1.select();
				return false;
			}

			if( isLength(form.REQER_CNTC_NO2.value) < 2){
				alert('신청자 사항의 연락전화번호1의 국번을 확인하세요.');
				form.REQER_CNTC_NO2.focus();
				form.REQER_CNTC_NO2.select();
				return false;
			}

			if( isLength(form.REQER_CNTC_NO3.value) != 4){
				alert('신청자 사항의 연락전화번호1의 전화번호를 확인하세요.');
				form.REQER_CNTC_NO3.focus();
				form.REQER_CNTC_NO3.select();
				return false;
			}


		}



		/*
		if ( !chkFmtTelNo(form.REQER_CNTC_NO1, form.REQER_CNTC_NO2, form.REQER_CNTC_NO3, '1', '1') ) {
			return false;
		}
		*/

		form.REQER_CNTC_NO.value = makeFmt4(form.REQER_CNTC_NO1.value)
								 + makeFmt4(form.REQER_CNTC_NO2.value)
								 + makeFmt4(form.REQER_CNTC_NO3.value);



		if( isLength(form.REQER_CNTC_HP_NO1.value) > 0){
			if( !isGenPhone(form.REQER_CNTC_HP_NO1.value) && !isCellarPhone(form.REQER_CNTC_HP_NO1.value) && !isPnaPhone(form.REQER_CNTC_HP_NO1.value)){
				alert('신청자 사항의 연락전화번호2의 지역번호를 확인하세요.');
				form.REQER_CNTC_HP_NO1.focus();
				form.REQER_CNTC_HP_NO1.select();
				return false;
			}

			if( isLength(form.REQER_CNTC_HP_NO2.value) < 2){
				alert('신청자 사항의 연락전화번호2의 국번을 확인하세요.');
				form.REQER_CNTC_HP_NO2.focus();
				form.REQER_CNTC_HP_NO2.select();
				return false;
			}

			if( isLength(form.REQER_CNTC_HP_NO3.value) != 4){
				alert('신청자 사항의 연락전화번호2의 전화번호를 확인하세요.');
				form.REQER_CNTC_HP_NO3.focus();
				form.REQER_CNTC_HP_NO3.select();
				return false;
			}


		}


		// 핸드폰이고 Non필수입력 항목
		/*
		if ( !chkFmtTelNo(form.REQER_CNTC_HP_NO1, form.REQER_CNTC_HP_NO2, form.REQER_CNTC_HP_NO3, '2', '2') ) {
			return false;
		}
		*/

		var tempREQER_CNTC_HP_NO = trim(form.REQER_CNTC_HP_NO1.value)
								+  trim(form.REQER_CNTC_HP_NO2.value)
								+  trim(form.REQER_CNTC_HP_NO3.value);

		if (tempREQER_CNTC_HP_NO != "") {
			form.REQER_CNTC_HP_NO.value = makeFmt4(form.REQER_CNTC_HP_NO1.value)
										+ makeFmt4(form.REQER_CNTC_HP_NO2.value)
										+ makeFmt4(form.REQER_CNTC_HP_NO3.value);
		}
	} else {

		if( isLength(form.REQER_CNTC_NO_JJ.value) > 0){
			if( !isGenPhone(form.REQER_CNTC_NO_JJ.value) && !isCellarPhone(form.REQER_CNTC_NO_JJ.value)  ){
				alert('신청자 사항의 연락전화번호1의 지역번호를 확인하세요.');
				form.REQER_CNTC_NO_JJ.focus();
				form.REQER_CNTC_NO_JJ.select();
				return false;
			}

			if( isLength(form.REQER_CNTC_NO_KK.value) < 2){
				alert('신청자 사항의 연락전화번호1의 국번을 확인하세요.');
				form.REQER_CNTC_NO_KK.focus();
				form.REQER_CNTC_NO_KK.select();
				return false;
			}

			if( isLength(form.REQER_CNTC_NO_NN.value) != 4){
				alert('신청자 사항의 연락전화번호1의 전화번호를 확인하세요.');
				form.REQER_CNTC_NO_NN.focus();
				form.REQER_CNTC_NO_NN.select();
				return false;
			}


		}


		/*
		if ( !chkFmtTelNo(form.REQER_CNTC_NO_JJ, form.REQER_CNTC_NO_KK, form.REQER_CNTC_NO_NN, '1', '1') ) {
			return false;
		}
		*/

		form.REQER_CNTC_NO.value = makeFmt4(form.REQER_CNTC_NO_JJ.value)
								 + makeFmt4(form.REQER_CNTC_NO_KK.value)
								 + makeFmt4(form.REQER_CNTC_NO_NN.value);




		if( isLength(form.REQER_CNTC_HP_NO_JJ.value) > 0){
			if( !isGenPhone(form.REQER_CNTC_HP_NO_JJ.value) && !isCellarPhone(form.REQER_CNTC_HP_NO_JJ.value) ){
				alert('신청자 사항의 연락전화번호2의 지역번호를 확인하세요.');
				form.REQER_CNTC_HP_NO_JJ.focus();
				form.REQER_CNTC_HP_NO_JJ.select();
				return false;
			}

			if( isLength(form.REQER_CNTC_HP_NO_KK.value) < 2){
				alert('신청자 사항의 연락전화번호2의 국번을 확인하세요.');
				form.REQER_CNTC_HP_NO_KK.focus();
				form.REQER_CNTC_HP_NO_KK.select();
				return false;
			}

			if( isLength(form.REQER_CNTC_HP_NO_NN.value) != 4){
				alert('신청자 사항의 연락전화번호2의 전화번호를 확인하세요.');
				form.REQER_CNTC_HP_NO_NN.focus();
				form.REQER_CNTC_HP_NO_NN.select();
				return false;
			}


		}



		/*
		// 핸드폰이고 Non필수입력 항목
		if ( !chkFmtTelNo(form.REQER_CNTC_HP_NO_JJ, form.REQER_CNTC_HP_NO_KK, form.REQER_CNTC_HP_NO_NN, '2', '2') ) {
			return false;
		}
		*/

		var tempREQER_CNTC_HP_NO = trim(form.REQER_CNTC_HP_NO_JJ.value)
								+  trim(form.REQER_CNTC_HP_NO_KK.value)
								+  trim(form.REQER_CNTC_HP_NO_NN.value);

		if (tempREQER_CNTC_HP_NO != "") {
			form.REQER_CNTC_HP_NO.value = makeFmt4(form.REQER_CNTC_HP_NO_JJ.value)
										+ makeFmt4(form.REQER_CNTC_HP_NO_KK.value)
										+ makeFmt4(form.REQER_CNTC_HP_NO_NN.value);
		}
	}


	//연락주소/기타

	if (isLength(form.REQER_ADDR.value) > 200) {
		alert("신청자 사항의 참고사항은 최대 200자리까지 입력가능합니다");
		form.REQER_ADDR.focus();
		return false;
	}

	if (isLength(form.REQER_ADDR.value) != 0) {
		if (isValidValue(form.REQER_ADDR.value, varSpecialChar) == false) {
			alert("신청자 사항의 참고사항을 바르게 입력하여 주십시요.");
			form.REQER_ADDR.focus();
			form.REQER_ADDR.select();
			return false;
		}
	}

	return true;

}

//과금번호 사용가능 체크
function checkBill() {

	var form = document.mainForm;
	if(form.RTN_PAYER_LIFE_CYCLE.value =="P") {
		alert("과금번호가 가설중인 전화번호입니다. 다시 입력하세요");
		form.PAYER_PAY_TEL_NO1.focus();
		return false;
	}
	if(form.RTN_PAYER_LIFE_CYCLE.value =="F"||form.RTN_PAYER_LIFE_CYCLE.value =="D") {
		alert("과금번호가 철거중인 전화번호입니다. 다시 입력하세요");
		form.PAYER_PAY_TEL_NO1.focus();
		return false;
	}
	if(form.RTN_PAYER_SVC_STATUS_CD.value=="05") {
		alert("과금번호가 일시이용중인 전화번호입니다. 다시 입력하세요");
		form.PAYER_PAY_TEL_NO1.focus();
		return false;
	}
	if(form.RTN_PAYER_SVC_STATUS_CD.value!="02") {
		alert("과금번호가 사용중이 아닙니다. 다시 입력하세요");
		form.PAYER_PAY_TEL_NO1.focus();
		return false;
	}
	if(form.RTN_PAYER_SA_CD.value=="0507"||form.RTN_PAYER_SA_CD.value=="0508") {
		alert("과금번호가 공중전화 번호입니다. 다시입력하세요");
		form.PAYER_PAY_TEL_NO1.focus();
		return false;
	}

	if(form.RTN_PAYER_KT_USE_FLAG.value=="1") {
		if(form.ATEL_OFC_CD.value!="000159") {
			alert("과금번호가 KT사업용입니다. 국제전화국에서만 처리할 수 있습니다.");
			form.PAYER_PAY_TEL_NO1.focus();
			return false;
		}
	}
	return true;
}



// 사외유통망 개발 계약자사항 입력항목 체크 함수.(공통으로 사용함...) 2003-05-19 10:53오전
function checkCustComm(){
	var form = document.mainForm;
	if(form.RTN_CUST_ID.value =="") {
		alert("계약자사항을 입력하고 조회하세요.");
		form.SEARCH_CUST_NO.focus();
		return false;
	}
	return true;
}

// 사외유통망 개발 납부자사항 입력항목 체크 함수.(공통으로 사용함...) 2003-05-19 10:53오전
function checkPayerComm(){
	var form = document.mainForm;
	//합산 청구를 신청한 경우
	if(form.PAYER_PAY_GB(0).checked ==true) {
		if(form.RTN_PAYER_LINKNO.value =="") {
			alert("납부자사항을 입력하고 조회하세요.");
			form.PAYER_PAY_TEL_NO1.focus();
			return false;
		}
		if(form.RTN_PAYER_PAY_TEL_NO1.value!=form.PAYER_PAY_TEL_NO1.value ||
			form.RTN_PAYER_PAY_TEL_NO2.value!=form.PAYER_PAY_TEL_NO2.value ||
			form.RTN_PAYER_PAY_TEL_NO3.value!=form.PAYER_PAY_TEL_NO3.value ) {
			alert("입력하신 납부자 사항의 전화번호를 조회하세요.");
			form.PAYER_SEARCH1.focus();
			return false;
		}
	//별도청구서 발행을 선택한 경우
	}else if(form.PAYER_PAY_GB(1).checked ==true) {
	//기존청구서 발행을 선책한 경우
	}else if(form.PAYER_PAY_GB(2).checked ==true) {

	}
	return true;

}

function checkReqComm() {
	var form = document.mainForm;
	if(isEmpty(form.REQER_NAME.value)){
		alert("신청자명을 올바르게 입력해 주십시오!(최대 30자리까지 입력가능)");
		form.REQER_NAME.focus();
		return false
	}
	if(isEmpty(form.REQER_CNTC_NO1.value)||
		isEmpty(form.REQER_CNTC_NO2.value)||
		isEmpty(form.REQER_CNTC_NO3.value)) {
		alert("신청자 사항의 연락전화번호1을 확인하세요.");
		form.REQER_CNTC_NO1.focus();
		return false
	}
	return true;
}


// 계약자사항 입력항목 체크 함수...(공통으로 사용함...)
function checkCust(){

	var form = document.mainForm;
	var strCustNo		= form.CUST_NO.value;
	var strCustNoType	= form.CUST_NO_TYPE.value;


	// 고객구분
	var strCustType = document.mainForm.CUST_TYPE.selectedIndex;
	if (strCustType < 0) {
		alert("계약자의 고객구분을 선택해 주십시오!");
		form.CUST_TYPE.focus();
		return false;
	}

	// 식별번호
	if ( strCustNoType == "1" ) {	// 주민등록번호
		if ( (isLength(strCustNo) != 13) || (!isInteger(strCustNo,"")) ) {
			alert("계약자 식별번호(주민등록번호)를 올바르게 입력해 주십시오!");
			form.CUST_NO.focus();
			return false;
		}
		if ( !isRegNo(strCustNo.substr(0,6), strCustNo.substr(6,7)) ) {
			form.CUST_NO.focus();
			return false;
		}
	} else
	if ( strCustNoType == "3" ) {	// 법인번호
		if ( (isLength(strCustNo) != 13 ) || (!isInteger(strCustNo,"")) ) {
			alert("계약자 식별번호(법인번호)를 입력해 주십시오!");
			form.CUST_NO.focus();
			return false;
		}
		if ( !isCorporationNo(strCustNo) ) {
			alert("계약자 식별번호(법인번호)를 올바르게 입력해 주십시오!");
			form.CUST_NO.focus();
			return false;
		}
	} else {
		if (isLength(strCustNo) < 2) {
			alert("계약자 식별번호를 입력해 주십시오!");
			form.CUST_NO.focus();
			return false;
		}
	}


	//계약자명
	if (isEmpty(form.CUST_NAME.value)) {
		alert("계약자명을 입력해 주십시오!(최대 50자리까지 입력가능)");
		form.CUST_NAME.focus();
		return false;
	}
	else if (isLength(form.CUST_NAME.value) > 50) {
		alert("계약자명을 올바르게 입력해 주십시오!(최대 50자리까지 입력가능)");
		form.CUST_NAME.focus();
		return false;
	}
	else if (isValidValue(form.CUST_NAME.value, varSYMBOL) == false) {
		alert("계약자명을 올바르게 입력해 주십시오!");
		form.CUST_NAME.focus();
		return false;
	}

	//계약자 연락번호
	if ( !eval(form.CUST_CNTC_TEL_NO_JJ) ) {

		// 일반전화 또는 핸드폰이고 필수입력 항목
		if ( !chkFmtTelNo(form.CUST_CNTC_TEL_NO1, form.CUST_CNTC_TEL_NO2, form.CUST_CNTC_TEL_NO3, '3', '1') ) {

			return false;
		}

		form.CUST_CNTC_TEL_NO.value = makeFmt4(form.CUST_CNTC_TEL_NO1.value)
									+ makeFmt4(form.CUST_CNTC_TEL_NO2.value)
									+ makeFmt4(form.CUST_CNTC_TEL_NO3.value);

	} else {

		// 일반전화 또는 핸드폰이고 필수입력 항목
		if ( !chkFmtTelNo(form.CUST_CNTC_TEL_NO_JJ, form.CUST_CNTC_TEL_NO_KK, form.CUST_CNTC_TEL_NO_NN, '3', '1') ) {
			return false;
		}

		form.CUST_CNTC_TEL_NO.value = makeFmt4(form.CUST_CNTC_TEL_NO_JJ.value)
									+ makeFmt4(form.CUST_CNTC_TEL_NO_KK.value)
									+ makeFmt4(form.CUST_CNTC_TEL_NO_NN.value);

	}

	var strCUST_CNTC_EMAIL_ADDR = trim(form.CUST_CNTC_EMAIL_ADDR.value);
	if (strCUST_CNTC_EMAIL_ADDR.length > 0) {
		if (!isEmail(strCUST_CNTC_EMAIL_ADDR)) {
			alert("계약자 E-Mail 주소를 올바르게 입력해 주십시오!");
			form.CUST_CNTC_EMAIL_ADDR.focus();
			return false;
		}
	}

	//연락주소 및 기타 2002.04.23
	var strCUST_ADDR = trim(form.CUST_ADDR.value);
	if (isLength(strCUST_ADDR) > 0) {
		if (isLength(strCUST_ADDR)	>	 99) {
			alert("계약자 연락주소/기타사항을 올바르게 입력해 주십시오!(최대 100자리까지 가능)");
			form.CUST_ADDR.focus();
			return false;
		}
	}
	if (isValidValue(strCUST_ADDR, varSYMBOL) == false) {
		alert("계약자 연락주소/기타사항을 올바르게 입력해 주십시오!");
		form.CUST_ADDR.focus();
		return false;
	}

	return true;
}

// 납부자사항 세팅...(공통으로 사용함...)
function lf_bill_data_display(bill_flag ) {

	var form	=	document.mainForm;

	form.PAYER_PAY_GB[0].disabled = true;
	form.PAYER_PAY_GB[1].disabled = true;

	if (bill_flag == '2') { // 별도청구서 발행
		form.PAYER_PAY_TELNO1.disabled		= true;
		form.PAYER_PAY_TELNO2.disabled		= true;
		form.PAYER_PAY_TELNO3.disabled		= true;

		form.PAYER_ADDR_FULL_TEXT.readonly	= true;
		form.PAYER_ADDR_SEARCH.disabled 	= false;	//주소입력버튼

		form.PAYER_PAY_TELNO1.style.background		= "#FFFFFF";
		form.PAYER_PAY_TELNO2.style.background		= "#FFFFFF";
		form.PAYER_PAY_TELNO3.style.background		= "#FFFFFF";
		form.PAYER_ADDR_FULL_TEXT.style.background	= "#E3E4E6";

	} else {	// 전화요금합산

		form.PAYER_PAY_TELNO1.disabled		= false;
		form.PAYER_PAY_TELNO2.disabled		= false;
		form.PAYER_PAY_TELNO3.disabled		= false;

		form.PAYER_ADDR_FULL_TEXT.readonly	= true;
		form.PAYER_ADDR_SEARCH.disabled		= true;		//주소입력버튼

		form.PAYER_PAY_TELNO1.style.background		= "#FCFCDF";
		form.PAYER_PAY_TELNO2.style.background		= "#FCFCDF";
		form.PAYER_PAY_TELNO3.style.background		= "#FCFCDF";
		form.PAYER_ADDR_FULL_TEXT.style.background	= "#FFFFFF";

	}

	// 자동이체 여부
	lf_check_Payer_Autopay_gb();
	form.PAYER_AUTOPAY_GB_CHK.disabled  = true;	//자동이체여부
}

// 납부자사항 세팅...(공통으로 사용함...)
function lf_bill_data_display_020515(bill_flag ) {

	var form	=	document.mainForm;

	form.PAYER_PAY_GB[0].disabled = true;
	form.PAYER_PAY_GB[1].disabled = true;

	if (bill_flag == '2') { // 별도청구서 발행
		form.PAYER_PAY_TELNO1.disabled		= true;
		form.PAYER_PAY_TELNO2.disabled		= true;
		form.PAYER_PAY_TELNO3.disabled		= true;

		form.PAYER_ADDR_FULL_TEXT.readonly	= true;
		form.PAYER_ADDR_SEARCH.disabled 	= false;	//주소입력버튼

		form.PAYER_PAY_TELNO1.style.background		= "#FFFFFF";
		form.PAYER_PAY_TELNO2.style.background		= "#FFFFFF";
		form.PAYER_PAY_TELNO3.style.background		= "#FFFFFF";
		form.PAYER_ADDR_FULL_TEXT.style.background	= "#E3E4E6";

		form.PAYER_INV_MEDIA_CD[0].disabled 	=	false;		// 2002.05.15
		form.PAYER_INV_MEDIA_CD[1].disabled 	=	false;		// 2002.05.15

		form.PAYER_SHEET_OPTION_FLAG_CHK.disabled 	=	true;		// 2002.05.15

		lf_invmedia_control(01);                 // 단독청구 선택시 최초는(종이발행으로 함)


	} else {	// 전화요금합산
		form.PAYER_PAY_TELNO1.disabled		= false;
		form.PAYER_PAY_TELNO2.disabled		= false;
		form.PAYER_PAY_TELNO3.disabled		= false;

		form.PAYER_ADDR_FULL_TEXT.readonly	= true;
		form.PAYER_ADDR_SEARCH.disabled		= true;		//주소입력버튼

		form.PAYER_PAY_TELNO1.style.background		= "#FCFCDF";
		form.PAYER_PAY_TELNO2.style.background		= "#FCFCDF";
		form.PAYER_PAY_TELNO3.style.background		= "#FCFCDF";
		form.PAYER_ADDR_FULL_TEXT.style.background	= "#FFFFFF";


		form.PAYER_INV_MEDIA_CD[0].disabled 	=	true;		// 2002.05.15
		form.PAYER_INV_MEDIA_CD[1].disabled 	=	true;		// 2002.05.15
		form.PAYER_SHEET_OPTION_FLAG_CHK.disabled 	=	true;		// 2002.05.15
	}

	form.PAYER_EMAIL_ID.disabled 			=	true;		// 2002.05.15
	form.PAYER_EMAIL_ID.style.background	=	"#E3E4E6";	// 2002.05.15
	// 자동이체 여부
	lf_check_Payer_Autopay_gb();
	form.PAYER_AUTOPAY_GB_CHK.disabled  = true;	//자동이체여부
}

// 납부자사항의 납부방식에 따른 제어...(공통으로 사용함...)
function lf_bill_display(bill_flag ) {

	var form	=	document.mainForm;

	if (bill_flag == '2') { // 별도청구서 발행
		form.PAYER_PAY_TELNO1.disabled		= true;
		form.PAYER_PAY_TELNO2.disabled		= true;
		form.PAYER_PAY_TELNO3.disabled		= true;

		form.PAYER_ADDR_FULL_TEXT.readonly	= true;
		form.PAYER_ADDR_SEARCH.disabled 	= false;	//주소입력버튼

		form.PAYER_AUTOPAY_GB_CHK.disabled  = false;	//자동이체여부
		form.PAYER_AUTOPAY_GB_CHK.checked	= true;
		lf_check_Payer_Autopay_gb();
/*
		form.PAYER_PAY_TELNO1.value			= "";
		form.PAYER_PAY_TELNO2.value			= "";
		form.PAYER_PAY_TELNO3.value			= "";
*/
		form.PAYER_PAY_TELNO1.style.background		= "#FFFFFF";
		form.PAYER_PAY_TELNO2.style.background		= "#FFFFFF";
		form.PAYER_PAY_TELNO3.style.background		= "#FFFFFF";
		form.PAYER_ADDR_FULL_TEXT.style.background	= "#E3E4E6";


	} else {	// 전화요금합산
		form.PAYER_PAY_TELNO1.disabled		= false;
		form.PAYER_PAY_TELNO2.disabled		= false;
		form.PAYER_PAY_TELNO3.disabled		= false;


		form.PAYER_ADDR_FULL_TEXT.readonly	= true;
		form.PAYER_ADDR_SEARCH.disabled		= true;		//주소입력버튼

		form.PAYER_AUTOPAY_GB_CHK.disabled 	= true;		//자동이체여부
		form.PAYER_AUTOPAY_GB_CHK.checked  	= false;
		lf_check_Payer_Autopay_gb();

		form.PAYER_PAY_TELNO1.style.background		= "#FCFCDF";
		form.PAYER_PAY_TELNO2.style.background		= "#FCFCDF";
		form.PAYER_PAY_TELNO3.style.background		= "#FCFCDF";
		form.PAYER_ADDR_FULL_TEXT.style.background	= "#FFFFFF";

		form.PAYER_PAY_TELNO1.focus();


	}

}

function lf_bill_display_020515(bill_flag ) {

	var form	=	document.mainForm;

	if (bill_flag == '2') { // 별도청구서 발행
		form.PAYER_PAY_TELNO1.disabled		= true;
		form.PAYER_PAY_TELNO2.disabled		= true;
		form.PAYER_PAY_TELNO3.disabled		= true;

		form.PAYER_ADDR_FULL_TEXT.readonly	= true;
		form.PAYER_ADDR_SEARCH.disabled 	= false;	//주소입력버튼

		form.PAYER_AUTOPAY_GB_CHK.disabled  = false;	//자동이체여부
		form.PAYER_AUTOPAY_GB_CHK.checked	= true;
		lf_check_Payer_Autopay_gb();

		form.PAYER_PAY_TELNO1.style.background		= "#FFFFFF";
		form.PAYER_PAY_TELNO2.style.background		= "#FFFFFF";
		form.PAYER_PAY_TELNO3.style.background		= "#FFFFFF";
		form.PAYER_ADDR_FULL_TEXT.style.background	= "#E3E4E6";

		form.PAYER_INV_MEDIA_CD[0].disabled 	=	false;		// 2002.05.15 jwc
		form.PAYER_INV_MEDIA_CD[0].checked 		=	true;		// 2002.05.15
		form.PAYER_INV_MEDIA_CD[1].disabled 	=	false;		// 2002.05.15
		form.PAYER_SHEET_OPTION_FLAG_CHK.disabled 	=	false;		// 2002.05.15
		form.PAYER_SHEET_OPTION_FLAG_CHK.checked 	=	true;		// 2002.05.15

	} else {	// 전화요금합산
		form.PAYER_PAY_TELNO1.disabled		= false;
		form.PAYER_PAY_TELNO2.disabled		= false;
		form.PAYER_PAY_TELNO3.disabled		= false;


		form.PAYER_ADDR_FULL_TEXT.readonly	= true;
		form.PAYER_ADDR_SEARCH.disabled		= true;		//주소입력버튼

		form.PAYER_AUTOPAY_GB_CHK.disabled 	= true;		//자동이체여부
		form.PAYER_AUTOPAY_GB_CHK.checked  	= false;
		lf_check_Payer_Autopay_gb();

		form.PAYER_PAY_TELNO1.style.background		= "#FCFCDF";
		form.PAYER_PAY_TELNO2.style.background		= "#FCFCDF";
		form.PAYER_PAY_TELNO3.style.background		= "#FCFCDF";
		form.PAYER_ADDR_FULL_TEXT.style.background	= "#FFFFFF";

		form.PAYER_PAY_TELNO1.focus();

		form.PAYER_INV_MEDIA_CD[0].disabled 	=	true;		// 2002.05.15
		form.PAYER_INV_MEDIA_CD[1].disabled 	=	true;		// 2002.05.15
		form.PAYER_SHEET_OPTION_FLAG_CHK.disabled 	=	true;		// 2002.05.15
		form.PAYER_SHEET_OPTION_FLAG_CHK.checked 	=	false;		// 2002.05.15
	}

	lf_invmedia_control("01");      // 최초는(종이발행으로 함)
}

// 청구매체에 따라 화면제어
function lf_invmedia_control(invmedia)	{

	var form	=	document.mainForm;
	if (invmedia	==	"")	return;

	if (invmedia	==	"01")	{	// 종이
		form.PAYER_SHEET_OPTION_FLAG_CHK.disabled   =   true;       // 2002.05.16 jwc
		form.PAYER_SHEET_OPTION_FLAG_CHK.checked    =   true;       // 2002.05.16 jwc
		form.PAYER_EMAIL_ID.disabled 			=	true;		    // 2002.05.15
		form.PAYER_EMAIL_ID.style.background	=	"#E3E4E6";	    // 2002.05.15

		form.PAYER_SHEET_OPTION_FLAG.value	 	=	"1";		    // 2002.05.15
    }
	else {						// Email ID
		form.PAYER_SHEET_OPTION_FLAG_CHK.disabled   =   false;      // 2002.05.16 jwc
		form.PAYER_SHEET_OPTION_FLAG_CHK.checked    =   true;       // 2002.05.16 jwc

		form.PAYER_EMAIL_ID.disabled 			=	false;		    // 2002.05.15
		form.PAYER_EMAIL_ID.style.background	=	"#FCFCDF";	    // 2002.05.15

		form.PAYER_SHEET_OPTION_FLAG.value	 	=	"";		   	   // 2002.05.15
	}
	lf_check_Payer_SheetOptionFlag_gb();	// 청구매체에 따른 종이발행여부 화면제어 2002.05.16(jwc)


}
// 청구매체에 따른 종이발행여부 화면제어 및 값셋팅
function	lf_check_Payer_SheetOptionFlag_gb()	{

	var form	=	document.mainForm;

	if	(form.PAYER_SHEET_OPTION_FLAG_CHK.checked)	{
		form.PAYER_SHEET_OPTION_FLAG.value	 	=	"1";			// 2002.05.15
	} else	{
		form.PAYER_SHEET_OPTION_FLAG.value	 	=	"0";				// 2002.05.15
	}


}

// 자동이체여부에 따른 화면 제어...(공통으로 사용함...)
function lf_check_Payer_Autopay_gb() {

	var form	=	document.mainForm;

	if ( form.PAYER_AUTOPAY_GB_CHK.checked ) {

       	form.PAYER_AUTOPAY_GB.value			= "1"; 	// 자동이체 신청

		if ( form.CUST_NO_TYPE.value == "1" && isLength(form.PAYER_ACNTER_NAME.value) < 1) {
			form.PAYER_ACNT_NO.value		= "";
			form.PAYER_ACNTER_NAME.value	= form.CUST_NAME.value;
			form.PAYER_ACNTER_CUST_NO.value	= form.CUST_NO.value;
		}

       	form.PAYER_BANK_CD.disabled			= false;
       	form.PAYER_ACNT_NO.disabled			= false;
       	form.PAYER_ACNTER_NAME.disabled		= false;
       	form.PAYER_ACNTER_CUST_NO.disabled	= false;

		form.PAYER_BANK_CD.style.background			= "#FCFCDF";
       	form.PAYER_ACNT_NO.style.background			= "#FCFCDF";
       	form.PAYER_ACNTER_NAME.style.background		= "#FCFCDF";
       	form.PAYER_ACNTER_CUST_NO.style.background	= "#FCFCDF";

	} else {

        form.PAYER_AUTOPAY_GB.value				= "0"; // 자동이체 신청안함

		form.PAYER_BANK_CD.options[0].selected	= true;
		form.PAYER_ACNT_NO.value				= "";
		form.PAYER_ACNTER_NAME.value			= "";
		form.PAYER_ACNTER_CUST_NO.value			= "";

		form.PAYER_BANK_CD.disabled			= true;
       	form.PAYER_ACNT_NO.disabled			= true;
       	form.PAYER_ACNTER_NAME.disabled		= true;
       	form.PAYER_ACNTER_CUST_NO.disabled	= true;

       	form.PAYER_BANK_CD.style.background			= "#FFFFFF";
       	form.PAYER_ACNT_NO.style.background			= "#FFFFFF";
       	form.PAYER_ACNTER_NAME.style.background		= "#FFFFFF";
       	form.PAYER_ACNTER_CUST_NO.style.background	= "#FFFFFF";
	}
}

// 청구서발행 입력항목 체크 함수...(공통으로 사용함...)
function checkPayerPaper() {

	var form = document.mainForm;

	if ( isEmpty(form.PAYER_DONG_CD.value) ) {
		alert("납부자 청구지 주소를 입력하세요!");
		return false;
	}

	// 청구매체에 따른 체크	2002.05.15
	if	( eval(form.PAYER_INV_MEDIA_CD)	)	{

		if  (form.PAYER_INV_MEDIA_CD[0].checked) { 	// 종이발행
			form.PAYER_EMAIL_ID.value	=	"";
			//jwc?? 종이발행함으로만 셋팅되어야 하는지 확인요망
		}
		else 										// email청구서 발행
		{
			if	(isEmpty(form.PAYER_EMAIL_ID.value)	)	{
				alert("청구서를 수령받을 이메일주소를 입력하세요!");
				form.PAYER_EMAIL_ID.focus();
				return false;
			}
			if	(isLength(form.PAYER_EMAIL_ID.value) > 99	)	{
				alert("청구서를 수령받을 이메일주소를 확인해주십시오(최대 99자리까지)!");
				form.PAYER_EMAIL_ID.focus();
				return false;
			}
			if(!isEmail(form.PAYER_EMAIL_ID.value)){
				alert("청구서를 수령받을 이메일을 정확하게 입력해 주십시요!!!");
				form.PAYER_EMAIL_ID.focus();
				return false;
			}
		}
	}

	//자동이체인 경우
	if (form.PAYER_AUTOPAY_GB_CHK.checked) {
		// 금융기관
		if (form.PAYER_BANK_CD.selectedIndex == 0) {
			alert("금융기관을 선택하세요!");
			form.PAYER_BANK_CD.focus();
			return false;
		}

		// 계좌번호
		if (isLength(form.PAYER_ACNT_NO.value) == 0) {
			alert("예금주 계좌번호를 입력해주십시오!");
			form.PAYER_ACNT_NO.focus();
			return false;
		}

		if ( !isInteger(	mainForm.PAYER_ACNT_NO.value, "" ) ) {
			alert("계좌번호는 숫자입력만 가능합니다!");
			mainForm.PAYER_ACNT_NO.focus();
			return false;
		}

		// 예금주명
    	if (isEmpty(form.PAYER_ACNTER_NAME.value)) {
    		alert("예금주명을 입력해 주십시오!(최대 50자리까지 입력가능)");
    		form.PAYER_ACNTER_NAME.focus();
    		return false;
    	}
		if (isLength(form.PAYER_ACNTER_NAME.value) == 0 || isLength(form.PAYER_ACNTER_NAME.value) > 50 ) {
			alert("예금주명을 입력해주십시오!(최대50자리까지 가능)");
			form.PAYER_ACNTER_NAME.focus();
			return false;
    	}
    	else if (isValidValue(form.PAYER_ACNTER_NAME.value, varSYMBOL) == false) {
    		alert("예금주명을 올바르게 입력해 주십시오!");
    		form.PAYER_ACNTER_NAME.focus();
    		return false;
    	}

    	if ( isEmpty(form.PAYER_DONG_CD.value) ) {
    		alert("납부자 청구지 주소를 입력하세요!");
    		return false;
    	}

		var StrPAYERACNTERCUSTNO = form.PAYER_ACNTER_CUST_NO.value;
		if (isLength(form.PAYER_ACNTER_CUST_NO.value) != 13) {
			alert("예금주 주민등록번호 13자를 입력해주십시오!");
			form.PAYER_ACNTER_CUST_NO.focus();
			return false;
		}

		if ( !isRegNo(StrPAYERACNTERCUSTNO.substr(0,6), StrPAYERACNTERCUSTNO.substr(6,7)) ) {
			form.PAYER_ACNTER_CUST_NO.focus();
			return false;
		}
	}

	return true;
}

// 전화번호 합산 입력항목 체크 함수...(공통으로 사용함...)
function checkPayerTel() {

	var form = document.mainForm;
/* ++ 사용자 편의를 위해 clear 안함
	form.PAYER_ADDR_FULL_TEXT.value		= "";
	form.PAYER_ADDR_TYPE.value			= "";
	form.PAYER_DONG_CD.value 			= "";
	form.PAYER_ADDR_BLDG_ID.value 		= "";
	form.PAYER_ADDR_BLDG_TYPE_CD.value	= "";
	form.PAYER_ADDR_BLDG_NAME.value 	= "";
	form.PAYER_ADDR_BLDG_NO.value 		= "";
	form.PAYER_ADDR_ROOM_NO.value 		= "";
	form.PAYER_ADDR_NO_TYPE.value 		= "";
	form.PAYER_ADDR_NO.value 			= "";
	form.PAYER_ADDR_HO.value 			= "";
	form.PAYER_ADDR_REF.value 			= "";
*/
/*
	if (isEmpty(form.PAYER_PAY_TELNO1.value) || (!isGenPhone(form.PAYER_PAY_TELNO1.value))) {
		alert("과금번호를 확인해 주십시오!");
		form.PAYER_PAY_TELNO1.focus();
		return false;
	}

	if (isEmpty(form.PAYER_PAY_TELNO2.value)) {
		alert("과금번호를 입력해 주십시오!");
		form.PAYER_PAY_TELNO2.focus();
		return false;
	}

	if (!isInteger(form.PAYER_PAY_TELNO2.value)) {
		alert("과금번호를 숫자로 입력해 주십시오!");
		form.PAYER_PAY_TELNO2.focus();
		return false;
	}

	if (isEmpty(form.PAYER_PAY_TELNO3.value)) {
		alert("과금번호를 입력해 주십시오!");
		form.PAYER_PAY_TELNO3.focus();
		return false;
	}

	if (!isInteger(form.PAYER_PAY_TELNO3.value)) {
		alert("과금번호를 숫자로 입력해 주십시오!");
		form.PAYER_PAY_TELNO3.focus();
		return false;
	}

*/
	// 일반전화이고 필수입력 항목
	if ( !chkFmtTelNo(form.PAYER_PAY_TELNO1, form.PAYER_PAY_TELNO2, form.PAYER_PAY_TELNO3, '1', '1') ) {
		return false;
	}

	form.PAYER_PAY_TELNO.value =  makeFmt4(form.PAYER_PAY_TELNO1.value)
								+ makeFmt4(form.PAYER_PAY_TELNO2.value)
								+ makeFmt4(form.PAYER_PAY_TELNO3.value);

	return true;

}

// 납부자사항에서 주민/법인 입력가능하도록 체크 함수...(가입전신등...)
function checkPayerInfo() {

	var form = document.mainForm;

	// 납부자성명
	if (isEmpty(form.PAYER_NAME.value) || isLength(form.PAYER_NAME.value) > 50) {
		alert("납부자성명을 올바르게 입력해 주십시오!");
		form.PAYER_NAME.focus();
		return false;
	}

	// 납부자 주민등록번호
	var StrPAYERCUSTNO = form.PAYER_CUST_NO.value;
	if (isLength(StrPAYERCUSTNO) != 13) {
		alert("납부자 주민/법인번호 13자를 입력해 주십시오!"); // 2002.03.26
		form.PAYER_CUST_NO.focus();
		return false;
	}

	if ( !isRegNoCheck(StrPAYERCUSTNO.substr(0,6), StrPAYERCUSTNO.substr(6,7)) &&
			!isCorporationNo( StrPAYERCUSTNO ) ) {
		alert("납부자 식별번호(주민번호/법인번호)를 올바르게 입력해 주십시오!");
		form.PAYER_CUST_NO.focus();
		return false;
	}

	if ( !checkPayerPaper() )
		return false;	// 청구서 발행

	// 자동이체를 체크한경우
	if ( form.PAYER_AUTOPAY_GB_CHK.checked ) {
		if ( checkNCBank() == false ) {
			   return false;
		}
	}

	return true;
}

// 납부자사항 입력항목 체크 함수...(공통으로 사용함...)
function checkPayer() {

	var form = document.mainForm;

	// 납부자명
	if (isEmpty(form.PAYER_NAME.value)) {
		alert("납부자명 입력해 주십시오!(최대 50자리까지 입력가능)");
		form.PAYER_NAME.focus();
		return false;
	}
	else if (isLength(form.PAYER_NAME.value) > 50) {
		alert("납부자명 올바르게 입력해 주십시오!(최대 50자리까지 입력가능)");
		form.PAYER_NAME.focus();
		return false;
	}
	else if (isValidValue(form.PAYER_NAME.value, varSYMBOL) == false) {
		alert("납부자명 올바르게 입력해 주십시오!");
		form.PAYER_NAME.focus();
		return false;
	}

	// 납부자 주민등록번호
	var StrPAYERCUSTNO = form.PAYER_CUST_NO.value;
	if (isLength(StrPAYERCUSTNO) == 0) {
		alert("납부자 식별번호를 입력해주십시오!");
		return false;
	}
	if ( form.PAYER_CUST_NO_TYPE.value == "1")	{	// 납부자_주민번호인 경우  // 2002.03.26추가
		if (isLength(StrPAYERCUSTNO) != 13) {
			alert("납부자 주민등록번호 13자를 입력해 주십시오!"); // 2002.03.26
			form.PAYER_CUST_NO.focus();
			return false;
		}

		if ( !isRegNo(StrPAYERCUSTNO.substr(0,6), StrPAYERCUSTNO.substr(6,7)) ) {
			form.PAYER_CUST_NO.focus();
			return false;
		}
	}


	// 전화번호 합산이 있는경우 합산청구인지 청구서발생인지 체크
	if ( eval(form.PAYER_PAY_GB)) {
		if  (form.PAYER_PAY_GB[0].checked) { // 전화요금 합산
			if ( !checkPayerTel() ) return false;
		} else {
/*
			form.PAYER_PAY_TELNO1.value = "";
			form.PAYER_PAY_TELNO2.value = "";
			form.PAYER_PAY_TELNO3.value = "";
*/
			if ( !checkPayerPaper() ) return false;	// 청구서 발행
		}
	} else {
		if ( !checkPayerPaper() ) return false;	// 청구서 발행
	}

	// 자동이체를 체크한경우
	if ( form.PAYER_AUTOPAY_GB_CHK.checked ) {
		if ( checkNCBank() == false ) {
			   return false;
		}
	}

	if ( eval(form.PAYER_INV_MEDIA_CD)) {
		// 자동납부이거나 종이발행을 반드시 선택하라.   2002.05.16
		if (( !form.PAYER_SHEET_OPTION_FLAG_CHK.checked) && ( !form.PAYER_AUTOPAY_GB_CHK.checked ))
		{       alert("자동이체와 종이발행여부 중 하나는 반드시 선택하세요!");
				form.PAYER_SHEET_OPTION_FLAG_CHK.focus();
				return false;
		}
	}

	return true;
}

// 취소버튼을 클릭시 호출 함수
function cancelForm(input)
{
	var form			= document.mainForm;
	var strInPut		= input;

	if (confirm("종료 하시겠습니까 ?") !=true ) {
		return false;
	}

    try{
        if( closeExtCorp() == false ) {
            return ;
        }
    }catch(e){}

	if(strInPut == "REG"){
		// 상품신청 메인의 최초위치로 가자...
		var rtnUrl = "";
		////////////
		// 사외유통망이나 KT-PLAZA일때
		if( form.USR_GB.value == "5" || form.USR_GB.value == "6" ){
		    rtnUrl = form.SUCC_URL.value + "?USR_GB=" + form.USR_GB.value;
		}else{
		    rtnUrl = form.SUCC_URL.value + "?mn=" + form.mn.value + "&scode=" + form.scode.value + "&sname=" + form.sname.value;
	    }

	}else if(strInPut == "CHANGE"){
		// 상품신청 메인의 최초위치로 가자...
		var rtnUrl = "";
		////////////
		// 사외유통망이나 KT-PLAZA일때
		if( form.USR_GB.value == "5" || form.USR_GB.value == "6" ){
		    rtnUrl = form.SUCC_URL.value + "?USR_GB=" + form.USR_GB.value;
		}else{
		    rtnUrl = form.SUCC_URL.value;
	    }

		location.href= rtnUrl;

	}

    location.href= rtnUrl;
}


//유통망이나 플라자 취소버튼 클릭시 추가:2003.05.18 by blacksea
function cancelBusiForm(input){
	var form			= document.mainForm;
	var strInPut		= input

	if (confirm("종료 하시겠습니까 ?") !=true ) {
		return false;
	}
    var usr_gb = form.USR_GB.value;

	if(strInPut == "REG"){
		location.href= "/pa/jsp/pa000m.jsp?USR_GB=" + usr_gb;
	}else if(strInPut == "CHANGE"){
		location.href= "/pa/jsp/pa000m.jsp?USR_GB=" + usr_gb;
	}
}

//주소 팝업
function NewAddrWindow(input)
{
	var strOpenArea = input;

	//lf_TmpAddr_Clear();
	NewWindow2('/po/jsp/po012q_p01.jsp?OPEN_FORM_NAME=mainForm&OPEN_AREA='+strOpenArea,'name','700','600','no','no');
}

//주소 팝업
function NewAddrWindow_ctcz(input)
{
	var strOpenArea = input;

	//lf_TmpAddr_Clear();
	NewWindow2('/po/jsp/po012q_p01.jsp?OPEN_FORM_NAME=mainForm&OPEN_GB=CTCZ&OPEN_AREA='+strOpenArea,'name','700','600','no','no');
}
/*
  가입내역조회 변경에 대한 처리 방법
  1.오더상태
    완료일이 null이 아니면 처리가능
  2.서비스상태
    사용중이 아니면 모든 변경불가
    일시이용중단시  일시이용/중단부활만 가능
*/
function IsChgEnable(orderCompDh,serviceStat,OrdTypeCd)
{
	/*if( orderCompDh == "없음" && serviceStat == "없음") {
		alert( "처리불능!!! 100번으로 문의해 주십시요." );
		return false;
	}*/

	if( orderCompDh == "미완료" ) {
		alert( "현재 접수중이므로 처리할 수 없습니다!!!");
		return false;
	}

	if ( OrdTypeCd == "C2" ) {
		if ( serviceStat != "일시이용중단" && serviceStat != "사용중" ) {
			alert( "일시이용중단/부활처리를 할 수 없습니다!!!" );
			return false;
		}
	} else if( serviceStat != "사용중" ) {
		alert( "사용중이 아니므로 처리 할 수 없습니다!!!" );
		return false;
	}

	return true;
}

/*
  가입내역조회 가설전 변경에 대한 처리 방법
  1.서비스상태
    신규가설중이어야만 처리
*/
function IsChgEnableGasul(orderCompDh,serviceStat,OrdTypeCd)
{
	if( orderCompDh == "미완료" ) {
        ;
	} else{
		alert( "신규 가설중인 자료만 처리할 수 있습니다!!!");
		return false;
	}

    if( serviceStat != "신규가설중" ) {
		alert( "신규 가설중인 자료만 처리할 수 있습니다" );
		return false;
	}

	return true;
}

//각 Form에서 input객체간의 포커스 이동
//문자열 외의 키(방향키 등) 막음 02/02/01
//fname	:객체들이 몸담은 폼이름
//str1	:현재 onFocus()된 객체
//str2	:Focus가 이동되어질 객체
//len		:현재 객체에서 check될 길이
function length_check(fname, str1, str2, len) {

	var strlen = eval("document." + fname + "." + str1 + ".value.length");
	var varCk = window.event.keyCode;

	if ( (varCk>= 48 && varCk<=57) || (varCk>=65 && varCk<=90) || (varCk>=96 && varCk<=105)) {
		if (strlen == len) {
			if( str2 != "") {
				eval("document."+ fname + "." + str2 + ".focus()");
				eval("document."+ fname + "." + str2 + ".select()");
			}
		}
	}
}

//<input>내에서의 Enter키 typing --> 실행
function chkEnter(mthd) {

	if(window.event.keyCode == 13) {
		eval(mthd);
	}
}

// 은행 계좌 체크
function checkNCBank()
{
	var  strBankCd = mainForm.PAYER_BANK_CD.value ;
	var  strAcntNo = mainForm.PAYER_ACNT_NO.value ;

 	// 축협중앙회(16)나 단위축협(17) 삭제 : 자동이체 안됨.
	if ( strBankCd == "16" || strBankCd == "17" ) {
		alert("축협중앙회->농협중앙회, 단위축협->단위농협으로 선택하십시오.\n구축협계좌(13자리)는 자동이체가 불가합니다.");
		return false ;
	}

	// 한국은행, 수출입은행으로 자동이체가 불가
	if ( strBankCd == "01" || strBankCd == "08" ) {
		alert( "한국은행, 수출입은행으로 자동이체가 불가합니다." );
		return false ;
	}

 	// 출금계좌 정통부(우체국) 예금종류 조회
 	if( strBankCd ==  "71" ) {
  		if( getAcntType() == false ) {
   			alert("입력하신 우체국 계좌번호가 잘못 입력되었습니다.");
   			return false;
  		}
	}

	// 농협중앙회 자릿수 체크
 	if( strBankCd ==  "11" ) {
  		if( strAcntNo.length < 11 || strAcntNo.length > 12 ) {
   			alert("입력하신 농협중앙회 계좌번호가 잘못 입력되었습니다.");
   			return false;
  		}
	}

	// 단위농협 자릿수 체크
 	if( strBankCd ==  "12" ) {
  		if( strAcntNo.length != 14 ) {
   			alert("입력하신 단위농협 계좌번호가 잘못 입력되었습니다.");
   			return false;
  		}
	}

	// 새마을금고 유효성 체크
 	if( strBankCd ==  "41" ) {
 		if( checkSmuAcntNo() == false ) {
   			alert("입력하신 새마을금고 계좌번호가 잘못 입력되었습니다.");
   			return false;
  		}
	}
}


    /////////////////////////////////////////////////////////////////////////////////
    //      전화번호를 포맷한다.
    //   000203211143 -> 02-321-1143
    function formatTel(unFormat)
    {
        if(unFormat.length < 12 ){
            return unFormat;
        }

        if(unFormat.substring(0,1) != "0" ){
            return unFormat;
        }

        var first,middle,last;
        first = unFormat.substring(0,4);
        middle = unFormat.substring(4,8);
        last = unFormat.substring(8,12);

		if( first.substring(0,2) == "000" ){
			first = first.substring(2,4);
		}else{
			first = first.substring(1,4);
		}

		if( middle.substring(0,1) == "0" ){
			middle = middle.substring(1,4);
		}
	    return first + "-" + middle + "-" + last;

    }





// 우체국의 예금종류 선택.
/*
 *	(계좌번호 길이 15)14,15자리 : 11->3, 12->4, 17->5, 21->6
 *	(계좌번호 길이 14) 7, 8자리 : 01->3, 02->4, 04->5, 05->6
 */
function getAcntType()
{
	// 계좌번호
	var strAcntNo = mainForm.PAYER_ACNT_NO.value ;

	var str14th = "";		// 신계좌 14자리
	var str15th = "";		// 구계좌 15자리

	if ( strAcntNo.length == 15 ) {
		str15th = strAcntNo.substring(13, 15);

		if ( ( str15th == "11" ) || ( str15th == "12" ) ||
			 ( str15th == "17" ) || ( str15th == "21" ) ) {
			return true ;
		}
	} else if ( strAcntNo.length == 14 ) {
		str14th = strAcntNo.substring(6, 8);

		if ( ( str14th == "01" ) || ( str14th == "02" ) || ( str14th == "06" ) ||
			 ( str14th == "05" ) || ( str14th == "52" ) ) {
			return true;
		}
	}

	return false ;
}

// 새마을금고는 5~6자리가 '09','10'인 자리만 가능.
function checkSmuAcntNo ()
{
	// 계좌번호
	var strAcntNo = mainForm.PAYER_ACNT_NO.value ;
	if( strAcntNo.length < 6 ) {
		return false ;
	}

	var str56th = strAcntNo.substring(4, 6);
	// 새마을금고는 5~6자리가 '09','10'인 자리만 가능.
	if( ( str56th == "09") || ( str56th == "10" ) ) {
		return true;
	}

	return false;
}

// chkCustNo() 함수를 삭제하지 마세요! by gagi
// 내용은 없어도 꼭 필요합니다!
function	chkCustNo(vTXT)
{
}

// 자릿수에 맞춰 앞에 '0'을 추가함다.
// str_value	: raw 값
// int_length	: '0'을 포함한 전체길이
function setZero(str_value, int_length)
{
	var int_cnt = 0;

	for ( int_cnt = str_value.length; int_cnt < int_length; int_cnt++)
		str_value = "0" + str_value;

	return str_value;
}

// 객체 값 전방에 붙어있는 '0' 제거
function cutZero(num)
{
    var s = "";
    var i = 0;

    if (num.length == 0) return "";

    while(num.charAt(i++) == '0')
        if (i==num.length) return "0";

    s = num.substring(i-1);
    return s;
}

/*
// Help Open 다른곳으로 이전하였음
//function HelpOpen(helpUrl) {
//	window.open("/po/help/"+helpUrl,"","width=640,height=400,scrollbars=yes,resizable=yes");
}
*/

function HelpSubOpen(helpUrl, myname) {
	//window.open(helpUrl,name,"width=640,height=400,scrollbars=yes,resizable=yes");
	NewWindow2("/pa/help/"+helpUrl, myname, 640, 400, 'yes', 'yes');
}


// 해당 년월일을 일수로 계산한다.
function countDay(yr,m,d) {

	var montharray = new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec") ;

	var paststring = montharray[m-1] + " " + d + ", " + yr ;

	var vDay = Math.round(Date.parse(paststring) / (24*60*60*1000)) * 1 ;

	return vDay;
}

// 에러 화면 호출
function openMsgDiag(msg){
	window.showModalDialog ('/weblogic/CtosMsgDiag?msgname=' + msg + '&msgtype=E&btncnt=1', '', 'dialogHeight:255px;dialogWidth:479px;status:no; help:no;');
}

// 에러 ID로 화면 호출
//  배성한 2002.10.18 추가
function openMsgIdDiag(msg_id){
    var sendMsg = "msgid=" + msg_id + "&msgtype=E&btncnt=1";
	window.showModalDialog ('/weblogic/CtosMsgDiag?'+sendMsg, '', 'dialogHeight:255px;dialogWidth:479px;status:no; help:no;');
}


// 2003-03-21 4:56오후 배성한 추가
// 개통희망일 조회
function getDatePopup_ADSL()
{
    // 필수입력 data

    var param  = document.mainForm.SVC_OFC_CD.value;
    var param1 = document.mainForm.ADSL_ADDR_TYPE.value;
    var param2 = document.mainForm.ADSL_DONG_CD.value;
    var param3 = document.mainForm.ADSL_ADDR_NO_TYPE.value;
    var param4 = document.mainForm.ADSL_ADDR_NO.value;
    var param5 = document.mainForm.ADSL_ADDR_HO.value;
    var param6 = document.mainForm.ADSL_ADDR_BLDG_TYPE_CD.value;
    var param7 = document.mainForm.ADSL_ADDR_BLDG_NAME.value;
    var param8 = document.mainForm.ADSL_ADDR_BLDG_NO.value;
    var param9 = document.mainForm.ADSL_ADDR_ROOM_NO.value;
    var param0 = document.mainForm.ADSL_ADDR_REF.value;
    // 20021224 BSH 수정처리시 때문에 RS_CD관련 수정
    var addr   = document.mainForm.ADSL_ADDR_FULL_TEXT.value;
    var rscd   = document.mainForm.RS_CD.value;
    // 2003-04-16 6:12오후
    var capaall = "";
    try {
        capaall = document.mainForm.CAPAALL.value;
    } catch (e) { ; }

//    var rscd   = '';
//
//    if(addr.indexOf('서울특별시')>-1) rscd = '1';

    if( param == null || param.length==0 ||param1 == null || param1.length==0 || param2 == null || param2.length==0 ||
        param3== null || param3.length==0 || param4 == null || param4.length==0)
    {
        alert('설치주소를 우선 선택하셔야 합니다');
        document.mainForm.BN_INSTADDR_SEARCH.focus();
        return;
    }

    NewWindow('/po/jsp/po831q_p01.jsp?RS_CD=0&OFC_CD='+param+'&ADDR_TYPE='+param1+'&DONG_CD='+param2+'&ADDR_NO_TYPE='+param3
                                    +'&ADDR_NO='+param4+'&ADDR_HO='+param5+'&ADDR_BLDG_TYPE_CD='+param6
                                    +'&ADDR_BLDG_NAME='+param7+'&ADDR_BLDG_NO='+param8+'&ADDR_ROOM_NO='+param9
                                    +'&ADDR_REF='+param0+'&REAL_RS_CD='+rscd+'&CAPAALL='+capaall,'callOpenDate','690','400','no');
}
// 2003-03-21 4:56오후 배성한 추가

// 2003-04-25 3:49오후 배성한 추가
//주소 팝업 : 신규 주소조회 팝업 적용
function paComm_Popup_Address(ObjAddr, vModal)
{
    var params = "?";
    try
    {
        params = params + "sa_cd="          + ObjAddr.sacd;                         // 상품코드
        params = params + "&flag="          + ObjAddr.flag;                         // 작업구분
        params = params + "&fstareacd="     + ObjAddr.fstareacd;                    // 광역시도 코드
        params = params + "&sndareacd="     + ObjAddr.sndareacd;                    // 시군구 코드
        params = params + "&trdareacd="     + ObjAddr.trdareacd;                    // 동코드
        params = params + "&addrno="        + ObjAddr.AddrNo;                       // 번지
        params = params + "&addrho="        + ObjAddr.AddrHo;                       // 호
        params = params + "&addrtype="      + ObjAddr.addr_type;                    // 주소유형
        params = params + "&addrnotype="    + ObjAddr.AddrNoType;                   // 번지유형
        params = params + "&bldgname="      + ObjAddr.bldg_name;                    // 건물명
        params = params + "&bldgid="        + ObjAddr.bldg_id;                      // 건물 ID
        params = params + "&detail_yn="     + ObjAddr.detail_yn;                    // 수용국, 급지 조회여부(Y/N)
        params = params + "&call_name="     + ObjAddr.call_name;                    // 호출 윈도우구분자 (한 화면에서 주소 두개(청구지 주소, 설치주소)를 호출시 사용함)
        // 2003-06-06 4:33오후
        try {
            params = params + "&USR_GB="    + document.mainForm.USR_GB.value;       // 사용자구분
        } catch (e) {
            params = params + "&USR_GB=6";       // 사용자구분
        }
    } catch (e) { ; }

    if (vModal == true)
    {
        var rtnValue = window.showModalDialog('/weblogic/pa909c_s01'+params, '', 'dialogWidth:620px;dialogHeight:600px;status:no;help:no;');

        // 주소 조회 window에서 확인버튼 클릭시만 rtnValue가 Object로 넘어온다.
        try        {
            if (typeof(rtnValue) == "object") childwindow_address(rtnValue);
        } catch (e) { ; }
    }
    else
    {
        NewWindow2('/weblogic/pa909c_s01'+params, '', '620', '600', 'no', 'no');
    }
}

// 메세지 표시 처리 start
try
{
    Msgbox = new objMsgBox();
}
catch (e) { ; }

function objMsgBox()
{
    this.show = MsgBox_Display;
    this.Display = MsgBox_Display;
}
// tgt : A-alert, C-Confirm, W-window(MessageID로 표시), M-window(Message 자체로 표시)
function MsgBox_Display(msg, tgt, str1, str2, str3)
{
    var vmsg = msg;
    var smsg = "";

    if ((tgt == null) || (tgt == "") || (tgt == "A"))
    {
        if ((str1 == null) || (str1 == "")) { alert(vmsg); return; }
        else vmsg = StringReplace(vmsg, "%s", str1);
        if ((str2 == null) || (str2 == "")) { alert(vmsg); return; }
        else vmsg = StringReplace(vmsg, "%s", str2);
        if ((str3 == null) || (str3 == "")) { alert(vmsg); return; }
        else vmsg = StringReplace(vmsg, "%s", str3);
        alert(vmsg);
    }
    else if (tgt == "C")
    {
        if ((str1 == null) || (str1 == "")) { return confirm(vmsg); }
        else vmsg = StringReplace(vmsg, "%s", str1);
        if ((str2 == null) || (str2 == "")) { return confirm(vmsg); }
        else vmsg = StringReplace(vmsg, "%s", str2);
        if ((str3 == null) || (str3 == "")) { return confirm(vmsg); }
        else vmsg = StringReplace(vmsg, "%s", str3);
        return confirm(vmsg);
    }
    else if (tgt == "W")
    {
        openMsgIdDiag(msg);
    }
    else if (tgt == "M")
    {
        openMsgDiag(msg);
    }
}
// 메세지 표시 처리 end

// 받은메세지에서 v_s1값을 찾아서 v_s2로 대치한다.
function StringReplace(v_msg, v_s1, v_s2)
{
    var idx = v_msg.indexOf(v_s1);

    if (idx == -1) return v_msg;
    else return v_msg.substring(0, idx) + v_s2 + v_msg.substring(idx+2);
}

// 현재 radio rObj의 선택된 index값을 return한다.
function getRadioIndex(rObj)
{
    var i;
    var rtn;
    try
    {
        for(i=0;i<rObj.length;i++)
            if (rObj[i].checked == true) return i;
    }
    catch (e) { return ""; }
    return rtn;
}

// 현재 radio rObj의 선택된 index값을 return한다.
function getRadioValue(rObj)
{
    var i;
    var rtn;
    try
    {
        for(i=0;i<rObj.length;i++)
            if (rObj[i].checked == true) return rObj[i].value;
    }
    catch (e) { return ""; }
    return rtn;
}

// 지역번호 및 핸드폰 가능 번호 체크
function chkTelJiyuk2(input1, flag1, vfoc){
	//////////////////////////////////////////////////////////////////////////
	// input 1	: 지역번호를 입력하는 text의 name							//
	// flag1	: '1' --> 전화체크, '2' --> 핸드폰체크, '3' --> 둘다 체크	//
	// vfoc     : 'Y' --> focus 이동, 'N' --> focus 이동안함                //
	//////////////////////////////////////////////////////////////////////////
	var strVal1		= input1.value;
	var strFlag1	= flag1;

    if (strVal1 == "")
    {
        alert("지역번호를 입력하세요.");
		if (vfoc == "Y") input1.focus();
        return false;
    }

	if(strFlag1 == "1"){
		// 숫자입력 체크
		if(!isInteger(strVal1,'')){
			alert("숫자만 입력 가능합니다!!!");
			if (vfoc == "Y") input1.focus();
			return false;
		}

		// 길이 체크
		if(isLength(strVal1) < 3){
			if(strVal1 != "02"){
				alert("지역번호를 바르게 입력하세요!!!");
    			if (vfoc == "Y") input1.focus();
				return false;
			}
		}

		// 지역번호 체크
		if(!isGenPhone(strVal1)){
			alert("지역번호를 바르게 입력하세요!!!");
			if (vfoc == "Y") input1.focus();
			return false;
		}

		return true;

	}else if(strFlag1 =="2"){
		// 숫자입력 체크
		if(!isInteger(strVal1,'')){
			alert("숫자만 입력 가능합니다!!!");
			if (vfoc == "Y") input1.focus();
			return false;
		}

		// 길이 체크
		if(isLength(strVal1) < 3){
			alert("핸드폰 번호를 바르게 입력하세요!!!");
			if (vfoc == "Y") input1.focus();
			return false;
		}

		// 지역번호 체크
		if(!isCellarPhone(strVal1)){
			alert("핸드폰 번호를 바르게 입력하세요!!!");
			if (vfoc == "Y") input1.focus();
			return false;
		}

		return true;

	}else{
		// 숫자입력 체크
		if(!isInteger(strVal1,'')){
			alert("숫자만 입력 가능합니다!!!");
			if (vfoc == "Y") input1.focus();
			return false;
		}

		// 길이 체크
		if(isLength(strVal1) < 3){
			if(strVal1 != "02"){
				alert("지역번호를 바르게 입력하세요!!!");
    			if (vfoc == "Y") input1.focus();
				return false;
			}
		}

		// 지역번호 체크
		if(!isCellarPhone(strVal1) && !isGenPhone(strVal1)){
			alert("번호를 바르게 입력하세요!!!");
			if (vfoc == "Y") input1.focus();
			return false;
		}

		return true;
	}
}

// 번호체크
function chkTelKukbun2(input2, vfoc)
{
	//////////////////////////////////////////////////////////////////////////
	// input 2	: 국번을 입력하는 text의 name								//
	//////////////////////////////////////////////////////////////////////////
	var strVal2		= input2.value;

    if (strVal2 == "")
    {
        alert("국번을 입력하세요.");
		if (vfoc == "Y") input2.focus();
        return false;
    }

	// 숫자 체크
	if(!isInteger(strVal2,'')){
		alert("숫자만 입력이 가능합니다!!!");
		if (vfoc == "Y") input2.focus();
		return false;

	}

	// 길이 체크
	if(isLength(strVal2) < 3){
		alert("국번은 3자리 이상 입력하셔야 합니다!!!");
		if (vfoc == "Y") input2.focus();
		return false;
	}else{
		/*
		if((strVal2.substring(0,1) == "0") && (isLength(strVal2) == 3)){
			alert("맨앞자리에 '0'이 올 수가 없습니다!!!");
    		if (vfoc == "Y") input2.focus();
			return false;
		}
		*/
		if((strVal2.substring(0,2) == "00") && (isLength(strVal2) == 4)){
			alert("맨앞자리에 '00'이 올 수가 없습니다!!!");
    		if (vfoc == "Y") input2.focus();
			return false;
		}
	}

	return true;
}

// 전번체크
function chkTelNo2(input3, vfoc)
{
	//////////////////////////////////////////////////////////////////////////
	// input 3	: 번호를 입력하는 text의 name								//
	//////////////////////////////////////////////////////////////////////////
	var strVal3		= input3.value;

    if (strVal3 == "")
    {
        alert("번호를 입력하세요.");
		if (vfoc == "Y") input3.focus();
        return false;
    }

	// 숫자 체크
	if(!isInteger(strVal3,'')){
		alert("숫자만 입력이 가능합니다!!!");
		if (vfoc == "Y") input3.focus();
		return false;
	}

	// 길이 체크
	if(isLength(strVal3) < 4){
		alert("번호의 자릿수는 4자리입니다!!!");
		if (vfoc == "Y") input3.focus();
		return false;
	}

	return true;
}

// 전화번호 체크
function chkFmtTelNo2(input1, input2, input3, flag1, flag2, vfoc )
{
	//////////////////////////////////////////////////////////////////////////
	// input 1	: 지역번호를 입력하는 text의 name							//
	// input 2	: 국번을 입력하는 text의 name								//
	// input 3	: 번호를 입력하는 text의 name								//
	// flag1	: '1' --> 전화체크, '2' --> 핸드폰체크, '3' --> 둘다 체크	//
	// flag2	: '1' --> 필수 입력 사항, '2' --> NON 필수 입력 사항		//
	//////////////////////////////////////////////////////////////////////////

	var strVal1		= input1.value;
	var strVal2		= input2.value;
	var strVal3		= input3.value;
	var strFlag1	= flag1;
	var strFlag2	= flag2;

	// 필수인지 아닌지를 구별
	if(strFlag2 == "1"){
		// 지역번호 및 핸드폰 가능 번호 체크 함수 호출
		if(!chkTelJiyuk2(input1, flag1, vfoc)){
			return false;
		}

		// 번호체크 함수 호출
		if(!chkTelKukbun2(input2, vfoc)){
			return false;
		}

		// 전번체크 함수 호출
		if(!chkTelNo2(input3, vfoc)){
			return false;
		}

	} else {
		if(isEmpty(strVal1) && isEmpty(strVal2) && isEmpty(strVal3)) {
			return true;
		} else {
			// 지역번호 및 핸드폰 가능 번호 체크 함수 호출
			if(!chkTelJiyuk2(input1, flag1, vfoc)){
				return false;
			}

			// 번호체크 함수 호출
			if(!chkTelKukbun2(input2, vfoc)){
				return false;
			}

			// 전번체크 함수 호출
			if(!chkTelNo2(input3, vfoc)){
				return false;
			}
		}
	}

	return true;
}

// Login ID 유효성 체크
function paComm_IsFitLoginId(ObjSvcNo,strMsg)
{
    var vStrMsg = "";

	if ("undefined" == typeof(strMsg)) {
	    vStrMsg = "";
	} else {
	    vStrMsg = strMsg;
	}

    var vloginid = ObjSvcNo.value;

    if (vloginid == "")
    {
        if ( vStrMsg == "" ) {
            // 로그인ID를 확인하세요
            Msgbox.show(MCSNI5179);
        } else {
            alert(  vStrMsg + "를 확인하세요");
        }

        return false;
    }

    // 시스템에서 사용하는 문자는 허용않함
    if ((vloginid == "admin")     || (vloginid == "master")    || (vloginid == "webadmin")  ||
        (vloginid == "webmaster") || (vloginid == "helpme"))
    {
        // 사용할수 없는 ID입니다.");
        Msgbox.show(MCSNI5240);
        return false;
    }

    // 로그인ID를 잘못입력한 경우
    var nLength = vloginid.length;
    if ((nLength < 4) || (nLength > 15) || (vloginid.charAt(0) < 'a') || (vloginid.charAt(0) > 'z'))
    {

        if ( vStrMsg == "" ) {
            // 로그인 ID를 4자리 이상 15자리 이하로 입력하세요
            Msgbox.show(MCSNI5174);
        } else {
            alert(  vStrMsg + "를 4자리 이상 15자리 이하로 입력하세요");
        }
        return false;
    }

    // 특수문자가 존재하는 경우
    for (var i=1; i<nLength; i++)
    {
        if ((vloginid.charAt(i) < '0' || vloginid.charAt(i) > '9') &&
            (vloginid.charAt(i) < 'a' || vloginid.charAt(i) > 'z'))
        {
            if ( vStrMsg == "" ) {
                // 로그인ID에 소문자,숫자이외의 문자는 사용할 수 없습니다
                Msgbox.show(MCZZI0044);
            } else {
                alert(  vStrMsg + "에 소문자,숫자이외의 문자는 사용할 수 없습니다");
            }
            return false;
        }
    }
    return true;
}

function paComm_IsFitPasswd(ObjSvcNo, ObjPasswd)
{
    var vSvcNo = ObjSvcNo.value;
    var vPasswd = ObjPasswd.value;

	// 입력자료 체크
	if ( vPasswd == "" )
	{
		// alert("비밀번호를 입력하세요!");
		Msgbox.show(MCSNI5012);
		ObjPasswd.focus();
		return	false;
	}
	if ( isString(vPasswd, varSYMBOL) == false ) {
		 alert("비밀번호는 영숫자만 가능합니다!");
		//Msgbox.show(MCSNI7545);
		ObjPasswd.focus();
		return	false;
	}

    if ( vPasswd == false ) {
		if ( vPasswd == '000000' || vPasswd == '0000000' || vPasswd == '00000000' ) {

		} else {
    		 alert("비밀번호는 영숫자만 가능합니다!");
    		//Msgbox.show(MCSNI7545);
    		ObjPasswd.focus();
    		return	false;
        }
	}

	if ( vPasswd.length < 6  ) {
		// alert("비밀번호를 6~8자로 입력하세요!");
		Msgbox.show(MCZZI0057, "A", "6", "8");
		ObjPasswd.focus();
		return false;
	}
	//------- 대문자가 존재하는지 여부 체크
	var chk = false;
	for (var i=0; i<=vPasswd.length-1; i++) {
			ch = vPasswd.substring(i,i+1);
			if (ch>="A" && ch<="Z") {
				chk = true;
				break;
			}
	}
	if (chk == true) {
		// alert("비밀번호는 영문소문자,숫자로만 입력하셔야 합니다!");
		Msgbox.show(MCSNI7545);
		ObjPasswd.focus();
		return false;
	}
	//-----아이디와 패스워드가 동일여부 체크
	if (vPasswd == vSvcNo) {
		// alert("아이디와 패스워드가 동일합니다.다르게 입력해야 합니다!");
		Msgbox.show(MCSNI5214);
		ObjPasswd.focus();
		return false;
	}

//	if ( document.mainForm.tPASSWD2.value == "" )
//	{
//		alert("비밀번호를 입력하세요!");
//		document.mainForm.tPASSWD2.focus();
//		return false;
//	}
//	if ( isString(document.mainForm.tPASSWD2.value, '') == false ) {
//		alert("비밀번호는 영숫자만 가능합니다!");
//		document.mainForm.tPASSWD2.focus();
//		return false;
//	}
//
//	var strPw2 = document.mainForm.tPASSWD2.value;
//	if ( strPw2.length < 6  ) {
//		alert("비밀번호를 6~8자로 입력하세요!");
//		document.mainForm.tPASSWD2.focus();
//		return false;
//	}
//
//	if (strPw != strPw2) {
//		alert("비밀번호와 비밀번호확인이 서로 다릅니다. 확인후 입력하세요!");
//		document.mainForm.tPASSWD2.focus();
//		return false;
//	}
    return true;
}

// 개통희망일을 조회한다.
function paComm_Popup_CompleteDate(rObj, flag)
{
    // 필수입력 data
    var param   = rObj.svc_ofc_cd;                  // 수용국코드
    var param1  = rObj.addr_type;                   // 주소유형
    var param2  = rObj.dong_cd;                     // 동코드
    var param3  = rObj.addr_no_type;                // 번지유형
    var param4  = rObj.addr_no;                     // 번지
    var param5  = rObj.addr_ho;                     // 호
    var param6  = rObj.addr_bldg_type_cd;           // 건물유형
    var param7  = rObj.addr_bldg_name;              // 건물명
    var param8  = rObj.addr_bldg_no;                // 빌딩NO
    var param9  = rObj.addr_room_no;                //
    var param0  = rObj.addr_ref;                    // 참조주소
    var addr    = rObj.addr_full_text;              // 전체주소
    var rscd    = rObj.rs_cd;                       // RS CD
    var capaall = rObj.capaall;                     // 가설용량 초과시 선택 가능 여부
    var USR_GB  = rObj.USR_GB;                      // USR_GB
    var param10 = rObj.gSacd;                       // sa_cd
    var param11 = rObj.cust_id;                     // cust_id
    var param12 = rObj.orderNo;                     // orderNo
    var param13 = rObj.OrderType;                   // OrderType



    var ChgCompFlag = rObj.strChgCompletDayFlag;    // 가설예약 변경시 변경사유 추가 2003.12.15 김미경

    if( param1 == null || param1.length==0 || param2 == null ||
        param2.length==0 || param3== null || param3.length==0 || param4 == null || param4.length==0)
    {
        // alert('설치주소를 우선 선택하셔야 합니다');
        Msgbox.show(MCSNI9953);
        return;
    }

    if( param11 == null || param11.length==0 ){
        alert("계약자 사항을 조회하셔야 합니다.");
        return;
    }

    NewWindow('/pa/jsp/pa910c_p02.jsp?RS_CD=0&OFC_CD='+param+'&ADDR_TYPE='+param1+'&DONG_CD='+param2+'&ADDR_NO_TYPE='+param3
                                    +'&ADDR_NO='+param4+'&ADDR_HO='+param5+'&ADDR_BLDG_TYPE_CD='+param6
                                    +'&ADDR_BLDG_NAME='+param7+'&ADDR_BLDG_NO='+param8+'&ADDR_ROOM_NO='+param9
                                    +'&CHGCOMFLAG='+ChgCompFlag  // 가설예약 변경시 변경사유 추가 2003.12.15 김미경
                                    +'&USR_GB='+USR_GB  // 가설예약 변경시 변경사유 추가 2003.12.15 김미경
                                    +'&cust_id='+param11  // 가설예약 구조변경 추가 2004년 4월 10일  토요일  04:47:25 오후 김미경
                                    +'&gSacd='+param10  // 가설예약 구조변경 추가 2004년 4월 10일  토요일  04:47:25 오후 김미경
                                    +'&orderNo='+param12  // 가설예약 구조변경 추가 2004년 4월 13일  화요일  10:34:19 오전 김미경
                                    +'&OrderType='+param13  // 가설예약 구조변경 추가 2004년 4월 13일  화요일  10:34:30 오전 김미경
//-----------------------------------------------------------------------------
//  신 디자인 추가  2004/06/04 14:49:34 요청자 : 김미경,김지영
//-----------------------------------------------------------------------------
                                    +'&ADDR_REF='+param0+'&REAL_RS_CD='+rscd+'&CAPAALL='+capaall, 'callOpenDate', '630', '400', 'yes');
//-----------------------------------------------------------------------------
}


// 2003-05-09 20:00 권보성 추가
var jiyukStat = false;  // 지역번호 작업 플래그(onBlur 이벤트 제어용)

// 지역번호 및 핸드폰 가능 번호 체크(탭기능 추가)
// KTP(0130) Logic 추가. by 2003.10.10 이재용
function telJiyuk_onKey(input1, input2, flag1){
	//////////////////////////////////////////////////////////////////////////
	// input 1	: 지역번호를 입력하는 text의 name							    //
	// input 2	: 국번을 입력하는 text의 name								    //
	// flag1	: '1' --> 전화체크, '2' --> 핸드폰체크, '3' --> 둘다 체크	    //
	//////////////////////////////////////////////////////////////////////////
	var strVal1		= input1.value;
	var strFlag1	= flag1;
	var varCk       = window.event.keyCode;

    //BackSpace or Tab or Del keyCode 무시
    if ( varCk == 8 || varCk == 9 || varCk == 46 ) {
		return true;
	}

    jiyukStat = false;

    // 숫자입력 체크

	if(!isInteger(strVal1,'')) {
		alert("숫자만 입력 가능합니다!!!");
		jiyukStat = true;
		input1.focus();
		input1.select();
		return false;
	}

	if(strFlag1 == "1") {   // 일반전화
	    // 두자리 이하 길이 무시
	    if( isLength(strVal1) < 2 ) {
	        jiyukStat = true;
			return false;
		}

	    // 길이 체크
	    if( (isLength(strVal1) < 3) && (strVal1 != "02") ) {
	        jiyukStat = true;
			return false;
		}

		/*
        // 지역번호 체크
		if( !isGenPhone(strVal1) ) {
			if(!trim(strVal1) == ""){
				alert("지역번호를 바르게 입력하세요!!!");
			}
			jiyukStat = true;
			input1.focus();
			input1.select();
			return false;
		}
		*/
	} else if(strFlag1 =="2") { // 휴대전화
		// 세자리 이하 길이 무시
		if(isLength(strVal1) < 3) {
		    jiyukStat = true;
			return false;

        // 휴대전화가 KTP(0130)일경우 by 2003.10.10 이재용
		} else if(isLength(strVal1) == 3 && strVal1 == "013") {
            jiyukStat = true;
            return false;
        }

		/*
		// 이동통신사 번호 체크
		if(!isCellarPhone(strVal1)) {

			if( !trim(strVal1) == ""){
				alert("핸드폰 번호를 바르게 입력하세요!!!");
			}
			jiyukStat = true;
			input1.focus();
			input1.select();
			return false;
		}
    	*/


	} else {    // 일반 or 휴대전화
		// 길이 체크
		if(isLength(strVal1) < 3) {
			if(strVal1 == "02")	{
				;
			} else {
			    jiyukStat = true;
			    return false;
			}
		}
		/*
		// 지역번호 체크
		if(!isCellarPhone(strVal1) && !isGenPhone(strVal1))	{
			alert("지역(이동통신)번호를 바르게 입력하세요!!!");
			jiyukStat = true;
			input1.focus();
			input1.select();	return false;
		}
		*/

	}

    jiyukStat = true;
	input2.focus();
	input2.select();
    return true;
}


// 지역번호 및 핸드폰 가능 번호 체크(탭기능 추가)
function telJiyuk_onBlur(input1, input2, flag1){
	//////////////////////////////////////////////////////////////////////////
	// input 1	: 지역번호를 입력하는 text의 name							    //
	// input 2	: 국번을 입력하는 text의 name								    //
	// flag1	: '1' --> 전화체크, '2' --> 핸드폰체크, '3' --> 둘다 체크	    //
	//////////////////////////////////////////////////////////////////////////
	var strVal1		= input1.value;
	var strFlag1	= flag1;
	var varCk       = window.event.keyCode;

	//BackSpace or Tab or Del keyCode 무시
    if ( varCk == 8 || varCk == 9 || varCk == 46 ) {
		return true;
	}

    // key이벤트 처리 후
    if(jiyukStat == true) {
        // 숫자입력 체크
    	if(!isInteger(strVal1,'')) {
    		alert("숫자만 입력 가능합니다!!!");return false;
    	}

		/*
    	if(strFlag1 == "1") {   // 일반전화
    		// 지역번호 체크
    		if( !isGenPhone(strVal1) ) {
    			if( trim(strVal1) != ""){
    				alert("지역번호를 바르게 입력하시오!!!");
    			}
    			return false;
    		}

    	} else if(strFlag1 =="2") { // 휴대전화
    		// 지역번호 체크
    		if(!isCellarPhone(strVal1)) {
    			if( trim(strVal1) != ""){
    				alert("핸드폰 번호를 바르게 입력하시오!!!");
    			}
    			return false;
    		}

    	} else {    // 일반 or 휴대전화
    		// 길이 체크
    		if(isLength(strVal1) < 3) {
    			if(strVal1 == "02")	{
    				;
    			} else return true;
    		}

    		// 지역(이동통신)번호 체크
    		if(!isCellarPhone(strVal1) && !isGenPhone(strVal1))	{
    			alert("지역(이동통신)번호를 바르게 입력하시오!!!");
    		alse;
    		}
    	}
    	*/
    }
}


var kukStat = false;    // 국번 작업 플래그(onBlur 이벤트 제어용)
// 국번호 체크(key up시)
function telKuk_onKey(input2, input3)
{
	//////////////////////////////////////////////////////////////////////////
	// input 2	: 국번을 입력하는 text의 name								    //
	// input 3	: 번호를 입력하는 text의 name								    //
	//////////////////////////////////////////////////////////////////////////
	var strVal2		= input2.value;

	//if ( event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 46) {
	//    input1.focus();
	//    kukStat = false;
	//	return false;
	//}
    kukStat = false;

/*
    if( strVal2.substring(0,1) == "0" ) {
		alert("맨앞자리에 '0'이 올 수가 없습니다!!!");
		//input2.value = strVal2.substring(1);
		kukStat = true;
		return false;
	}
*/
	// 숫자 체크
	if(!isInteger(strVal2,'')) {
		alert("숫자만 입력이 가능합니다!!!");
		kukStat = true;
		return false;
	}

	// 번호필드로 포커스 이동
	if ( isLength(strVal2) == 3 ) {
	    kukStat = true;
		input3.focus();
		input3.select();
	}

    kukStat = true;
	return true;
}

// 국번호 체크(focus이동시)
function telKuk_onBlur(input2, input3)
{
	//////////////////////////////////////////////////////////////////////////
	// input 2	: 국번을 입력하는 text의 name								    //
	// input 3	: 번호를 입력하는 text의 name								    //
	//////////////////////////////////////////////////////////////////////////
	var strVal2		= input2.value;

	if ( event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 46) {
	//    input1.focus();
		return false;
	}

    if(kukStat == false) return false;

	// 국번 길이 체크
	/*
	if ( isLength(strVal2) < 3 ) {
		alert("세자리 이상의 국번을 입력하시?!!");
		return false;
	}

/*    // 국번 첫째자리 체크

	if( strVal2.substring(0,1) == "0" ) {
		alert("맨앞자리에 '0'이 올 수가 없습니다!!!");
		//input2.value = strVal2.substring(1);
		return false;
	}
	*/
	// 숫자 체크
	if(!isInteger(strVal2,'')) {
		alert("숫자만 입력이 가능합니다!!!");
		return false;
	}

	return true;
}


var noStat = false; // 전번 작업 플래그(onBlur 이벤트 제어용)
// 전번 체크(KeyUp이동시)
// 전번 체크(KeyUp이동시)
function telNo_onKey(input2, input3)
{

	//////////////////////////////////////////////////////////////////////////
	// input 2	: 국번호를 입력하는 text의 name								//
	// input 3	: 번호를 입력하는 text의 name								    //
	//////////////////////////////////////////////////////////////////////////
	var strVal3		= input3.value;

    if ( event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 46) {
	//    input1.focus();
		return false;
	}

    kukStat = false;

	// 숫자 체크
	if(!isInteger(strVal3,'')) {
		alert("숫자만 입력이 가능합니다!!!");
		kukStat = true;
		//input3.focus();
		return false;
	}

	if(input2.value.length !=4 ){
		if ( strVal3.length == 5 ) {
			strVal3 = strVal3.substring(0,1);
    	    input2.value = input2.value.substring(0,3) + strVal3;
			input3.value = input3.value.substring(1,5);
		}
	}

	if(strVal3.length ==5 ){
		input3.value = strVal3.substring(0,4);
	}

    kukStat = true;
	return true;
}
// 전번체크(focus이동시)
function telNo_onBlur(input3)
{
	//////////////////////////////////////////////////////////////////////////
	// input 2	: 국번호를 입력하는 text의 name								//
	// input 3	: 번호를 입력하는 text의 name								    //
	//////////////////////////////////////////////////////////////////////////
	var strVal3		= input3.value;

    if ( event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 46) {
	//    input1.focus();
		return false;
	}

    if(kukStat == false) return false;

	// 전번 길이 체크
	//if ( isLength(strVal3) < 4 ) {
	//	alert("네자리 이상의 전화번호를 입력하시오!!!");
	//	return false;
	//}

	if ( isLength(strVal3) == 2 ) {
		input3.value = "00" + strVal3;
		//return false;
	}

	/*
	if ( isLength(strVal3) == 1 || isLength(strVal3) == 3) {
		alert("네자리 이상의 전화번호를 입력하시!!");
		return false;
	}
	*/
	return true;
}


/**
* changeTelNumberSplit                                        <BR>
* 문자열로 입력된 숫자12자리 전화번호를 받아 국번,지역번호,번호로 분리해서 return한다.
* @param    numberValue   String 입력받은 문자열
*           gbn           1:국번 2:지역번호 3:번호
* ex) "005305427845", 1  ----> "053"
*     "005305427845", 2  ----> "542"
*     "005305427845", 3  ----> "7845"
* @return   Str           String 분리된 전화번호 출력
*/
function changeTelNumberSplit(numberValue, gbn) {
	if(numberValue == "" || numberValue == null || numberValue.length != 12)
	{
		return "";
    }

	var telNumber = "";

	switch ( gbn ){
		case 1 :
			telNumber = numberValue.substring(0,4);
			if(telNumber.charAt(0) == "0")
			{//0661
				var first = "";
				first = telNumber.substring(1,4);
				if(first.charAt(0) != "0")
				{
					return telNumber;
				}
				else
				{//0032
					var second = "";
					second = telNumber.substring(2,4);
					if(second.charAt(0) != "0")
					{
						return first;
					}
					else
					{//0002
						var third = "";
						third = telNumber.substring(3,4);
						if(third.charAt(0) != "0")
						{
							return second;
						}
					}//0002
				}//0032

			}//0661
			else
			{
				return telNumber;
			}

		case 2 :
			telNumber = numberValue.substring(4,8);
			if(telNumber.charAt(0) == "0")
			{
				return numberValue.substring(5,8);
			}
			else
			{
				return telNumber;
			}

		case 3 :
			return numberValue.substring(8,12);
	}

	return "";

}//changeTelNumberSplit(String numberValue, gbn)


/**
* custNoSplit                                        <BR>
* 문자열로 입력된 13자리의 주민번호를 받아 앞자리6자리와 뒷자리7자리로 분리해서 return한다.
* @param    numberValue   String 입력받은 문자열
*           gbn           1:주민번호6자리 2:주민번호7자리
* ex) "1234561234567", 1  ----> "123456"
*     "1234561234567", 2  ----> "1234567"
* @return   Str           String 앞자리와 뒷자리가 분리된 주민번호 출력
*/
function custNoSplit(custNoValue, gbn) {
    var custNo = "";
	switch ( gbn ){
		case 1 :
			custNo = custNoValue.substring(0,6);
            break;
		case 2 :
			custNo = custNoValue.substring(6,13);
            break;
		case 3 :
			custNo = "";
            break;
	}
    return custNo;
}


// 2003-05-17 5:57오후 배성한 추가 start
// 부가서비스 조회
function PaComm_Popup_SubSvc(rObj, vModal)
{
    var params = "";

    try
    {
        params = params + "?SA_CD="             + rObj.sa_cd;
        params = params + "&SVC_TYPE_CD="       + rObj.svc_type_cd;
        params = params + "&SUBSVC_P_SA_CD="    + rObj.subsvc_p_sa_cd;

        var subsvc_len = rObj.subsvc_svc_no.length;
        for(var i=0; i<subsvc_len; i++)
        {
            params = params + "&SUBSVC_SA_CD="              + rObj.subsvc_sa_cd[i].value;
            params = params + "&SUBSVC_PROC_TYPE="          + rObj.subsvc_proc_type[i].value;
            params = params + "&SUBSVC_SELF_INDEX="         + rObj.subsvc_self_index[i].value;
            params = params + "&SUBSVC_SVC_NO="             + rObj.subsvc_svc_no[i].value;
            params = params + "&SUBSVC_PASSWD="             + rObj.subsvc_passwd[i].value;
            params = params + "&SUBSVC_PAY_BASE="           + rObj.subsvc_pay_base[i].value;
            params = params + "&SUBSVC_SELLER_TYPE_CD="     + rObj.subsvc_seller_type_cd[i].value;
            params = params + "&SUBSVC_SELLER_ID="          + rObj.subsvc_seller_id[i].value;
            params = params + "&SUBSVC_SELLER_NAME="        + rObj.subsvc_seller_name[i].value;
            params = params + "&SUBSVC_OLD_SA_CD="          + rObj.subsvc_old_sa_cd[i].value;
            params = params + "&SUBSVC_OLD_PROC_TYPE="      + rObj.subsvc_old_proc_type[i].value;
            params = params + "&SUBSVC_OLD_SELF_INDEX="     + rObj.subsvc_old_self_index[i].value;
            params = params + "&SUBSVC_OLD_SVC_NO="         + rObj.subsvc_old_svc_no[i].value;
            params = params + "&SUBSVC_OLD_PASSWD="         + rObj.subsvc_old_passwd[i].value;
            params = params + "&SUBSVC_OLD_PAY_BASE="       + rObj.subsvc_old_pay_base[i].value;
            params = params + "&SUBSVC_OLD_SELLER_TYPE_CD=" + rObj.subsvc_old_seller_type_cd[i].value;
            params = params + "&SUBSVC_OLD_SELLER_ID="      + rObj.subsvc_old_seller_id[i].value;
            params = params + "&SUBSVC_OLD_SELLER_NAME="    + rObj.subsvc_old_seller_name[i].value;
        }
    } catch (e) { ; }

    if (vModal == true)
    {
        var rtnValue = window.showModalDialog('/weblogic/pa911c_s01'+params, '', 'dialogWidth:600px;dialogHeight:460px;status:no;help:no;');

        if (typeof(rtnValue) != "undefined" && rtnValue != "NONE")
        {
            Layer_SubSvc.innerHTML = rtnValue;
        }
        // 주소 조회 window에서 확인버튼 클릭시만 rtnValue가 Object로 넘어온다.
        try        {
            childwindow_subsvc(rtnValue);
        } catch (e) { ; }
    }
    else
    {
        NewWindow2('/weblogic/pa911c_s01'+params, '', '600', '400', 'no', 'no');
    }
}

function paComm_Popup_Equip()
{
    NewWindow2('/pa/jsp/pa912c_p01.jsp','','600','450','no','no');
}

//년, 월의 리스트박스 onChange 시에 호출되는 함수
function selectDate ( YR, MT, DY ) {
	var year  = YR.value;
	var day   = 0;
	var month = MT.selectedIndex;

	var today =  new Date();

    // 2003-06-04 9:59오후
    //  배성한 수정함
	var falDay   = "";
	try { falDay = Number(DY.value) ; } catch(e) { falDay = 1; }
    // 2003-09-08 1:52오후 배성한 수정함
//	try { falDay = DY.selectedIndex+1; } catch(e) { falDay = 1; }
	displayCalendar(month, year, DY, falDay);
	if (falDay > (DY.selectedIndex+1)) DY.selectedIndex = 0;
}

//각 달에 맞는 날짜를 실제로 리스트박스에 만들어주는 함수
function displayCalendar(month, year, l_DAY, s_day) {

	var arrChild = null;
	var arrChildName = null;
	arrChild = new Array;
	arrChildName = new Array;

	arrChild[0] = new Option();
	arrChildName[0] = new String();

	month = parseInt(month);
	year = parseInt(year);
	var i = 0;
	var j = 0;
	var days = getDaysInMonth( month + 1, year);

	var firstOfMonth = new Date (year, month, 1);
	var startingPos = firstOfMonth.getDay();

	for (j = 0; j < l_DAY.options.length; j++) {
		l_DAY.options[j] =null;
	}

	for (i = 0; i < days; i++) {
		arrChild[i] = new Option(i+1);
		arrChildName[i] = new String(i+1);
		l_DAY.options[i] =arrChild[i];

		if (i < 9){                                   //8자리로  맞추기 위해 10일보다 작은 일자는 2자리로..  ex)
			l_DAY.options[i].value = "0";
			l_DAY.options[i].value +=arrChildName[i];
			l_DAY.options[i].text = "0";
			l_DAY.options[i].text +=arrChildName[i];
		}else{
			l_DAY.options[i].text  =arrChildName[i];
			l_DAY.options[i].value =arrChildName[i];

		}
	}

	if (s_day < 10) {                          // 추가  2002/01/01
	 s_day = "0".concat(s_day);
	}

	l_DAY.selectedIndex = s_day;     //일자에 오늘 날짜로 ......
	l_DAY.value = s_day;
}

function getDaysInMonth(month,year)  {
		var days;
		if (month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12)  days=31;
		else if (month==4 || month==6 || month==9 || month==11) days=30;
		else if (month==2)  {
		if ( isLeapYear(year) ) { days=29; }
		else { days=28; }
		}
		return (days);
}


function isLeapYear (Year) {
		if (((Year % 4)==0) && ((Year % 100)!=0) || ((Year % 400)==0)) {
		return (true);
		} else { return (false); }
}
// 2003-05-17 5:57오후 배성한 추가 end

// 2003-05-19 5:57오후 양동호 추가 start
function getCurrentDate(usrDataFormat){
    var usrToDay = new Date();
    var retStr = "";
    var ktYear  = usrToDay.getYear();
    var ktMonth = usrToDay.getMonth();
    ktMonth = ktMonth+1;
    if ( ktMonth < 10 )
        ktMonth = "0" + ktMonth;
    var ktDay   = usrToDay.getDate();
    if ( ktDay < 10 )
        ktDay = "0" + ktDay;

    var ktHour   = usrToDay.getHours();
    if ( ktHour < 10 )
        ktHour = "0" + ktHour;
    var ktMinute = usrToDay.getMinutes();
    if ( ktMinute < 10 )
        ktMinute = "0" + ktMinute;
    var ktSecond = usrToDay.getSeconds();
    if ( ktSecond < 10 )
        ktSecond = "0" + ktSecond;

    usrDataFormat = "____" + usrDataFormat;

    if ( usrDataFormat.indexOf("yyyy") != -1){
        retStr += ktYear;
    }
    if ( usrDataFormat.indexOf("MM") != -1){
        retStr += ktMonth;
    }
    if ( usrDataFormat.indexOf("dd") != -1){
        retStr += ktDay;
    }

    if ( usrDataFormat.indexOf("HH") != -1){
        retStr += ktHour;
    }
    if ( usrDataFormat.indexOf("mm") != -1){
        retStr += ktMinute;
    }
    if ( usrDataFormat.indexOf("ss") != -1){
        retStr += ktSecond;
    }

    return retStr;

}

function day_before(s,subDay) {
   var nSubDay = Number(subDay);
   var sdate = new Date(Number(s.substring(0,4)),Number(s.substring(4,6))-1,Number(s.substring(6,8)));
   var odate = new Date(sdate.getTime() - (nSubDay * 86400000));
   return (odate.getMonth()+1) + '/' + odate.getDate() + '/' + odate.getYear();
}
// 2003-05-19 5:57오후 양동호 추가 end

// 2003-05-21 11:13오후 권보성 추가 start
// 받은메세지에서 v_s1값을 찾아서 모두 v_s2로 대치한다.
function StringReplaceAll(v_msg, v_s1, v_s2)
{

    while(v_msg.indexOf(v_s1) != -1)
    {
        v_msg = v_msg.replace(v_s1, v_s2);
    }
    return v_msg;

}

/**
* changeTelNumberSplitNew                                        <BR>
* 문자열로 입력된 전화번호를 받아 "-"와 " "을 제거 한 후국번,지역번호,번호로 분리해서 return한다.
* @param    numberValue   String 입력받은 문자열
*           gbn           1:국번 2:지역번호 3:번호
* ex) "005305427845"      ----> 12자리 ---> changeTelNumberSplit(numberValue, gbn)실행
*     "053 542 7845 ", 1  ----> "053"
*     "053-0542-7845", 2  ----> "542"
*     "053 542 7845 ", 3  ----> "7845"
* @return   Str           String 분리된 전화번호 출력
*/
function changeTelNumberSplitNew(numberValue, gbn) {
    var steTmp1 = "";
    var steTmp2 = "";

	if(numberValue == "" || numberValue == null)
	{
		return "";
    }

    numberValue = StringReplaceAll(StringReplaceAll(trim(numberValue), "-", ""), " ", "");

    if(numberValue.length == 12)
	{
		return changeTelNumberSplit(numberValue, gbn);
    }

    if(numberValue.length == 7 || numberValue.length == 8)
	{
		steTmp1 = "";
        steTmp2 = numberValue;
    }
    else
    {
        if(numberValue.substring(0, 2) == "02") {
            steTmp1 = numberValue.substring(0, 2);
            steTmp2 = numberValue.substring(2);
        }
        else {
            steTmp1 = numberValue.substring(0, 3);
            steTmp2 = numberValue.substring(3);
        }
    }

    switch(gbn)
    {
        case 1:
            return steTmp1;
            break;
        case 2:
            if(steTmp2.length == 7) {
                return steTmp2.substring(0, 3);
            }
            else {
                return steTmp2.substring(0, 4);
            }
            break;
        case 3:
            if(steTmp2.length == 7) {
                return steTmp2.substring(3);
            }
            else {
                return steTmp2.substring(4);
            }
            break;
    }

}
// 2003-05-21 11:13오후 권보성 추가 end


/**
* addMonth
* 날짜문자열(ex "20031213")과 가감될 달을 입력받아서 가감된 날짜를 리턴한다.
* @param    strDate			String 입력받은 년월일(또는 년월일시분초등등)
*           nAddMonth       가감할 달(-는 달을 빼는 것이다.)
* ex) addMonth("20010131",1)  -> 리턴 스트링은 "20010228"
* @return   Str           가감된 날짜 스트링
*/
function addMonth(strDate,nAddMonth){

		var szMonth = new Array(31,28,31,30,31,30, 31,31,30, 31,30,31);
		var strCurDate = strDate.toString();
		var strAddDate = "";
		var strRest ="";

		var nYear = 0;
		var nMonth = 0;
		var nDay =0;

		if (strCurDate.length == 0) {
			return strCurDate;
		}

		while(strCurDate.length < 8) {
			strCurDate += "0";
		}

		nYear	= parseInt(strCurDate.substring(0,4)   ,10);
		nMonth	= parseInt(strCurDate.substring(4, 6)  ,10);
		nDay    = parseInt(strCurDate.substring(6, 8)  ,10);


		if( strCurDate.length > 8) {
			strRest = strCurDate.substring(8,strCurDate.length);
		} else {
			strRest = "";
		}

		nMonth += nAddMonth;

		//월, 년도에 대한 증감 처리를 수행한다.
	    while (nMonth < 1) {
	        nYear -= 1;
	        nMonth += 12;
	    }

	    while (nMonth > 12 ) {
	        nYear += 1;
	        nMonth -= 12;
	    }

		szMonth[1] = 28;								//  2월 Reset
		if( (nYear%100) != 0 && (nYear%4) == 0 ) {
			szMonth[1] = 29;
		} else if((nYear%400) == 0) {
			szMonth[1] = 29;
		}

		if( szMonth[nMonth-1] <	nDay) {
			nDay = szMonth[nMonth-1];
		}

		var year  = nYear.toString();
		var month = nMonth.toString();
		var day   = nDay.toString();
		if(month.length==1){
			month = "0" + month;
		}
		if(day.length ==1){
			day = "0" + day;
		}

		return year + month + day + strRest;

	}
// 2003-05-22 20:11 오동원추가

    // 2003-06-11 3:30오후 배성한 추가
    // 현재값과 일치하는 radio rObj의 선택해준다.
    function setRadioValue(rObj, val)
    {
        var i;
        var rtn;
        try
        {
            for(i=0;i<rObj.length;i++)
                if (rObj[i].value == val) rObj[i].checked = true;
        }
        catch (e) { ; }
    }

    // 2003-06-13 7:27오후 배성한 추가
    // 받은 Object에 대해서 표시 비표시 한다.
    function ObjDisplay(vObj)
    {
        try
        {
            if (vObj.style.display == "none")
                vObj.style.display = "";
            else
                vObj.style.display = "none";
        } catch (e) { ; }
    }

    //2003-06-24 ko
    //사외유통망화면에서 저장시 kt직원 일경우 저장 불가
	function checkSaveAgentUser(usrGB,usrGUBUN)
	{
		var msg;
		if(usrGB=="6") {
			if(usrGUBUN !="0" &&usrGUBUN !="1") {
				msg	= "현재 사용자는 저장 권한이 없습니다!";
				openMsgDiag(msg);
				return false;
			}
		}
		return true;
	}


// 문자 숫자포맷 , (콤마) 추가
// 1000 -> 1,000
function commaSplit(srcNumber) {
var txtNumber = '' + srcNumber;
if (isNaN(txtNumber) || txtNumber == "") {
alert("숫자만 입력 하세요");
fieldName.select();
fieldName.focus();
}
else {
var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])');
var arrNumber = txtNumber.split('.');
arrNumber[0] += '.';
do {
arrNumber[0] = arrNumber[0].replace(rxSplit, '$1,$2');
} while (rxSplit.test(arrNumber[0]));
if (arrNumber.length > 1) {
return arrNumber.join('');
}
else {
return arrNumber[0].split('.')[0];
      }
   }
}


////////////////////////////
// ICIS 온라인이 아닐때 온라인을 체크한다.
function onLineCheck(){

    var form = document.mainForm;
    try
    {
        if( form.ACCEPT_ST.value != "" ){
            return;
        }
    } catch (e) { ; }

    var onOffFlag =form.ON_OFFFLAG.value;

    var vMAIL_CONFIRM_FLAG = form.MAIL_CONFIRM_FLAG.value;

    //if( onOffFlag == "" && vMAIL_CONFIRM_FLAG =="1" ){
    //    return;
    //}

    if( onOffFlag == "" ){
        return;
    }


    // 상품신청 메인의 최초위치로 가자...
	var rtnUrl = "";

	var onOfftimeMsg = form.ON_OFF_TIME.value;
    if( onOfftimeMsg != "" ) {
    	////////////
    	openMsgDiag(onOfftimeMsg);
    	//Msgbox.Display("POI150","W");
    	// 사외유통망이나 KT-PLAZA일때
    	if( form.USR_GB.value == "5" || form.USR_GB.value == "6" ){
    	    //rtnUrl = form.SUCC_URL.value + "?USR_GB=" + form.USR_GB.value;
    		rtnUrl= "/pa/jsp/pa000m.jsp?USR_GB=" + form.USR_GB.value;
    	    location.href= rtnUrl;
    	    return;
    	}else{
    //-----------------------------------------------------------------------------
    //  신 디자인 추가  2004/07/01 01:33:40 요청자 : 김미경,김지영
    //	    rtnUrl = form.SUCC_URL.value;
    //-----------------------------------------------------------------------------
    	    rtnUrl = form.SUCC_URL.value
    	            + "?mn="     + form.mn.value
    	            + "&scode="  + form.scode.value
    	            + "&sname="  + form.sname.value;
    //-----------------------------------------------------------------------------
            location.href= rtnUrl;
    	    return;
        }
    }

    //var form = document.mainForm;
    //try
    //{
    //    if( form.EXT_CORP_CD.value != "" ){ // 외부사이트 연동일 경우
    //        return;
    //    }
    //} catch (e) {
    //
    //}

    //try{
    //    // 2004-07-14 10:24 사어비일때 오전 메일인증여부 2004-07-14 10:24오전 오동원 추가
    //    var vMAIL_CONFIRM_FLAG = form.MAIL_CONFIRM_FLAG.value;
    //
    //    if( vMAIL_CONFIRM_FLAG != "1" ){
    //        if( form.USR_GB.value == "1" || form.USR_GB.value == "2" || form.USR_GB.value == "3" || form.USR_GB.value == "4" ){
    //            var emailMsg = "이메일 인증을 하셔야, 상품 신청/변경 하실 수 있습니다.";
    //            openMsgDiag(emailMsg);
    //            rtnUrl = form.SUCC_URL.value
    //	            + "?mn="     + form.mn.value
    //	            + "&scode="  + form.scode.value
    //	            + "&sname="  + form.sname.value;
    ////-----------------------------------------------------------------------------
    //            location.href= rtnUrl;
    //    	    return;
    //        }
    //    }
    //}catch(e){
    //
    //}
}

////////////////////////////
//
function closeExtCorp(){
    var form = document.mainForm;
    try
    {

        if( form.EXT_CORP_CD.value == "" ){
            //return true;
        }else {
            self.close();
            return false;
        }
    } catch (e) {
    //alert(e);
    }

    try
    {
        if( form.ZZ_NO_MENU_FLAG.value == "" ){
            return true;
        }else {
            self.close();
            return false;
        }
    } catch (e) {
    //alert(e);
    }
    return true;

}




function onLineCheckS(form){



    var onOffFlag =form.ON_OFFFLAG.value;
    if( onOffFlag == "" ){
        return;
    }

    // 상품신청 메인의 최초위치로 가자...
	var rtnUrl = "";

	var onOfftimeMsg = form.ON_OFF_TIME.value;

	////////////
	openMsgDiag(onOfftimeMsg);

	// 사외유통망이나 KT-PLAZA일때
	if( form.USR_GB.value == "5" || form.USR_GB.value == "6" ){
	    //rtnUrl = form.SUCC_URL.value + "?USR_GB=" + form.USR_GB.value;
		rtnUrl= "/pa/jsp/pa000m.jsp?USR_GB=" + form.USR_GB.value;
	}else{
//-----------------------------------------------------------------------------
//  신 디자인 추가  2004/07/01 01:33:40 요청자 : 김미경,김지영
//	    rtnUrl = form.SUCC_URL.value;
//-----------------------------------------------------------------------------
	    rtnUrl = form.SUCC_URL.value
	            + "?mn="     + form.mn.value
	            + "&scode="  + form.scode.value
	            + "&sname="  + form.sname.value
//-----------------------------------------------------------------------------
    }
    location.href= rtnUrl;
}

// 에러 ID로 화면 호출
// 이동범 2002.10.18 추가
function openMsgfmtDiag(sendMsg,types,btncnt){
    var sendMsgfmt  = sendMsg+ "&msgtype="+types+"&btncnt="+btncnt+"";
    var returnval= "";
	returnval    = window.showModalDialog ('/weblogic/CtosMsgDiag?msgname='+sendMsgfmt, '', 'dialogHeight:255px;dialogWidth:479px;status:no; help:no;');
	return  returnval;
}



// 한글 한글자를 2byte로 인식하여, IE든 Netscape든
// 제대로 byte길이를 구해 줍니다.

function getByteLength(s){
   var len = 0;
   if ( s == null ) return 0;
   for(var i=0;i<s.length;i++){
      var c = escape(s.charAt(i));
      if ( c.length == 1 ) len ++;
      else if ( c.indexOf("%u") != -1 ) len += 2;
      else if ( c.indexOf("%") != -1 ) len += c.length/3;
   }
   return len;
}

//custno type to custno type name
function getCustNoTypeName(s){
	if( s=='1'){
		return "주민번호";
	}else if(s=='2'){
		return "여권번호";
	}else if(s=='3'){
		return "법인번호";
	}else if(s=='4'){
		return "단체";
	}else if(s=='5'){
		return "외국인등록번호";
	}else if(s=='6'){
		return "고유번호";
	}else if(s=='8'){
		return "사업자번호";
	}else if(s=='9'){
		return "기타";
	}else{
		return "error";
	}
/*
1	주민번호
2	여권번호
3	법인번호
4	단체
5	외국인등록번호
6	고유번호
8	사업자번호
9	기타
*/

}


//cust no 의 format을 결정한다.
function getCustNoFormat(custNoType,unFormatCustNo){
	try{
		var formattedCustNo = unFormatCustNo;
		if( custNoType=="1" && unFormatCustNo.length==13 ){
                formattedCustNo = unFormatCustNo.substring(0,6) + "-" + unFormatCustNo.substring(6,13);
        }else if( custNoType=="2" ){
                formattedCustNo = unFormatCustNo;
        }else if( custNoType=="3" && unFormatCustNo.length==13 ){
                formattedCustNo = unFormatCustNo.substring(0,6) + "-" +unFormatCustNo.substring(6,13);
        }else if( custNoType=="4" ){
                formattedCustNo = unFormatCustNo;
        }else if( custNoType=="5" ){
                formattedCustNo = unFormatCustNo;
        }else if( custNoType=="6" && unFormatCustNo.length==10 ){
                formattedCustNo = unFormatCustNo.substring(0,3) + "-" + unFormatCustNo.substring(3,5) + "-" + unFormatCustNo.substring(5,10);
        }else if( custNoType=="9" ){
                formattedCustNo = unFormatCustNo;
        }else{
        	formattedCustNo = unFormatCustNo;
        }
        return 	formattedCustNo;
	}catch(e){;}
}



function checkSellerNespot(UsePrpFlag){

	// start 2003.09.16 유승하요구 요청번호:20030513 사업용일경우 위탁변성이 불가함
	if(UsePrpFlag.value == "3" ) {
		alert("사업용인 경우에는 위탁편성을 할 수없습니다");
		//m_objMsgBox.Display("MCSNI9453`CSNT682W");
		return false;
	}

    return true;

}

function paComm_SvcTypeCdChg(){

    var pForm = document.mainForm;
    pForm.flagLogin.value   = "2";
    pForm.method            = "POST";
    pForm.action            = "/pa/inc/seller_nespotIframe.jsp";
    pForm.target            = "inSellerForm";
    pForm.submit();

}


////////////////////////////
// ICIS 온라인이 아닐때 온라인을 체크한다.
function onLineCheckNS(){
    var form = document.mainForm;
    try
    {
        if( form.ACCEPT_ST.value != "" ){
            return;
        }
    } catch (e) { ; }

    var onOffFlag =form.NS_ONLINE.value;
    if( onOffFlag == "" ){
        return;
    }


    // 상품신청 메인의 최초위치로 가자...
	var rtnUrl = "";

	var onOfftimeMsg = form.NS_ONLINE.value;

	////////////
	openMsgDiag(onOfftimeMsg);
	//Msgbox.Display("POI150","W");
	// 사외유통망이나 KT-PLAZA일때
	if( form.USR_GB.value == "5" || form.USR_GB.value == "6" ){
	    //rtnUrl = form.SUCC_URL.value + "?USR_GB=" + form.USR_GB.value;
		rtnUrl= "/pa/jsp/pa000m.jsp?USR_GB=" + form.USR_GB.value;

	}else{
//-----------------------------------------------------------------------------
//  신 디자인 추가  2004/07/01 01:33:40 요청자 : 김미경,김지영
//	    rtnUrl = form.SUCC_URL.value;
//-----------------------------------------------------------------------------
	    rtnUrl = form.SUCC_URL.value
	            + "?mn="     + form.mn.value
	            + "&scode="  + form.scode.value
	            + "&sname="  + form.sname.value
//-----------------------------------------------------------------------------
    }
    location.href= rtnUrl;
}


////////////////////////////
// ICIS 온라인이 아닐때 온라인을 체크한다.
// form name이 틀릴경우
function onLineCheckNSS(form){
    try
    {
        if( form.ACCEPT_ST.value != "" ){
            return;
        }
    } catch (e) { ; }

    var onOffFlag =form.NS_ONLINE.value;
    if( onOffFlag == "" ){
        return;
    }


    // 상품신청 메인의 최초위치로 가자...
	var rtnUrl = "";

	var onOfftimeMsg = form.NS_ONLINE.value;

	////////////
	openMsgDiag(onOfftimeMsg);
	//Msgbox.Display("POI150","W");
	// 사외유통망이나 KT-PLAZA일때
	if( form.USR_GB.value == "5" || form.USR_GB.value == "6" ){
	    //rtnUrl = form.SUCC_URL.value + "?USR_GB=" + form.USR_GB.value;
		rtnUrl= "/pa/jsp/pa000m.jsp?USR_GB=" + form.USR_GB.value;
	}else{
//-----------------------------------------------------------------------------
//  신 디자인 추가  2004/07/01 01:33:40 요청자 : 김미경,김지영
//	    rtnUrl = form.SUCC_URL.value;
//-----------------------------------------------------------------------------
	    rtnUrl = form.SUCC_URL.value
	            + "?mn="     + form.mn.value
	            + "&scode="  + form.scode.value
	            + "&sname="  + form.sname.value
//-----------------------------------------------------------------------------
    }
    location.href= rtnUrl;
}

    ////////////////////////////
    // 개인정보 수집동의 메시지
    function custInfoUse(cust_id,cust_no_type,rs_cd ,methodname){
        mainForm.ASSENT_CUST_ID.value = cust_id;
        mainForm.ASSENT_RS_CD.value = rs_cd;
        mainForm.ASSENT_METHOD_NAME.value = methodname;
        mainForm.ASSENT_SAVE_FLAG.value = "X";


        if(  cust_no_type != "1" ){

            try{
                //callOrdSaveProc();
                eval( methodname + "();");
            }catch(e){

            }
            return;
        }
        mainForm.flag.value     = "flagASSENTSearch";
        mainForm.method         = "POST";
        mainForm.action         = "/weblogic/pa904c_s10";
    	mainForm.target			= "ASSENTFRAME";	//"inFrm"
    	mainForm.submit();
    }

    ////////////
    // 상품 저장시 프로그레스바를 보여준다.
    function showProgress(){
        try{
            loadingBar.style.display = '';
        }catch(e){

        }
    }

    ////////////
    // 상품 저장시 프로그레스바를 숨긴다.
    function hideProgress(){

        try{
            parent.loadingBar.style.display = 'none';
        }catch(e){
	        try{
	            loadingBar.style.display = 'none';
	        }catch(e){
	        	;
	        }
        }
	        try{
	            loadingBar.style.display = 'none';
	        }catch(e){
	        	;
	        }
    }

//-----------------------------------------------------------------------------
//  신 디자인 추가  2004/06/16 09:07:49 요청자 : 김미경,김지영
//-----------------------------------------------------------------------------
	function fn_sert(value)
	{
//	    if ( value == "1" ){
//	        alert("도움말 오픈");
//	        return true;
//	    } else if ( value == "2" ) {
//            return "공인인증 후 신청하시겠습니까? ";
//	    }
	}
//-----------------------------------------------------------------------------


//------------------------------------------------------------------------------
// 주소받아서 * 로 바꾸어주는거
//------------------------------------------------------------------------------
	/**
	 * 주소 보안을 위해서 바꾼다. INPUT "서울시 마포구 무슨동 무슨 아파트 112"
	 * OUTPUT "서울시 마포구 *** *** ** *** ***"로 바꾸어준다. (구까지만 바꾸어준다)
	 */
	function  getAuthAddressTxt(fullAddressTxt ,usr_gb){
        try{
        if( fullAddressTxt == "" || fullAddressTxt == "" ){
            return "";
        }
        if( !( usr_gb == "0" || usr_gb =="1" ||
               usr_gb == "2" || usr_gb == "3" || usr_gb == "4") ) {
            return fullAddressTxt;
        }

		var st = fullAddressTxt.split(" ");

		if(st.length < 3) return fullAddressTxt;

		var strEdited ="";
        var nTh = 0 ;
        for ( i=0; i < st.length; i++ ) {
        	var splist	=	st[i];
            if( nTh > 1 ){
                strEdited = strEdited + fillStarChr(splist) + " ";
            }else{
                strEdited = strEdited + splist + " ";
            }

        	nTh = nTh+1;
        }
        return strEdited;
		}catch(e){
            return fullAddressTxt;
		}
    }


	function fillStarChr(splist) {
		var chk		= true;
		var rsplist = "";

		for (ii=0; ii <= splist.length-1; ii++) {
			rsplist	= rsplist+"*";
		}
		return rsplist;
	}

//------------------------------------------------------------------------------

///////////////////////////////////////////
// ★ 공통 Script 끝... ★ //
///////////////////////////////////////////

-->
    // 비밀번호의 유효성을 체크한다.
    function IsFitPasswd()
    {
        var frm = document.mainForm;
        var strSaCd = frm.SA_CD.value;
        var strUsrGb = frm.USR_GB.value;
        var strUserOrdType = frm.USER_ORD_TYPE_CD.value;

        // 신규인 경우만 체크한다.
        if (strUserOrdType == C_ORD_TYPE_NEW)
        {
            if (paComm_IsFitPasswd(frm.SVC_NO, frm.PASSWD) == false) {
                return false;
            }

            var strPw  = frm.PASSWD.value;
            var strPw2 = frm.PASSWD2.value;
            if ( strPw2 == "" )
            {
                alert("비밀번호를 입력하세요!");
                frm.PASSWD2.focus();
                frm.PASSWD2.select();
                return false;
            }
            if ( isString(strPw2, '') == false ) {
                alert("비밀번호는 영숫자만 가능합니다!");
                frm.PASSWD2.focus();
                frm.PASSWD2.select();
                return false;
            }

            if ( strPw2.length < 6  ) {
                alert("비밀번호를 6~8자로 입력하세요!");
                frm.PASSWD2.focus();
                frm.PASSWD2.select();
                return false;
            }

            if (strPw != strPw2) {
                alert("비밀번호와 비밀번호확인이 서로 다릅니다. 확인후 입력하세요!");
                frm.PASSWD.focus();
                frm.PASSWD.select();
                return false;
            }
        }
        return true;
    }
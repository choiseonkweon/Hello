<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body class="fixed-navigation fixed-header fixed-ribbon">
	<!-- Left panel : Navigation area -->
	<!-- Note: This width of the aside area can be adjusted through LESS variables -->
	<aside id="left-panel">

		<!-- User info -->
		<div class="login-info">
		</div>
		<!-- end user info -->

		<!-- NAVIGATION : This navigation is also responsive-->
		<nav>
			<!-- 
			NOTE: Notice the gaps after each icon usage <i></i>..
			Please note that these links work a bit different than
			traditional href="" links. See documentation for details.
			-->

			<ul class="">
				<li class="">
					<a href="#" title="회원 관리"><i class="fa fa-lg fa-fw fa-user"></i> <span class="menu-item-parent">회원 관리</span></a>
					<ul>
						<li class="">
							<a href="/db/member/memberList.do" title="회원 관리"><span class="menu-item-parent">회원 관리</span></a>
						</li>
						<li class="">
							<a href="/db/member/authList.do" title="회원 관리"><span class="menu-item-parent">관리자 관리</span></a>
						</li>
					</ul>	
				</li>
				<li class="">
					<a href="#" title="기업/바이어/전문가정보 관리" style="font-size: 12px;"><i class="fa fa-lg fa-fw fa-cube"></i> <span class="menu-item-parent">기업/바이어/전문가정보 관리</span></a>
					<ul>
						<li class="">
							<a href="/db/enterprise/enterpriseInformationManagementList.do" title="기업/바이어/전문가정보 관리"><span class="menu-item-parent">기업정보 관리</span></a>
						</li>
						<li class="">
							<a href="/db/buyer/buyerInformationManagementList.do" title="기업/바이어/전문가정보 관리"><span class="menu-item-parent">바이어정보 관리</span></a>
						</li>
						<li>
							<a href="#" title="기업/바이어/전문가정보 관리"><span class="menu-item-parent">전문가 관리</span></a>
							<ul>
								<li class="">
									<a href="/db/expert/expertInformationManagementList.do" title="기업/바이어/전문가정보 관리"><span class="menu-item-parent">전문가정보 관리</span></a>
								</li>
								<li class="">	
									<a href="/db/evalu/evaluInformationManagementList.do" title="기업/바이어/전문가정보 관리"><span class="menu-item-parent">평가위원 추출</span></a>
								</li>
							</ul>
						</li>

					</ul>	
				</li>
				<li class="">
					<a href="#" title="사업 관리"><i class="fa fa-lg fa-fw fa-inbox"></i> <span class="menu-item-parent">사업 관리</span></a>
					<ul>
						<li class="">
							<a href="/db/business/businessManagementList.do" title="사업 관리"><span class="menu-item-parent">사업 관리</span></a>
						</li>
						<li class="">
                            <a href="#" title="사업운영 실적관리"><span class="menu-item-parent">사업운영 실적관리</span></a>                        
							<ul>
								<li>
									<a href="/db/business/businessSupportBenefitList.do" title="기업지원"><span class="menu-item-parent">기업지원</span></a>
								</li>
								<li>
									<a href="/db/business/businessInfraResourFaciUseResultList.do" title="인프라지원"><span class="menu-item-parent">인프라지원</span></a>
								</li>								
							</ul>
						</li>
					</ul>	
				</li>
				<li class="">
					<a href="#" title="시설 및 자원 관리"><i class="fa fa-lg fa-fw fa-table"></i> <span class="menu-item-parent">시설 및 자원 관리</span></a>
					<ul>
						<li class="">
							<a href="/db/facility/facilityRegistrationManagementList.do" title="시설 및 자원 관리"><span class="menu-item-parent">시설 등록 관리</span></a>
						</li>
						<li class="">
							<a href="/db/facility/facilityApplicationManagementList.do" title="시설 및 자원 관리"><span class="menu-item-parent">시설 신청 관리</span></a>
						</li>
						<li class="">
							<a href="/db/resource/resourceRegistrationManagementList.do" title="시설 및 자원 관리"><span class="menu-item-parent">자원 등록 관리</span></a>
						</li>
						<li class="">
							<a href="/db/resource/resourceApplicationManagementList.do" title="시설 및 자원 관리"><span class="menu-item-parent">자원 신청 관리</span></a>
						</li>
					</ul>	
				</li>
				<li class="">
					<a href="#" title="원스톱지원실 이용 관리"><i class="fa fa-lg fa-fw fa-pencil-square-o"></i> <span class="menu-item-parent">원스톱지원실 이용 관리</span></a>
					<ul>
						<!-- <li class="">
							<a href="/db/oneStop/adviceConsultingStatusManagementList.do" title="원스톱지원실 이용 관리"><span class="menu-item-parent">자문컨설팅 현황 관리</span></a>
						</li> -->
						<li class="">
							<a href="/db/oneStop/adviceOnlineStatusManagementList.do" title="원스톱지원실 이용 관리"><span class="menu-item-parent">온라인상담 현황 관리</span></a>
						</li>
					</ul>	
				</li>
				<li class="">
					<a href="#" title="사이트 관리"><i class="fa fa-lg fa-fw fa-desktop"></i> <span class="menu-item-parent">사이트 관리</span></a>
					<ul>
						<li class="">
							<a href="/db/site/noticeList.do" title="사이트 관리"><span class="menu-item-parent">공지사항</span></a>
						</li>
						<li class="">
							<a href="/db/site/faqList.do" title="사이트 관리"><span class="menu-item-parent">FAQ</span></a>
						</li>
						<li class="">
							<a href="/db/site/popupList.do" title="사이트 관리"><span class="menu-item-parent">팝업 관리</span></a>
						</li>
						<li class="">
							<a href="#" title="사이트 관리"><span class="menu-item-parent">통계</span></a>
						</li>
						<li class="">
							<a href="/db/site/accessLogList.do" title="사이트 관리"><span class="menu-item-parent">접속로그</span></a>
						</li>
					</ul>	
				</li>
				<li class="">
					<a href="#" title="과제목록"><i class="fa fa-lg fa-fw fa-pencil-square-o"></i> <span class="menu-item-parent">캘린더 예약</span></a>
					<ul>
						<li class="">
							<a href="/db//schedule/scheduleMain.do" title="캘린더 예약"><span class="menu-item-parent">캘린더 예약</span></a>
						</li>
					</ul>	
				</li>
				
				
			</ul>
		</nav>
		
		<span class="minifyme" data-action="minifyMenu"> 
			<i class="fa fa-arrow-circle-left hit"></i> 
		</span>

	</aside>
	<!-- END NAVIGATION -->
	<script type="text/javascript">
	    $(document).ready(function() {
	        /* DO NOT REMOVE : GLOBAL FUNCTIONS! */
	         pageSetUp();
	    })
	</script>
	
	<!-- Your GOOGLE ANALYTICS CODE Below -->
	<script type="text/javascript">
	    var _gaq = _gaq || [];
	        _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
	        _gaq.push(['_trackPageview']);
	    
	    $(function() {
	        var ga = document.createElement('script');
	        ga.type = 'text/javascript';
	        ga.async = true;
	        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	        var s = document.getElementsByTagName('script')[0];
	        s.parentNode.insertBefore(ga, s);
	    });
	</script>
</body>
</html>
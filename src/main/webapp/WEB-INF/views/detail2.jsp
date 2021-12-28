<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2ef783c8be226165a93db942b27adf0"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<link href="/css/campdetail.css" rel="stylesheet">
<!-- AOS 플러그인 -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>

<Script>
	$(function(){
		
		//찜하기
		$(".likeicon").on("click", function(){

			var like = $(".likeicon").attr('id');
			var ci_seq = "${i.ci_seq}";
			console.log(like);
			console.log(ci_seq);
			
			if(like == "dislike"){	
				
				alert("찜하기 목록에 추가합니다. 목록은 마이페이지에서 확인 가능합니다.");
				$(".likeicon").attr("src", "/img/detailimage/like/like.png");
				$(".likeicon").attr('id','like');
				
				$.ajax({
		               url: "wishinsert",
		               data: {contents:"dislike", ci_seq:"ci_seq"},
		               method:"post",
		               dataType:"application/json"
		            });
				
			}else if(like == "like"){
				alert("찜하기를 취소합니다.");
				$(".likeicon").attr("src", "/img/detailimage/like/dislike.png");
				$(".likeicon").attr('id','dislike');
			}

		});
		
		//슬라이드
		 $(document).ready(function(
				){ $('.slick-sample').slick({ 
					dots: true 
					});
				});
		
		//슬라이드 반응형
		$('.responsive').slick({ 
			slidesToShow: 4, 
			slidesToScroll: 4, 
			responsive: [ 
				{ breakpoint: 600, // 화면의 넓이가 600px 이상일 때 
					settings: { 
						slidesToShow: 3, 
						slidesToScroll: 3 
						}}, 
						{ breakpoint: 320, // 화면의 넓이가 320px 이상일 때 
							settings: { 
								slidesToShow: 1, 
								slidesToScroll: 1 
								} 
						} 
						] 
		});

			
	})
	
</Script>

<body>
<div id=header>
     <div id="headerimg"></div>  
</div> 
<div class=container>
	<div class=box>
		<div id=onetop class=boxcon>
		<div id=onebox>
			<c:forEach var="i" items="${list}">
			<!-- 캠핑장 이름 -->
			<div id=namebox>
				<h1>${i.facltNm}</h1>
			</div>
			</c:forEach>
			<!-- 슬라이드 -->
			<div id=slidebox>
				<div class="slick-sample"> 
					<div><img src="/img/campinglist/camping01.jpg"></div> 
					<div><img src="/img/campinglist/camping02.jpg"></div>
					<div><img src="/img/campinglist/camping03.jpg"></div> 
					<div><img src="/img/campinglist/camping04.jpg"></div> 
					<div><img src="/img/campinglist/camping05.jpg"></div>  
				</div>
			</div>
			
			<c:forEach var="i" items="${list}">
			<!-- 정보 -->
			<div id=infobox>
				<div id=tablebox>
					<table class="infotable1">
						<tr>
							<th> 주소</th>
							<td>전라남도 목포시 어쩌고</td>
						</tr>
						<tr>
							<th> 캠핑장 환경</th>
							<td>숲</td>
						</tr>
						<tr>
							<th> 캠핑장 유형</th>
							<td>글램핑</td>
						</tr>
						<tr>
							<th> 운영기간</th>
							<td>봄, 여름, 가을, 겨울</td>
						</tr>
						<tr>
							<th> 운영일</th>
							<td>평일</td>
						</tr>
						<tr>
							<th> 홈페이지</th>
							<td>홈페이지 가기</td>
						</tr>
						<tr>
							<th> 예약방법</th>
							<td>온라인, 전화</td>
						</tr>
						<tr>
							<th> 주변 이용 가능 시설</th>
							<td>바다 낚시</td>
						</tr>
					</table>
				</div>
				</c:forEach>
				<div id=btnbox>
					
					<!-- 찜하기 -->
					<div id=wishbox>
							<h4>찜하기</h4><img src="/img/detailimage/like/dislike.png" id="dislike" class="likeicon">
					</div>
					
					<!-- 예약 버튼 -->	
					<div id=reservebox> 
						<a href="#" class="myButton" id="reservebtn"><h4>예약하러 가기</h4></a>
					</div>	
	    		</div>
			</div>
		</div>	
		</div><!-- onetop --> 
		
	
		<div id=twotop  class=boxcon>
			<div id=camptabbox>
				<ul id=camptab>
					<li id="camp_guide">안내</li>
					<li id="camp_map">위치</li>
					<li id="camp_review">후기</li>
				</ul>
			</div>
		</div>
		
		<div id=threetop  class=boxcon>
			<div id=camp_guide_box class="camp_info_box">
				<div id="introbox">	
					<div id="lineintro">
						"발 아래로 내려다보는 풍경이 일품인 어쩌구 캠핑장"
					</div>	
					<div id="themaEnvrnClbox">
						<div id="themaEnvrnClName"> keyword! </div>
						<div id="themaEnvrnCl">      봄꽃여행, 여름물놀이, 가을단풍명소 </div>
					</div>
					<div id="intro">
						세라핌캠핑장은 경기도 가평군 설악면에 자리했다. 서울양양고속도로 설악IC에서 청평, 설악 방면으로 15분 정도 달리면 닿는다. 캠핑장 앞으로는 계곡, 뒤로는 산이 있어 자연 그대로를 만끽할 수 있다. 이곳은 글램핑 31면을 마련했다. 내부에는 침대를 비롯해 냉난방기, 냉장고, 취사도구 등을 갖췄다. 화장실과 샤워실은 외부에 있지만 어느 사이트에 머물든 접근하기 어렵지 않은 거리에 있다. 전기밥솥과 전자레인지는 개수대가 있는 공간에 비치했다. 어린이를 위한 트램펄린과 더불어 추억의 오락실, 탁구장, 족구장 등의 부대시설도 있다. 관리소에서는 캠핑의 재미를 더해줄 거짓말 탐지기와 룰렛 게임기, 탁구와 배드민턴 장비를 대여해준다. 주변 관광지로는 국립산음자연휴양림, 용문산전투전적비가 있다. 아난티 클럽의 더 레스토랑, 솔모랑해장국 등 음식점도 많다.
					</div>
				</div>
			<div id="etcbox">
				<div id="sbrsClbox">
					<div id="sbrcClName"> 캠핑장 시설 정보 </div>
					<div id="sbrcClCon">
						전기 와이파이 냉장고 주차장
					</div>	
				</div>
				<div id="Cobox">
					<div id="Coname"> 기타 주요 시설 </div>
					<div id="Cocon">일반 야영장(60) 글램핑(10) 어쩌고(0)</div>
				</div>
				<div id="sbrcEtcbox">
					<div id="sbrcEtcName">부대시설</div>
					<div id="sbrcEtcCon"> 슟 가능 </div>
				</div>
				<div id="brazierClbox">
					<div id="brazierClName">화로</div>
					<div id="brazierClCon">가능</div>
				</div>
				<div id="animalCmgClbox">
					<div id="animalCmgClName">반려동물</div>
					<div id="animalCmgClCon">가능</div>
				</div>
			</div>
			<div id=camp_map_box class="camp_info_box"></div>
			<div id=camp_review_box class="camp_info_box"></div>
		</div>
		
		</div>
	</div> <!-- box --> 
</div> <!-- 전체 -->
</body>
</html>
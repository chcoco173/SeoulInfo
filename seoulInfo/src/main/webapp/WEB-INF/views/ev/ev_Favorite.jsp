<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>전기차 - 즐겨찾기</title>
<!-- Bootstrap core CSS -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- ev css -->
<link href="/css/ev/evFavorite.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="search_favorite">
        <p style="text-align: center">
            <b> 즐겨찾기 </b>
        </p>
        <hr>

		
		<%	if(session.getAttribute("user")!=null){ %>
        <div class="afterLogin" style="display: none;">
            <dl id="favoriteList">
                <dd>
                    <table class="favorite-list">
                        <tr>
                            <td rowspan=2><img src="/images/ev/goverment-logo.png" /></td>
                            <td colspan=2>충전소 이름1</td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 12px">사용가능</span></td>
                            <td><span style="font-size: 12px">충전기 타입</span></td>
                        </tr>
                    </table>
                    <br>
                </dd>
                <dd>
                    <table class="favorite-list">
                        <tr>
                            <td rowspan=2><img src="/images/ev/goverment-logo.png" /></td>
                            <td colspan=2>충전소 이름1</td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 12px">사용가능</span></td>
                            <td><span style="font-size: 12px">충전기 타입</span></td>
                        </tr>
                    </table>
                    <br>
                </dd>
                <dd>
                    <table class="favorite-list">
                        <tr>
                            <td rowspan=2><img src="/images/ev/goverment-logo.png" /></td>
                            <td colspan=2>충전소 이름8</td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 12px">사용가능</span></td>
                            <td><span style="font-size: 12px">충전기 타입</span></td>
                        </tr>
                    </table>
                    <br>
                </dd>
                <dd>
                    <table class="favorite-list">
                        <tr>
                            <td rowspan=2><img src="/images/ev/goverment-logo.png" /></td>
                            <td colspan=2>충전소 이름4</td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 12px">사용가능</span></td>
                            <td><span style="font-size: 12px">충전기 타입</span></td>
                        </tr>
                    </table>
                    <br>
                </dd>
                <dd>
                    <table class="favorite-list">
                        <tr>
                            <td rowspan=2><img src="/images/ev/goverment-logo.png" /></td>
                            <td colspan=2>충전소 이름5</td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 12px">사용가능</span></td>
                            <td><span style="font-size: 12px">충전기 타입</span></td>
                        </tr>
                    </table>
                    <br>
                </dd>
                <dd>
                    <table class="favorite-list">
                        <tr>
                            <td rowspan=2><img src="/images/ev/goverment-logo.png" /></td>
                            <td colspan=2>충전소 이름6</td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 12px">사용가능</span></td>
                            <td><span style="font-size: 12px">충전기 타입</span></td>
                        </tr>
                    </table>
                    <br>
                </dd>
                <dd>
                    <table class="favorite-list">
                        <tr>
                            <td rowspan=2><img src="/images/ev/goverment-logo.png" /></td>
                            <td colspan=2>충전소 이름7</td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 12px">사용가능</span></td>
                            <td><span style="font-size: 12px">충전기 타입</span></td>
                        </tr>
                    </table>
                    <br>
                </dd>
                <dd>
                    <table class="favorite-list">
                        <tr>
                            <td rowspan=2><img src="/images/ev/goverment-logo.png" /></td>
                            <td colspan=2>충전소 이름8</td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 12px">사용가능</span></td>
                            <td><span style="font-size: 12px">충전기 타입</span></td>
                        </tr>
                    </table>
                    <br>
                </dd>
                <dd>
                    <table class="favorite-list">
                        <tr>
                            <td rowspan=2><img src="/images/ev/goverment-logo.png" /></td>
                            <td colspan=2>충전소 이름9</td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 12px">사용가능</span></td>
                            <td><span style="font-size: 12px">충전기 타입</span></td>
                        </tr>
                    </table>
                    <br>
                </dd>
                <!-- 이하 생략 -->
            </dl>
            <div class="favorite-list-pagination" style="text-align: center; margin-top: 20px;">
                <button class="btn btn-secondary" id="favorite-prevPage" disabled>이전</button>
                <span id="favorite-pageInfo">1 / 1</span>
                <button class="btn btn-secondary" id="favorite-nextPage">다음</button>
                <button class="btn btn-dark btn-close"><b> X </b></button>
            </div>
        </div>
		<% } else { %>
		<div class="beforeLogin" style="text-align: center">
		    <p>로그인 후 서비스 이용 가능</p>
		    <a href="/member/login"><input type="button" value="로그인" class="login btn btn-primary"></a>
			<button class="btn btn-dark btn-close"><b> X </b></button>
		</div>
		<% } %>
    </div>

    <!-- jQuery 및 Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function() {
            var favoriteItemsPerPage = 3; // 페이지당 보여줄 항목 수
            var favoriteCurrentPage = 1; // 현재 페이지
            var $favoriteItems = $('#favoriteList dd'); // 즐겨찾기 항목들
            var favoriteTotalItems = $favoriteItems.length; // 전체 항목 수
            var favoriteTotalPages = Math.ceil(favoriteTotalItems / favoriteItemsPerPage); // 전체 페이지 수

            function showFavoritePage(page) {
                $favoriteItems.hide();
                $favoriteItems.slice((page - 1) * favoriteItemsPerPage, page * favoriteItemsPerPage).show();
                $('#favorite-pageInfo').text(page + ' / ' + favoriteTotalPages);
                $('#favorite-prevPage').prop('disabled', page === 1);
                $('#favorite-nextPage').prop('disabled', page === favoriteTotalPages);
            }

            $('#favorite-prevPage').click(function() {
                if (favoriteCurrentPage > 1) {
                    favoriteCurrentPage--;
                    showFavoritePage(favoriteCurrentPage);
                }
            });

            $('#favorite-nextPage').click(function() {
                if (favoriteCurrentPage < favoriteTotalPages) {
                    favoriteCurrentPage++;
                    showFavoritePage(favoriteCurrentPage);
                }
            });

            // 초기 페이지 로드
            showFavoritePage(favoriteCurrentPage);
        });
    </script>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>전기차 - 즐겨찾기</title>
    <!-- Bootstrap core CSS -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- ev css -->
	<link href="/css/evFavorite.css" rel="stylesheet" type="text/css">
</head>
<body>
    
<div class="search_favorite">
    <p style=" text-align: center"><b> 즐겨찾기 </b></p><hr>
    <div class="beforeLogin" style="text-align:center">
        <p> serviced after login </p>
        <input type="button" value="login" class="login btn btn-primary">
    </div>
    
    <div class="afterLogin" style="display:none; padding-left:18%">
        <div class="result-list" >
            <dl id="favoriteList">
                <dd>1</dd>
                <dd>2</dd>
                <dd>3</dd>
                <dd>4</dd>
                <dd>5</dd>
                <dd>6</dd>
                <dd>7</dd>
                <dd>8</dd>
                <dd>9</dd>
                <dd>0</dd>
            </dl>
        </div>
        <div class="pagination" style="text-align:center; margin-top:20px;">
            <button class="btn btn-secondary" id="prevPage" disabled>이전</button>
            <span id="pageInfo">1 / 1</span>
            <button class="btn btn-secondary" id="nextPage">다음</button>
        </div>
    </div>
	<button class="btn btn-secondary btn-close" ><b> X </b></button>
</div>

<!-- jQuery 및 Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>

<script>
$(document).ready(function() {
    var itemsPerPage = 4;
    var currentPage = 1;
    var $favoriteList = $('#favoriteList dd');
    var totalItems = $favoriteList.length;
    var totalPages = Math.ceil(totalItems / itemsPerPage);

    function showPage(page) {
        $favoriteList.hide();
        $favoriteList.slice((page - 1) * itemsPerPage, page * itemsPerPage).show();
        $('#pageInfo').text(page + ' / ' + totalPages);
        $('#prevPage').prop('disabled', page === 1);
        $('#nextPage').prop('disabled', page === totalPages);
    }

    $('#prevPage').click(function() {
        if (currentPage > 1) {
            currentPage--;
            showPage(currentPage);
        }
    });

    $('#nextPage').click(function() {
        if (currentPage < totalPages) {
            currentPage++;
            showPage(currentPage);
        }
    });

    // 초기 페이지 로드
    showPage(currentPage);
});
</script>

</body>
</html>

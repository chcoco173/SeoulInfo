<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>판매자 신고</title>
</head>
<body>
    <h2>판매자 신고</h2>
	<div>
	    <p>신고할 판매자 id: ${selectedUserId}</p>
	</div>
    <form action="sale-report" method="post">
        <div>
            <label for="report_reason">신고 사유: </label>
            <textarea id="report_reason" name="report_reason" required></textarea>
        </div>
        <div>
            <label for="report_cate">신고 분류: </label>
            <select id="report_cate" name="report_cate" required>
                <option value="중고거래">중고거래</option>
                <option value="뉴스댓글">뉴스댓글</option>
                <option value="축제댓글">축제댓글</option>
            </select>
        </div>
        <div>
            <button type="submit">신고 제출</button>
        </div>
    </form>
</body>
</html>

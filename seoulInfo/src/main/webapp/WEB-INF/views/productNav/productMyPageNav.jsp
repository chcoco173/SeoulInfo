<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product MyPage Navigation</title>
    <style>
        .navbar-style-guide {
            z-index: 999;
            position: relative;
            margin-top: 10px;
        }
        .style-guide-menu {
            display: flex;
            justify-content: space-between;
        }
        .style-guide-menu a {
            margin: 0 10px;
        }
        .style-guide-menu-button {
            display: none; /* Hide the menu button since it's not needed */
        }
    </style>
</head>
<body>
    <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar-style-guide w-nav">
        <div class="container-large">
            <div class="align-horizontal-center">
                <nav role="navigation" class="style-guide-menu w-nav-menu">
                    <a href="productMypage" class="style-guide-nav-link w-nav-link">마이페이지</a>
                    <a href="myProduct" class="style-guide-nav-link w-nav-link">상품목록</a>
                    <a href="productReview" class="style-guide-nav-link w-nav-link">구매내역</a>
                    <a href="productInsert" class="style-guide-nav-link w-nav-link">상품등록</a>
                    <a href="wishlist" class="style-guide-nav-link w-nav-link">찜</a>
                </nav>
                <div class="style-guide-menu-button w-nav-button">
                    <img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall">
                </div>
            </div>
        </div>
    </div>
</body>
</html>

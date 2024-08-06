$(function() {
    // 유효성 검사
    const $satisfactionRadios = $('input[name="satisfaction"]');
    const $mannerRadios = $('input[name="manner"]');
    const $commitmentRadios = $('input[name="commitment"]');
    const $ratingStars = $('.rating__star'); // 별점 요소 선택
    const $submitButton = $('.reviewReg'); // 'reviewReg' 클래스를 가진 버튼을 선택

    function checkFormValidity() {
        const isSatisfactionChecked = $satisfactionRadios.is(':checked');
        const isMannerChecked = $mannerRadios.is(':checked');
        const isCommitmentChecked = $commitmentRadios.is(':checked');
        const isRatingSelected = $ratingStars.filter('.fas').length > 0; // 선택된 별점이 있는지 확인

        // Enable button only if all radio buttons are selected and rating is given
        $submitButton.prop('disabled', !(isSatisfactionChecked && isMannerChecked && isCommitmentChecked && isRatingSelected));
    }

    // Attach event listeners to radio buttons
    $satisfactionRadios.on('change', checkFormValidity);
    $mannerRadios.on('change', checkFormValidity);
    $commitmentRadios.on('change', checkFormValidity);

    // 별점 클릭 이벤트 핸들러
    $ratingStars.on('click', function() {
        const value = $(this).data('value');
        // Update the state of all stars based on the clicked star
        $ratingStars.each(function() {
            if ($(this).data('value') <= value) {
                $(this).addClass('fas').removeClass('far');
            } else {
                $(this).addClass('far').removeClass('fas');
            }
        });
        checkFormValidity(); // 별점 선택 후 유효성 검사 함수 호출
    });

    checkFormValidity(); // 페이지 로드 시 버튼의 초기 상태 확인

    // 후기 남기기 버튼 클릭 시 폼 띄어주기
    $(".review").click(function() {
        // 폼 상태와 버튼 상태를 초기화
        resetForm(); 

        var buy_id = $(this).closest('.product-card').find('.buy_id').val();
        var member_id = $(this).closest('.product-card').find('.member_id').val();

        // member_id와 sale_name을 리뷰 폼에 주입
        $("#reviewForm h2").text(member_id + "님에 대한 리뷰 작성");
        $("#reviewForm #reviewBuyId").val(buy_id);

        // 리뷰 폼 보이기
        $('#reviewForm').removeClass('hidden');
    });

    // 입력 버튼 클릭 시 (동적)
    $(document).on("click", ".reviewReg", function() {
        var formData = {
            buy_id: $("#reviewBuyId").val(),
            product_review: $('input[name=satisfaction]:checked').val(),
            chat_review: $('input[name=manner]:checked').val(),
            commitment_review: $('input[name=commitment]:checked').val(),
            etc_review: $('#etc').val(),
            review_star: $('.rating__star.fas').length
        };

        $.ajax({
            url: "/product/productReviewInsert",
            type: "POST",
            data: formData,
            success: function(result) {
                if (result === '1') {
                    alert('후기 등록 성공');
                    resetForm(); // 폼 초기화
                    location.href = "/product/productReview"; // 후기를 다시 불러오기
                }
            },
            error: function(err) {
                console.log('reviewReg error ' + err);
            }
        });
    });

    // 리뷰를 보여주기 (동적)
    $(document).on("click", ".reviewShow", function() {
		resetForm();
        var buy_id = $(this).closest('.product-card').find('.buy_id').val();
        var member_id = $(this).closest('.product-card').find('.member_id').val(); // 판매자

        $.ajax({
            url: "/product/productReviewIdSelect",
            type: "POST",
            data: {
                "buy_id": buy_id
            },
            success: function(response) {
                if (response.status === 'success') {
                    // 리뷰 데이터가 존재하면 폼을 업데이트
                    var review = response.reviewList;

                    $("#reviewBuyId").val(buy_id);
                    $("#reviewForm h2").text(member_id + "에 대한 리뷰 수정");

                    // 예시: 만족도, 매너, 약속 항목 설정
                    $("input[name='satisfaction'][value='" + review.product_review + "']").prop("checked", true);
                    $("input[name='manner'][value='" + review.chat_review + "']").prop("checked", true);
                    $("input[name='commitment'][value='" + review.commitment_review + "']").prop("checked", true);
                    $("#etc").val(review.etc_review);

                    // 별점 설정
                    setRating(review.review_star);

                    // 입력버튼 수정으로 바꾸기
                    $submitButton.text('수정');
                    $submitButton.removeClass('reviewReg').addClass("reviewMod");

                    // 폼을 보여줍니다.
                    $("#reviewForm").removeClass("hidden");
                } else {
                    alert('보여주기 실패');
                }
            },
            error: function(err) {
                console.log('reviewShow error ' + err);
            }
        });
    });

    // 수정 버튼 클릭 시 (동적)
    $(document).on("click", ".reviewMod", function() {
        var formData = {
            buy_id: $("#reviewBuyId").val(),
            product_review: $('input[name=satisfaction]:checked').val(),
            chat_review: $('input[name=manner]:checked').val(),
            commitment_review: $('input[name=commitment]:checked').val(),
            etc_review: $('#etc').val(),
            review_star: $('.rating__star.fas').length
        };

        $.ajax({
            url: "/product/productReviewUpdate",
            type: "POST",
            data: formData,
            success: function(result) {
                if (result === '1') {
                    alert('후기 수정 성공');
                    resetForm(); // 폼 초기화
                    location.href = "/product/productReview"; // 후기를 다시 불러오기
                }
            },
            error: function(err) {
                console.log('reviewMod error ' + err);
            }
        });
    });

    // 별점을 설정
    function setRating(rating) {
        var stars = $(".rating__star");
        // 모든 별을 빈 별로 초기화
        stars.removeClass("fas").addClass("far");

        // 주어진 rating 수만큼의 별을 채워진 별로 설정
        for (var i = 0; i < rating; i++) {
            $(stars[i]).removeClass("far").addClass("fas");
        }
    }

    // 폼 초기화 함수
    function resetForm() {
        // 라디오 버튼 초기화
        $("#reviewForm").find("input[type='radio']").prop("checked", false);

        // 텍스트 입력 필드 초기화
        $("#reviewForm").find("input[type='text']").val("");

        // 별점 초기화
        setRating(0);

        // 버튼 상태 초기화
        $submitButton.prop('disabled', true); // 입력 버튼 비활성화 상태로 초기화
        $submitButton.text('입력');
        $submitButton.removeClass('reviewMod').addClass("reviewReg");

        // 폼 숨기기
        $('#reviewForm').addClass('hidden');
    }
	
	// 폼 필드 변경 시 버튼 활성화 확인
	$('#reviewForm').on('change input', function() {
		if ($submitButton.hasClass('reviewMod')) {
			checkFormValidity();
		}
	});
});

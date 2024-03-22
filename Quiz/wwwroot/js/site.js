let request = 1;


$(document).ready(function () {
	var currentPageUrl = window.location.href;
	if (!currentPageUrl.endsWith("analytics")) {
		GetQuestion()
	}
})


function GetQuestion() {
	let questionID = $("#ID").val();
	let selected = $("input[name='inlineRadioOptions']:checked").val();

	$.ajax({
		type: "GET",
		url: '/get/question',
		data: {
			QuestionId: questionID,
			SelectOption: selected,
			NextRequest: request
		},
		success: function (res) {
			if (res.isValid) {
				request++;
				$("#questionform").html('');
				$("#questionform").html(res.form);
			}
			else {
				window.location.href = "/";
			}
		}
	});
}

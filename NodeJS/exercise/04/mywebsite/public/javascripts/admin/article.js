$(document).ready(function() {
	var page = $('.pagination');
	var pn = $(page).attr('data-page');
	var totalpage = $(page).attr('data-totalpage');
	if (totalpage - 0 > 1) {
		if (pn == 1) {
			$(page).children('.formerly').addClass('disabled');
		} else {
			$(page).children('.formerly').removeClass('disabled');
		}
		if (pn == totalpage) {
			$(page).children('.future').addClass('disabled');
		} else {
			$(page).children('.future').removeClass('disabled');
		}
	} else {
		$(page).hide();
	}
	var delid;
	$('.btn-del').click(function() {
		delid = $(this).attr('data-delid');
	});
	$('.btn-del2').click(function() {
		$.ajax({
			url: '/admin/article?id=' + delid,
			type: 'DELETE',
			success: function(result) {
				if (result.affectedRows == 1) {
					$('.del-modal').modal('hide')
					$('button[data-delid="' + delid + '"]').parent().parent().remove();
					if ($('tbody > tr').length == 0) {
						location.reload();
					}
				}
			},
			error: function(err) {
				alert(err);
			}
		});
	});
	$('.s_type').change(function() {
		$('form').submit();
	});
});
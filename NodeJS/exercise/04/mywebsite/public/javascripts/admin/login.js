$(document).ready(function() {
	$('.btn-login').click(function() {
		var isNotNull = true;
		$('.form-control').each(function() {
			if ($(this).val() == '') {
				isNotNull = false;
				$(this).focus().keyup(function() {
					$(this).parent().removeClass('has-error');
				}).parent().addClass('has-error');
				return false;
			}
		});
		if (isNotNull) {
			$('form').submit();
		}
	});
});
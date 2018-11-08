$(document).ready(
		function() {
			$(".js-search-category, .js-search-category2").select2(), $(
					'select').select2(), $(".js-search-category").select2({
				maximumSelectionLength : 1,
				palceholder : "재료를 선택하세요"
			}), $("#sortable").sortable(), $("#sortable").disableSelection(),
					$(".btn-light").click(
							function() {
								$('select').select2('destroy');
								var selectorParant = $('#append').html();
								$('#sortable').append(
										'<div class="box ui-sortable-handle">'
												+ selectorParant + '</div>');
								$('select').select2();
							}), $(
							".select2-selection select2-selection--multiple")
							.on("click", ".select2", function() {
								$(this).parent().parent().parent().focus()
							}), $(
							".select2-selection select2-selection--multiple")
							.on("click", ".select2", function() {
								$(this).parent().parent().parent().keydown()
							}), $(
							".select2-selection select2-selection--multiple")
							.on("click", ".select2", function() {
								$(this).parent().parent().parent().keyup()
							}), $(
							".select2-selection select2-selection--multiple")
							.on("click", ".select2", function() {
								$(this).parent().parent().parent().click()
							}), $(
							".select2-selection select2-selection--multiple")
							.on("click", ".select2", function() {
								$(this).parent().parent().parent().blur()
							}), $(
							".select2-selection select2-selection--multiple")
							.on("click", ".select2", function() {
								$(this).parent().parent().parent().input()
							}), $("#sortable").on("click", ".minusbtn",
							function() {
								$(this).parent().parent().parent().remove()
							})
		});

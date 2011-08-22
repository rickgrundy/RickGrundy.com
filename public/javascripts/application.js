var csrf_token = $('meta[name=csrf-token]').attr('content');

function inplaceEdit(path) {
  $(function() {
      $('.editable').editable(path, {
        method: "PUT",
        id: "field",
 				submitdata: {authenticity_token: csrf_token}
      });
  });	
}

function sortable(listSelector, path, onSort) {	
	$(function() {
		var list = $(listSelector);
		
		function sortableUpdated() {
			$.ajax({
				type: 'PUT',
				data: list.sortable('serialize') + "&authenticity_token=" + csrf_token,
				dataType: 'script',
				complete: function() { list.effect('highlight'); },
				url: path
			});
			onSort(list);
		};
		
		list.sortable({
			dropOnEmpty: false,
			cursor: 'crosshair',
			opacity: 0.4,
			scroll: true,
			update: sortableUpdated
		});
	});
}

function albumsSorted(list) {
  list.find("li").each(function(i, el) {
		var li = $(el);
		li.addClass('album').removeClass('last_album');
		if (i % 3 == 2) {
		  li.addClass('last_album').removeClass('album');
		}
	});
}
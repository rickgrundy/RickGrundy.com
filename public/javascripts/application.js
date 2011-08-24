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
		};
		
		list.sortable({
			dropOnEmpty: false,
			cursor: 'crosshair',
			opacity: 0.4,
			scroll: true,
			update: sortableUpdated,
			change: onSort
		});
	});
}

function gridSorted(list, perRow, mainClass, lastClass) {
	list.find("li").each(function(i, el) {
		var li = $(el);
		li.addClass(mainClass).removeClass(lastClass);
		if (i % perRow == perRow-1) {1
		  li.addClass(lastClass).removeClass(mainClass);
		}
	});
}

function albumsSorted(ev) {
	gridSorted($(ev.target), 3, 'album', 'last_album');
}

function photosSorted(ev) {
 	gridSorted($(ev.target), 5, 'photo', 'last_photo');
}
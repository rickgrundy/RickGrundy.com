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
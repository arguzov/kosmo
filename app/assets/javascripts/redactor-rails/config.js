window.init_redactor = function(){
  var csrf_token = $('meta[name=csrf-token]').attr('content');
  var csrf_param = $('meta[name=csrf-param]').attr('content');
  var params;
  if (csrf_param !== undefined && csrf_token !== undefined) {
    params = csrf_param + "=" + encodeURIComponent(csrf_token);
  }
  buttons = ['html', '|','formatting','bold', 'italic', 'deleted', '|','unorderedlist', 'orderedlist', 'outdent', 'indent', '|','image', 'video', 'link','horizontalrule']
  $('.redactor').redactor(
    { "imageUpload":"/redactor_rails/pictures?" + params,
      "imageGetJson":"/redactor_rails/pictures",
      "path":"/assets/redactor-rails",
      "css":"style.css",
      "lang":"ru",
      "minHeight": "200",
      buttons: buttons
    }
  );

}

$(document).ready( window.init_redactor );
$(window).bind('page:change', window.init_redactor);


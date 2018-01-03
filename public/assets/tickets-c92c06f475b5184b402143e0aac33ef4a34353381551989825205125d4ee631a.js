(function() {
  $(function() {
    return $('#habilitar-evento-novo').click(function() {
      $('#evento-existente').hide();
      return $('#evento-novo').removeClass('hide');
    });
  });

}).call(this);

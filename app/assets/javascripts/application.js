//= require jquery
//= require bootstrap-sprockets
//= require select2-full

$(function() {
    $("select").select2({
        placeholder: "Selecione",
        allowClear: true,
        theme: 'bootstrap'
    });
});

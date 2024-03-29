// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'bootstrap'
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('datatables.net-bs4')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require select2
//= require datatables
//= require_tree .

// $(document).ready(function() {
//     if ($("#prod_dd").length > 0)
//         $('#prod_dd').select2();
//     if ($("#order_product_id").length > 0)
//         $('#order_product_id').select2();
        
// });

$(document).on('turbolinks:load', function() {

    $('form').on('click', '.remove_record', function(event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('.form-group').hide();
        return event.preventDefault();
    });

    $('form').on('click', '.add_fields', function(event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $('.fields').append($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });

    $(function () {
        var $checkbox = $('[id^="enable"]'),
            $select = $('#type_select');
    
        $checkbox.change(function (e) {
            $select.prop('disabled', !$checkbox.is(':checked'))
        });
    });

});
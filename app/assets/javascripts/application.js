// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .

// setlist
function add_song(song, vocal) {
  var addrow = $('#addrow').val();
  var addidx = $('#addidx').val();
  $('table#musics_table').append(
    '<tr id="tr_' + addrow + '">' +
      '<td style="width:200px;">' + song + '</td>' +
      '<td style="width:70px;">' + vocal + '</td>' + 
      '<td style="width:20px;"><a href="javascript:remove_song(\'tr_' + addrow + '\')" id="icon_' + addrow + '"><i class="icon-remove"></i></a></td>'
  );
  $('#addrow').val(parseInt(addrow) + 1);
  $('#addidx').val(parseInt(addidx) + 1);
  addrow = $('#addrow').val();

  var songs_num = $('div#songs_number').html();
  var after_num = parseInt(songs_num) + 1
  $('div#songs_number').html(after_num);
}

function remove_song(target) {
  $('tr#' + target).remove();
  var songs_num = $('div#songs_number').html();
  var after_num = parseInt(songs_num) - 1
  $('div#songs_number').html(after_num);
}

$(function() {
    $("#musics_table tbody").sortable({
      cursor: 'move',
      opacity: 0.7,
      placeholder: 'ui-state-highlight',
    });
    $("#musics_table tbody").disableSelection();
});

function updateFavorite(companyId) {
    $.ajax({
        url:"/student/favorite/edit/" + companyId,
        type:'GET'
    })
    .done((data) => {
        location.reload();
    })
    .fail((jqXHR, textStatus, errorThrown) => {
        alert('更新に失敗しました。');
    });
}

$(function(){
    $('#favorite').on('click', function(){
        updateFavorite(companyId);
    });
});
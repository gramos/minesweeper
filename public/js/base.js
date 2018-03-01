function fill_board(board_json) {
    console.log(board_json);
    var board = [];
    var cols  = [];
    board = board_json;

    var table = document.createElement('table');
    table.setAttribute('border','1');
    table.setAttribute('width','50%');

    document.getElementById("board").appendChild(table);

    for (var row = 0; row < board.length; row++) {
        var tr = table.insertRow(row);
        tr.id = "r-" + row;
        cols = board[row];

        for (var col = 0; col < cols.length; col++) {
          var td = tr.insertCell(col);
            td.innerHTML = board_json[row][col];
        }
    }

    console.log(cols.length);
}

function get_board() {
    var xhr = new XMLHttpRequest();
    var url = "http://localhost:9393/mine_sweeper";

    var board_json = '';

    xhr.onreadystatechange = function () {

        if (xhr.readyState === 4 && xhr.status === 200) {
            board_json = JSON.parse(xhr.responseText);
            fill_board(board_json);
        }

    };

    xhr.open("POST", url, true);
    xhr.send();
}


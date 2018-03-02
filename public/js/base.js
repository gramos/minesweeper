function fill_board(board_json) {
    var board = [];
    var cols  = [];
    board = board_json;

    var table = document.createElement('table');

    table.setAttribute('width','10%');
    table.id = 'boardTable';
    document.getElementById("board").appendChild(table);

    for (var row = 0; row < board.length; row++) {
        var tr = table.insertRow(row);
        cols   = board[row];

        for (var col = 0; col < cols.length; col++) {
          var td = tr.insertCell(col);

          td.className = "sq";
          td.id = "r" + row + "c" + col;

          td.addEventListener('mousedown', function (event) {
            c = this.id.split("c")[1];
            r = this.id.split("c")[0].split("r")[1];

              if (board_json[r][c] == "x") {
                this.innerHTML = '<i class="fas fa-bomb sqExploded"></i>';
              } else if (board_json[r][c] == "0"){
                  get_neighbors(r, c, board_json);
              } else {
                  this.innerHTML = board_json[r][c];
              }
          });
        }
    }
}

function get_neighbors(row, col, board_json) {
    var xhr = new XMLHttpRequest();

    var url = "http://localhost:9393/change_mine_sweeper/" + row +
              "/" + col + "/" + JSON.stringify(board_json);

    xhr.onreadystatechange = function () {
      if (xhr.readyState === 4 && xhr.status === 200) {
        adjacents = JSON.parse(xhr.responseText);
          for (var i = 0; i < adjacents.length; i++) {
              var element = adjacents[i];
              cell = document.getElementById("r"+ element['r']  + "c" + element['c']);
              cell.innerHTML = element['data'];
              cell.className = "sq sqExposed";
          }

      }

    };

    xhr.open("POST", url, true);
    xhr.send();
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


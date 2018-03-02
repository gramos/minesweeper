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
                this.classList.add("sqExposed");
                this.innerHTML = '<i class="fas fa-bomb sqExploded"></i>';
                open_modal();
              } else if (board_json[r][c] == "0"){
                  get_neighbors(r, c, board_json);
              } else {
                  this.classList.add("sqExposed");
                  this.innerHTML = board_json[r][c];
              }
          });
        }
    }
}

function open_modal(){
  var modal = document.getElementById('modalMessage');
  var span = document.getElementsByClassName("close")[0];

   modal.style.display = "block";
   span.onclick = function() {
   modal.style.display = "none";
   document.getElementById("boardTable").remove();
   get_board();
  }
}
function get_neighbors(row, col, board_json) {
    var xhr = new XMLHttpRequest();

    var url = "http://minesweeper.lacasa.tech/mine_sweeper/" + row +
              "/" + col + "/" + JSON.stringify(board_json);

    xhr.onreadystatechange = function () {
      if (xhr.readyState === 4 && xhr.status === 200) {
        adjacents = JSON.parse(xhr.responseText);
          for (var i = 0; i < adjacents.length; i++) {
              var element = adjacents[i];
              cell = document.getElementById("r"+ element['r']  + "c" + element['c']);
              cell.innerHTML = element['data'];
              cell.classList.add("sqExposed");
          }

      }

    };

    xhr.open("POST", url, true);
    xhr.send();
}

function get_board() {
    var xhr = new XMLHttpRequest();
    var url = "http://minesweeper.lacasa.tech/mine_sweeper";

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


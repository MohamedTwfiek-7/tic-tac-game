import 'dart:math';

class Player {
  static const x = 'X';
  static const o = 'O';
  static const empty = '';

  static List<int> playerX = [];
  static List<int> playerO = [];
}

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    // z is optional
    if (z == null)
      return contains(x) && contains(y);
    else
      return contains(x) && contains(y) && contains(z);
  }
}

class Game {
  void playGame(int inx, String activePlayer) {
    if (activePlayer == 'X') Player.playerX.add(inx);
    if (activePlayer == 'O') Player.playerO.add(inx);
  }

  checkWinner() {
    String winner = '';

    if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(0, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6))
      winner = 'X';
    else if (Player.playerO.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(0, 4, 8) ||
        Player.playerO.containsAll(2, 4, 6))
      winner = 'O';
    else {
      winner = '';
    }
    return winner;
  }

  Future autoPlay(activePlayer) async {
    int inx = 0;
    List<int> emptyCells = [];

    for (int i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        emptyCells.add(i);
      }
    }
    //start center(Attack)
    if (Player.playerO.containsAll(0, 1) && emptyCells.contains(2))
      inx = 2;
    else if (Player.playerO.containsAll(3, 4) && emptyCells.contains(5))
      inx = 5;
    else if (Player.playerO.containsAll(6, 7) && emptyCells.contains(8))
      inx = 8;
    else if (Player.playerO.containsAll(0, 3) && emptyCells.contains(6))
      inx = 6;
    else if (Player.playerO.containsAll(1, 4) && emptyCells.contains(7))
      inx = 7;
    else if (Player.playerO.containsAll(2, 5) && emptyCells.contains(8))
      inx = 8;
    else if (Player.playerO.containsAll(0, 4) && emptyCells.contains(8))
      inx = 8;
    else if (Player.playerO.containsAll(2, 4) && emptyCells.contains(6))
      inx = 6;
    //start end(Attack)
    else if (Player.playerO.containsAll(0, 2) && emptyCells.contains(1))
      inx = 1;
    else if (Player.playerO.containsAll(3, 5) && emptyCells.contains(4))
      inx = 4;
    else if (Player.playerO.containsAll(6, 8) && emptyCells.contains(7))
      inx = 7;
    else if (Player.playerO.containsAll(0, 6) && emptyCells.contains(3))
      inx = 3;
    else if (Player.playerO.containsAll(1, 7) && emptyCells.contains(4))
      inx = 4;
    else if (Player.playerO.containsAll(2, 8) && emptyCells.contains(5))
      inx = 5;
    else if (Player.playerO.containsAll(0, 8) && emptyCells.contains(4))
      inx = 4;
    else if (Player.playerO.containsAll(2, 6) && emptyCells.contains(4))
      inx = 4;
    //center end(Attack)
    else if (Player.playerO.containsAll(2, 1) && emptyCells.contains(0))
      inx = 0;
    else if (Player.playerO.containsAll(5, 4) && emptyCells.contains(3))
      inx = 3;
    else if (Player.playerO.containsAll(8, 7) && emptyCells.contains(6))
      inx = 6;
    else if (Player.playerO.containsAll(6, 3) && emptyCells.contains(0))
      inx = 0;
    else if (Player.playerO.containsAll(7, 4) && emptyCells.contains(1))
      inx = 1;
    else if (Player.playerO.containsAll(8, 5) && emptyCells.contains(2))
      inx = 2;
    else if (Player.playerO.containsAll(8, 4) && emptyCells.contains(0))
      inx = 0;
    else if (Player.playerO.containsAll(6, 4) && emptyCells.contains(2))
      inx = 2;
    //start center(Defence)
    else if (Player.playerX.containsAll(0, 1) && emptyCells.contains(2))
      inx = 2;
    else if (Player.playerX.containsAll(3, 4) && emptyCells.contains(5))
      inx = 5;
    else if (Player.playerX.containsAll(6, 7) && emptyCells.contains(8))
      inx = 8;
    else if (Player.playerX.containsAll(0, 3) && emptyCells.contains(6))
      inx = 6;
    else if (Player.playerX.containsAll(1, 4) && emptyCells.contains(7))
      inx = 7;
    else if (Player.playerX.containsAll(2, 5) && emptyCells.contains(8))
      inx = 8;
    else if (Player.playerX.containsAll(0, 4) && emptyCells.contains(8))
      inx = 8;
    else if (Player.playerX.containsAll(2, 4) && emptyCells.contains(6))
      inx = 6;
    //start end(Defence)
    else if (Player.playerX.containsAll(0, 2) && emptyCells.contains(1))
      inx = 1;
    else if (Player.playerX.containsAll(3, 5) && emptyCells.contains(4))
      inx = 4;
    else if (Player.playerX.containsAll(6, 8) && emptyCells.contains(7))
      inx = 7;
    else if (Player.playerX.containsAll(0, 6) && emptyCells.contains(3))
      inx = 3;
    else if (Player.playerX.containsAll(1, 7) && emptyCells.contains(4))
      inx = 4;
    else if (Player.playerX.containsAll(2, 8) && emptyCells.contains(5))
      inx = 5;
    else if (Player.playerX.containsAll(0, 8) && emptyCells.contains(4))
      inx = 4;
    else if (Player.playerX.containsAll(2, 6) && emptyCells.contains(4))
      inx = 4;
    //center end(Defence)
    else if (Player.playerX.containsAll(2, 1) && emptyCells.contains(0))
      inx = 0;
    else if (Player.playerX.containsAll(5, 4) && emptyCells.contains(3))
      inx = 3;
    else if (Player.playerX.containsAll(8, 7) && emptyCells.contains(6))
      inx = 6;
    else if (Player.playerX.containsAll(6, 3) && emptyCells.contains(0))
      inx = 0;
    else if (Player.playerX.containsAll(7, 4) && emptyCells.contains(1))
      inx = 1;
    else if (Player.playerX.containsAll(8, 5) && emptyCells.contains(2))
      inx = 2;
    else if (Player.playerX.containsAll(8, 4) && emptyCells.contains(0))
      inx = 0;
    else if (Player.playerX.containsAll(6, 4) && emptyCells.contains(2))
      inx = 2;
    else {
      Random r = Random();
      int randomInx = r.nextInt(emptyCells.length);

      inx = emptyCells[randomInx];
    }
    playGame(inx, activePlayer);
  }
}

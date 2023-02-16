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
        Player.playerX.containsAll(1, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6)) winner = 'X';
    if (Player.playerO.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(1, 4, 8) ||
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
      if (!Player.playerX.contains(i) || !Player.playerO.contains(i)) {
        emptyCells.add(i);
      }
    }
    Random r = Random();
    int randomInx = r.nextInt(emptyCells.length);
    /*while (Player.playerX.contains(randomInx) ||
        Player.playerO.contains(randomInx)) {
      randomInx = r.nextInt(emptyCells.length);
    }
    print(randomInx);*/
    inx = emptyCells[randomInx];
    playGame(inx, activePlayer);
  }
}

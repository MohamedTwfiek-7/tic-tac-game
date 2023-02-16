import 'package:flutter/material.dart';

import 'game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePlayer = 'X';
  bool gameOver = false;
  int turn = 0; //if 9 game over
  String result = 'Temp';
  Game game = Game();

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile.adaptive(
              title: const Text(
                'Ture on/off 2 Players',
                style: TextStyle(color: Colors.white, fontSize: 28),
                textAlign: TextAlign.center,
              ),
              value: isSwitched,
              onChanged: (bool newValue) {
                setState(() {
                  isSwitched = newValue;
                });
              },
            ),
            Text(
              'It\'s $activePlayer Turn'.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 52),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
                crossAxisSpacing: 8.0,
                padding: const EdgeInsets.all(16),
                children: List.generate(9, (index) {
                  return InkWell(
                    onTap: gameOver ? null : () => _onTap(index),
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).shadowColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          Player.playerX.contains(index)
                              ? 'X'
                              : Player.playerO.contains(index)
                                  ? 'O'
                                  : '',
                          style: TextStyle(
                              color: Player.playerX.contains(index)
                                  ? Colors.blue
                                  : Colors.pink,
                              fontSize: 52),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Text(
              result,
              style: const TextStyle(color: Colors.white, fontSize: 42),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  activePlayer = 'X';
                  gameOver = false;
                  turn = 0; //if 9 game over
                  result = '';
                  Player.playerX = [];
                  Player.playerO = [];
                });
              },
              icon: const Icon(Icons.replay),
              label: const Text('Repeat The Game'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).splashColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onTap(int index) async {

    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {

      game.playGame(index, activePlayer);
      updateState();
      if(!isSwitched && !gameOver){
        await game.autoPlay(activePlayer);
        updateState();
      }
    }
  }

  void updateState() {
    setState(() {
      activePlayer = activePlayer == 'X' ? 'O' : 'X';
      String winner = game.checkWinner();
      if(winner != ''){
        result = '$winner is the winner';
      }else{
        result = 'Draw';
      }
    });
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Icon Images
  var cross = Icon(
    Icons.cancel,
    size: 80,
  );
  var circle = Icon(
    Icons.circle,
    size: 80,
  );
  var edit = Icon(
    Icons.square,
    size: 80,
    color: Colors.grey[500],
  );

  bool isCross = true;
  late String message;
  late List<String> gameState;

  // Initializing empty box
  @override
  void initState() {
    gameState = List.filled(9, "empty");
    message = "";
    super.initState();
  }

  //Gameplay

  playGame(int index) {
    if (gameState[index] == 'empty') {
      setState(() {
        if (isCross) {
          gameState[index] = "cross";
        } else {
          gameState[index] = "circle";
        }

        isCross = !isCross;
        checkWin();
      });
    }
  }

  //ResetGame
  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      message = "";
    });
  }

  //Getting Icon
  Icon getIcon(String title) {
    switch (title) {
      case ('empty'):
        return edit;
        break;

      case ('cross'):
        return cross;
        break;

      case ('circle'):
        return circle;
        break;

      default:
        throw Exception('error');
    }
  }

  //WinLogic
  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        message = gameState[0] + 'Wins';
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        message = gameState[3] + 'Wins';
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        message = gameState[6] + 'Wins';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        message = gameState[0] + 'Wins';
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        message = gameState[1] + 'Wins';
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        message = gameState[2] + 'Wins';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        message = gameState[0] + 'Wins';
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        message = gameState[3] + 'Wins';
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        message = 'Game Draw';
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicTacToe'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: gameState.length,
                  itemBuilder: (context, i) => SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: MaterialButton(
                          onPressed: () {
                            playGame(i);
                          },
                          child: getIcon(gameState[i]),
                        ),
                      ))),
          Text(
            message,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: resetGame, child: Text('ResetGame')),
            ],
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

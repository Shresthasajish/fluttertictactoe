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
    this.message = "";
    super.initState();
  }

  //Gameplay

  playGame(int index) {
    if (this.gameState[index] == 'empty') {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        isCross = !isCross;
      });
    }
  }

  //ResetGame
  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      this.message = "";
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
  checkWin() {}

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
                            this.playGame(i);
                          },
                          child: getIcon(this.gameState[i]),
                        ),
                      ))),
          ElevatedButton(onPressed: resetGame, child: Text('ResetGame'))
        ],
      ),
    );
  }
}

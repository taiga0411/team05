class GameState {
  String state; // "start", "playing", "gameover"

  GameState() {
    state = "start";
  }

  boolean isStart() {
    return state.equals("start");
  }

  boolean isPlaying() {
    return state.equals("playing");
  }

  boolean isGameOver() {
    return state.equals("gameover");
  }

  void startGame() {
    state = "playing";
  }

  void gameOver() {
    state = "gameover";
  }

  void drawStartScreen() {
    background(20, 20, 40);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(48);
    text("襲ってくる敵を倒すゲーム", width/2, height/2 - 60);
    textSize(24);
    text("←→ / A D で移動、SPACEで攻撃", width/2, height/2);
    textSize(28);
    fill(255, 200, 0);
    text("スペースキーでスタート", width/2, height/2 + 60);
  }

  void drawGameOverScreen() {
    background(0);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(60);
    text("GAME OVER", width/2, height/2 - 20);
    textSize(24);
    text("スペースキーでもう一度", width/2, height/2 + 40);
  }
}

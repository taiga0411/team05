class Gate {

  // 座標
  float x, y;

  // 大きさ
  float w, h;

  // 移動速度
  float speed;

  // ゲートの種類
  // "+"：加算
  // "×"：倍率
  String type;

  // 効果の値
  int value;
  int timer = 0;

  // コンストラクタ
  Gate(float x, float y, int level) {

    this.x = x;
    this.y = y;

    speed = 2;
    w = 100;
    h = 60;

   // ランダムでゲートを生成

if (random(1) < 0.3) {
  type = "+";
  value = int(random(2, 8));

} else {
  type = "-";
  value = -(int(random(5 + level , 5 + level )));
}
  }
  // 更新
  void update() {

  y += speed;

  timer++;

  // 2秒ごと（60fpsなら120フレーム）
  if (timer >= 120) {

    if (value < 0) {
      value--;
    }

    timer = 0;
  }
}

  // 描画
  void display() {

    rectMode(CENTER);

   if (value >= 0) {
  fill(0, 180, 255);   // 青
} else {
  fill(255, 80, 80);   // 赤
}

    stroke(0);
    strokeWeight(2);
    rect(x, y, w, h, 10);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    String str;

if (value >= 0) {
  str = "+" + value;
} else {
  str = "" + value;
}

text(str, x, y);
  }

// 弾が当たったらゲートの値を増やす
// 弾が当たった回数だけゲートの値を増やす
void increase() {
  value++;
} 
  // プレイヤーに効果を適用
void apply(Player player) {
  player.addCount(value);
}

  // プレイヤーとの当たり判定
  boolean hit(Player player) {

    return player.x > x - w/2 &&
           player.x < x + w/2 &&
           player.y > y - h/2 &&
           player.y < y + h/2;
  }

  // 画面外判定
  boolean isOut() {
    return y > height + h;
  }
}

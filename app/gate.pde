class Gate {

  // 座標
  float x;
  float y;

  // 移動速度
  float speed;

  // ゲートの値（+5、-3など）
  int value;

  // 大きさ
  float w;
  float h;

  // コンストラクタ
  Gate(float x, float y) {

    this.x = x;
    this.y = y;

    speed = 2;

    // ランダムで +5 ～ +10 または -1 ～ -5
    if (random(1) < 0.5) {
      value = int(random(5, 11));
    } else {
      value = -int(random(1, 6));
    }

    w = 100;
    h = 60;
  }

  // 更新
  void update() {
    y += speed;
  }

  // 描画
  void display() {

    rectMode(CENTER);

    if (value >= 0) {
      fill(0, 200, 255);
    } else {
      fill(255, 80, 80);
    }

    stroke(0);
    rect(x, y, w, h);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);

    if (value > 0) {
      text("+" + value, x, y);
    } else {
      text(value, x, y);
    }
  }

  // 弾が当たった時
  void damage(int attack) {

    if (value > 0) {
      value -= attack;

      if (value < 0) {
        value = 0;
      }
    }

    if (value < 0) {
      value += attack;

      if (value > 0) {
        value = 0;
      }
    }
  }

  // ゲートが0になったか
  boolean isFinished() {
    return value == 0;
  }

  // 画面外判定
  boolean isOut() {
    return y > height + h;
  }

}

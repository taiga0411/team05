class Bullet {

  // 座標
  float x;
  float y;

  // 移動速度
  float speed;

  // 攻撃力
  int attack;

  // 大きさ
  float size;

  // コンストラクタ
  Bullet(float x, float y) {

    this.x = x;
    this.y = y;

    speed = 8;
    attack = 1;
    size = 10;
  }

  // 更新処理
  void update() {
    y -= speed;
  }

  // 描画
  void display() {

    pushMatrix();

    translate(x, y);

    fill(255, 255, 0);
    noStroke();
    ellipse(0, 0, size, size);

    popMatrix();
  }

  // 画面外に出たか
  boolean isOut() {
    return y < -size;
  }

}

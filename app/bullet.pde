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
  Bullet(float x, float y, int attack) {

    this.x = x;
    this.y = y;

    speed = 8;

    // 人数分の攻撃力
    this.attack = attack;

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

    fill(255, 140, 0);
    noStroke();
    ellipse(0, 0, size, size);

    popMatrix();
  }

  // 画面外に出たか
  boolean isOut() {
    return y < -size;
  }
}

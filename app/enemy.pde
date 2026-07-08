class Enemy {

  // 座標
  float x;
  float y;

  // 移動速度
  float speed;

  // 体力
  int hp;

  // 大きさ
  float size;

  // コンストラクタ
  Enemy(float x, float y) {

    this.x = x;
    this.y = y;

    speed = 2;
    hp = 3;
    size = 30;
  }

  // 更新処理
  void update() {
    y += speed;
  }

  // 描画
  void display() {

    pushMatrix();

    translate(x, y);

    fill(255, 80, 80);
    stroke(0);
    ellipse(0, 0, size, size);

    popMatrix();
  }

  // ダメージ
  void damage(int attack) {
    hp -= attack;
  }

  // 倒されたか判定
  boolean isDead() {
    return hp <= 0;
  }

}

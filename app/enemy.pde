class Enemy {

  float x;
  float y;

  float speed;
  int hp;
  int maxHp;
 float size;

  Enemy(float x, float y) {

    this.x = x;
    this.y = y;

    // 経過時間（秒）
    int sec = frameCount / 60;

    // HP：15秒ごとに+1
    hp = 15 + sec / 1;
    maxHp = hp;

    // Speed：10秒ごとに+0.2
    speed = 2 + (sec / 10) * 0.2;

    size = 50;
  }

  void update() {
    y += speed;
  }

  void display() {

    pushMatrix();
    translate(x, y);

    // HPに応じて色を変える
    if (hp == 1) {
      fill(255, 80, 80);      // 赤
    } else if (hp == 2) {
      fill(255, 150, 0);      // オレンジ
    } else if (hp == 3) {
      fill(255, 255, 0);      // 黄色
    } else if (hp == 4) {
      fill(100, 255, 100);    // 黄緑
    } else if (hp == 5) {
      fill(0, 200, 255);      // 水色
    } else {
      fill(180, 0, 255);      // 紫（HP6以上）
    }

    stroke(0);
    ellipse(0, 0, size, size);
    
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(hp, 0, 0);

    popMatrix();
    

  }

  void damage(int attack) {
    hp -= attack;
  }

  boolean isDead() {
    return hp <= 0;
  }
}

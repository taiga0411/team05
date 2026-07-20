class Player {

  float x;
  float y;

  float speed;

  int count;


  Player() {

    x = width / 2;
    y = height - 70;

    speed = 6;

    count = 1;

  }


  void move(boolean left, boolean right) {

    if (left) {
      x -= speed;
    }

    if (right) {
      x += speed;
    }

    x = constrain(x, 25, width - 25);

  }



  void display() {

    pushMatrix();

    translate(x, y);

    fill(50,150,255);
    noStroke();

    ellipse(0,0,40,40);


    stroke(0);
    strokeWeight(4);

    line(0,0,0,-30);

    popMatrix();

  }



  // ★追加
  void addCount(int num) {

    count += num;

    }

  }

Player player;

ArrayList<Enemy> enemies;
ArrayList<Bullet> bullets;
ArrayList<Gate> gates;


// キー入力
boolean leftKey = false;
boolean rightKey = false;


// 出現タイマー
int enemyTimer = 0;
int gateTimer = 0;


void setup() {

  size(800, 600);

  player = new Player();

  enemies = new ArrayList<Enemy>();
  bullets = new ArrayList<Bullet>();
  gates = new ArrayList<Gate>();

}



void draw() {

  background(230);



  //========================
  // 敵生成
  //========================

  enemyTimer++;

  if (enemyTimer > 60) {

    enemies.add(
      new Enemy(random(50, width-50), -30)
    );

    enemyTimer = 0;
  }



  //========================
  // Gate生成
  //========================

  gateTimer++;

  if (gateTimer > 300) {
    
    int level = frameCount / 600*5;   

    gates.add(
      new Gate(random(100, width-100), -50,level)
    );

    gateTimer = 0;
  }



  //========================
  // Player
  //========================

  player.move(leftKey, rightKey);
  player.display();




  //========================
  // Enemy
  //========================

  for (int i=enemies.size()-1; i>=0; i--) {


    Enemy e = enemies.get(i);

    e.update();
    e.display();


    if (e.y > height+50) {

      enemies.remove(i);

    }


    // EnemyとPlayer接触

    if (dist(player.x, player.y, e.x, e.y) < 35) {

      gameOver();

    }

  }




  //========================
  // Bullet
  //========================

  for (int i=bullets.size()-1; i>=0; i--) {


    Bullet b = bullets.get(i);

    b.update();
    b.display();


    if (b.isOut()) {

      bullets.remove(i);

    }

  }




  //========================
  // Gate
  //========================

  for (int i=gates.size()-1; i>=0; i--) {


    Gate g = gates.get(i);

    g.update();
    g.display();


    if (g.isOut()) {

      gates.remove(i);

    }

  }





  //========================
  // Bullet × Enemy
  //========================

  for (int i=bullets.size()-1; i>=0; i--) {


    Bullet b = bullets.get(i);


    for (int j=enemies.size()-1; j>=0; j--) {


      Enemy e = enemies.get(j);



      if (dist(b.x,b.y,e.x,e.y)<30) {


        e.damage(b.attack);


        bullets.remove(i);



        if(e.isDead()){

          enemies.remove(j);

        }


        break;

      }

    }

  }







  //========================
  // Bullet × Gate
  //========================

  for (int i=bullets.size()-1; i>=0; i--) {


    Bullet b = bullets.get(i);



    for(Gate g : gates){


      if(dist(b.x,b.y,g.x,g.y)<50){
        
        
        g.increase(b.attack);



        bullets.remove(i);


        break;

      }

    }

  }



  for(int i=gates.size()-1;i>=0;i--){


    Gate g = gates.get(i);



    if(dist(player.x,player.y,g.x,g.y)<60){



      player.addCount(g.value);


      gates.remove(i);


    }


  }







  //========================
  // UI
  //========================

  fill(0);

  textSize(25);

  textAlign(LEFT);

  text(
    "人数 : "+player.count,
    20,
    30
  );


}





//========================
// キー入力
//========================


void keyPressed(){


  if(key=='a' || keyCode==LEFT){

    leftKey=true;

  }


  if(key=='d' || keyCode==RIGHT){

    rightKey=true;

  }



  // 発射

  if(key==' '){

    bullets.add(
      new Bullet(player.x,player.y-20)
    );

  }


}




void keyReleased(){


  if(key=='a' || keyCode==LEFT){

    leftKey=false;

  }


  if(key=='d' || keyCode==RIGHT){

    rightKey=false;

  }


}




void gameOver(){


  background(0);


  fill(255);

  textAlign(CENTER,CENTER);

  textSize(60);

  text(
    "GAME OVER",
    width/2,
    height/2
  );


  noLoop();

}

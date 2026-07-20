Player player;
PFont font;
GameState gameState;

ArrayList<Enemy> enemies;
ArrayList<Bullet> bullets;
ArrayList<Gate> gates;


// キー入力
boolean leftKey = false;
boolean rightKey = false;

int roadOffset = 0;
// 出現タイマー
int enemyTimer = 0;
int gateTimer = 0;

int killCount = 0;

// 発射クールタイム
int shotTimer = 0;
int shotInterval = 20;   // 20フレームごとに発射

void setup() {
  size(800, 600);
  font = createFont("Meiryo", 25);
  textFont(font);
  player = new Player();
  enemies = new ArrayList<Enemy>();
  bullets = new ArrayList<Bullet>();
  gates = new ArrayList<Gate>();
  gameState = new GameState();
}



void draw() {
 

  // スタート画面
  if (gameState.isStart()) {
    gameState.drawStartScreen();
    return;
  }

  // ゲームオーバー画面
  if (gameState.isGameOver()) {
    gameState.drawGameOverScreen();
    return;
  }

background(90,180,90);

stroke(255);
strokeWeight(4);

line(width/3,0,width/3,height);
line(width*2/3,0,width*2/3,height);
 
  shotTimer++;


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

      gameState.gameOver();

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

         if (e.isDead()) {

  killCount += e.maxHp;
  enemies.remove(j);

}

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
        
        
        g.increase();



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
  text(
  "撃破数 : " + killCount,
  20,
  60
);
  
  if (player.count <= 0) {
  player.count = 0;
  gameState.gameOver();
}


}





//========================
// キー入力
//========================


void keyPressed() {

  // スタート／ゲームオーバー画面でのスペースキー
  if ((gameState.isStart() || gameState.isGameOver()) && key == ' ') {
    restartGame();
    return;
  }

  if (key == 'a' || keyCode == LEFT) {
    leftKey = true;
  }

  if (key == 'd' || keyCode == RIGHT) {
    rightKey = true;
  }

  // 発射
  if (key == ' ' && shotTimer >= shotInterval) {

    bullets.add(
      new Bullet(player.x, player.y - 20, player.count)
    );

    shotTimer = 0;
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


void restartGame() {

  player = new Player();
  enemies.clear();
  bullets.clear();
  gates.clear();

  killCount = 0;
  enemyTimer = 0;
  gateTimer = 0;
  shotTimer = 0;

  gameState.startGame();

}

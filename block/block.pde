int fn=0;
int bx=50, by=500, bl=30;
int sx=3, sy=3;//初期速度
int[][]bn=new int [10][5];
int ln[]={0, 40, 80, 120, 160};
int t=60, tm=0;
int wj=0;
int point=0;
int px=300, py=550;//自機の座標
int cb=50;

abstract class game {
  abstract void stage();
  abstract void ball();
  abstract void player();
}
//ゲーム開始
class Start extends game {
  void stage() {
    for (int i=0; i<10; i++) {
      for (int j=0; j<5; j++) {
        if (bn[i][j]==0) {
          fill(255, 0, 0);
          rect(i*90, j*40, 90, 40);
        }
      }
    }
    fill(255);
    ellipse(bx, by, bl, bl);
    fill(255);
    rect(px, py, 50, 20);
    fill(255);
    textSize(80);
    text("GameStart!", 230, 300);
    textSize(50);
    text("Push [s]", 500, 500);
  }
  void ball() {
  }
  void player() {
  }
}


//クリア時の設定
class GameClear extends game {
  void stage() {
    fill(255);
    textSize(100);
    text("Congratulation!!!", 200, 500);
    text("point:", 200, 700);
    text(point, 270, 700);
  }
  void ball() {
  }
  void player() {
  }
}

//ゲームオーバー時の設定
class GameOver extends game {
  void stage() {
    fill(255);
    textSize(100);
    text("Game Over", 200, 300);
    fill(0,0,255);
    textSize(60);
    text("RESTART PUSH [ENTER]", 100, 500);
  }
  void ball() {
  }
  void player() {
  }
}

Start s;
play p;
GameClear c;
GameOver g;

void setup() {
  size(900, 600);
  s=new Start();
  p=new play();
  c=new GameClear();
  g=new GameOver();
  //rectMode(CENTER);
  for (int i=0; i<10; i++) {
    for (int j=0; j<5; j++) {
      bn[i][j]=0;
    }
  }
}

void draw() {
  background(0);
  if (fn==0) {
    //start
    s.stage();
    s.ball();
    s.player();
  } else if (fn==1) {
    p.stage();
    p.ball();
    p.player();
  } else if (fn==2) {
    //GameClear
    c.stage();
    c.ball();
    c.player();
  } else {
    //GameOver
    g.stage();
    g.ball();
    g.player();
  }
  println(bx+","+by);
}

void keyPressed() {
  if (fn==0 && key=='s') {
    fn++;
  }
  if (keyCode==LEFT) {
    px-=70;
  } else if (keyCode==RIGHT) {
    px+=70;
  }
  if ((fn == 2 || fn == 3) && keyCode==ENTER) {
    fn = 0;
    bx=50;
    by=500;
    sx = sy = 3;
    t=60;
    tm=0;
    wj=0;
    point=0;
    px=300;
    py=550;
    cb=50;
    for (int i=0; i<10; i++) {
      for (int j=0; j<5; j++) {
        bn[i][j]=0;
      }
    }
  }
}

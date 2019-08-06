class play extends game {
  void stage() {
    tm++;//時間設定
    if (tm==60) {
      t--;
      tm=0;
    }

    fill(255);
    textSize(30);
    text("TIME:", 100, 500);
    text(t, 200, 500);
    text("SCORE:", 280, 500);
    text(point, 400, 500);

    //お邪魔ブロック登場
    if (t==50&&wj==0) {
      int a=5;//int(random(10));
      for (int m=0; m<a; m++) {
        int b=int(random(10));
        int c=int(random(5));
        if (bn[b][c]!=1) {
          bn[b][c]=2;
        }
      }
      wj++;
    }

    for (int i=0; i<10; i++) {
      for (int j=0; j<5; j++) {
        if (bn[i][j]==0) {
          fill(255, 0, 0);
          rect(i*90, j*40, 90, 40);
        } else if (bn[i][j]==1) {
          //noStroke();
          fill(0);
          rect(i*90, j*40, 90, 40);
        } else if (bn[i][j]==2) {
          fill(255);
          rect(i*90, j*40, 90, 40);
        }
      }
    }
  }

  //ボールの設定
  void ball() {
    fill(255);
    ellipse(bx, by, bl, bl);
    //自機との当たり判定
    if (bx>=width-bl/2 || bx<=bl/2) {
      sx*=-1;
    }
    if (by>=py-bl/2 && (bx>=px && bx<=px+50)) {
      sy*=-1;
    }
    if (by>=height-bl/2 || by<=bl/2) {
      sy*=1;
      if (cb==0 && point>=300) {//ブロックの数が0になって300点以上ならクリア
        if (t<=30) {//30秒以内に全部消したら+30点
          point+=30;
        }
        fn=2;
      } else {
        fn=3;
      }
    }

    for (int i=0; i<5; i++) {
      for (int j=0; j<10; j++) {
        if (by-bl/2-40<=i*40&&(bx>j*90&&bx<j*90+90)&&bn[j][i]==0) {
          cb--;
          sy*=-1;
          point+=10;//+10点
          bn[j][i]=1;
          break;
        }
        if (by-bl/2-40<=i*40&&(bx>j*90&&bx<j*90+90)&&bn[j][i]==2) {
          cb--;
          //速さを早くする
          sy*=-3/2;
          sx*=3/2;
          t-=5;
          point-=10;//-10点
          bn[j][i]=1;
          break;
        }
      }
    }

    bx+=sx;
    by-=sy;
  }
  //自機の設定
  void player() {
    fill(255);
    rect(px, py, 50, 20);
  }
}

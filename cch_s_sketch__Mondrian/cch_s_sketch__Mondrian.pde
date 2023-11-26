import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song1,song2,song3;


String s = "HELLO, THIS IS MONDERIAN";
String ss ="Press the A, B or F key on your keyboard to start";
int index = 0;
ArrayList<ExpendingLine> lines;
ArrayList<AnimatedRect> Arects;
ArrayList<MovingRect> rects;
color red =color(255,0,0);
color blue =color(0,0,255);
color yellow =color(255,255,0);
color white =color(255);
boolean bKeyPressed = false;
boolean aKeyPressed = false;
boolean fKeyPressed = false;
ArrayList<AnimatedRect> animatedRects = new ArrayList<AnimatedRect>();
   float al = 0;


void setup() {
  size(800, 800);
  minim = new Minim(this);
  song1 = minim.loadFile("stan.mp3", 1024); // 替换为你的音乐文件路径
  song2 = minim.loadFile("牛仔很忙.mp3", 1024);
  song3 = minim.loadFile("芙芙.mp3", 1024);

    Arects = new ArrayList<AnimatedRect>();
  
  rects = new ArrayList<MovingRect>();
  for (int i = 0; i < 15; i++) {
    float x = random(width);
    float y = random(height);
    float w = random(25, 200);
    float h = random(25, 200);
    color c = randomColor();
    rects.add(new MovingRect(x, y, w, h, c));
  }

}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(5);
  fill(255);
  rectMode(CENTER);
  rect(width/2,height/2,600,200);
  rectMode(CORNER);
  fill(0);
  textSize(40);
  if (index < s.length()) {
    text(s.substring(0, index+1), width/2-250, height/2);
    index++;
    delay(100); 
    fill(randomColor());
    float rectX = 155 + textWidth(s.substring(0, min(index, s.length())));
    rect(rectX, height/2-22, 20, 20); // 绘制矩形
  } else {
    for (MovingRect r : rects) {
      r.update();
      r.display();
    }
    rectMode(CENTER);
    fill(255);
    rect(width/2,height/2,600,200);
    rectMode(CORNER);
    fill(0);
    text(s, width/2-250, height/2);
    fill(yellow);
    rect(620, height/2-22, 20, 20); // 绘制矩形
    textSize(20);
    al = al+0.5;
    fill(0,al);
    text(ss, width/2-200, height/2+50);
  }
  
    if(aKeyPressed == true){
     background(255);
     animate(1);
  }

  
  if(bKeyPressed == true){
     background(255);
     animate(2);
  }
  
    if(fKeyPressed == true){
     background(255);
     animate(3);
  }
}


void animate(int colorMode){
  for (int i = Arects.size() - 1; i >= 0; i--) {
    AnimatedRect r = Arects.get(i);
    r.update();
    r.display();
    if (r.isTransparent()) {
      // 如果矩形已经完全透明，那么从列表中移除它
      Arects.remove(i);
    }
  }

  if (Arects.isEmpty()) {
    // 如果所有的矩形都已经消失，那么生成新的矩形
  divide(0, 0, width, height, colorMode);
  }
}


void keyPressed() {
  if (key == 'A' || key == 'a') {
    aKeyPressed = true;
    if (!song1.isPlaying()) {
      song1.loop();
    }
  }
  if (key == 'B' || key == 'b') {
    bKeyPressed = true;
    if (!song2.isPlaying()) {
      song2.loop();
    }
  }
  
    if (key == 'F' || key == 'f') {
    fKeyPressed = true;
    if (!song3.isPlaying()) {
      song3.loop();
    }
  }
}

color randomColor() {
  float r = random(1);
  if (r < 0.25) {
    return red; // red
  } else if (r < 0.5) {
    return blue ; // blue
  } else if (r < 0.75) {
    return yellow; // yellow
  } else {
    return white; // white
  }
}

void divide(float x, float y, float w, float h, int colorMode) {
  
   color c;
  switch(colorMode) {
    case 1:
      c = randomcolor1();
      break;
    case 2:
      c = randomcolor2();
      break;
    case 3:
      c = randomColor();
      break;

    default:
      c = color(255); // 默认颜色为白色
  }
  float minSize = 50; // 设置矩形的最小尺寸
  float maxSize = 300; // 设置矩形的最大尺寸

  if (w > minSize && h > minSize) {
    if (w > maxSize && h > maxSize) {
      // 如果宽度和高度都大于最大尺寸，那么按照最大尺寸来划分区域
      divide(x, y, maxSize, maxSize, colorMode);
      divide(x + maxSize, y, w - maxSize, h, colorMode);
      divide(x, y + maxSize, w, h - maxSize, colorMode);
    } else if (random(1) > 0.5) {
      // 水平划分
      float h1 = random(minSize, h);
      Arects.add(new AnimatedRect(x, y, w, h1, c));
      divide(x, y + h1, w, h - h1, colorMode);
    } else {
      // 垂直划分
      float w1 = random(minSize, w);
      Arects.add(new AnimatedRect(x, y, w1, h, c));
      divide(x + w1, y, w - w1, h,colorMode);
    }
  } else {
    // 绘制矩形
    Arects.add(new AnimatedRect(x, y, w, h, colorMode));
  }
}

color randomcolor1() {
  float r = random(1);
  if (r < 1.0 / 15.0) {
    return color(#8EDCE6);
  } else if (r < 2.0 / 15.0) {
    return color(#0A1128); 
  } else if (r < 4.0 / 15.0) {
    return color(#133C55); 
  } else if (r < 7.0 / 15.0) {
    return color(#A7B0CA);
  } else {
    return color(#EDF0FC);
  }
}

color randomcolor2() {
  float r = random(1);
  if (r < 1.0 / 15.0) {
    return color(#E9D758); 
  } else if (r < 2.0 / 15.0) {
    return color(#FF8552); 
  } else if (r < 4.0 / 15.0) {
    return color(#297373); 
  } else if (r < 7.0 / 15.0) {
    return color(#39393A); 
  } else {
    return color(#E6E6E6);
  }
}

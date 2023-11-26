class AnimatedRect {
  float x, y, w, h;
  float targetX, targetY;
  color c;
  float alpha = 255;
  int timer = 0; // 添加一个计时器

  AnimatedRect(float x, float y, float w, float h, color c) {
    this.x = random(-width/2,width+width/2);
    this.y = random(-height/2,height+height/2);
    this.targetX = x;
    this.targetY = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.timer = int(random(60, 180)); // 设置一个随机的初始计时器值
  }

  void update() {
    // 这里的0.05是移动速度，你可以根据需要调整
    this.x = lerp(this.x, this.targetX, 0.05);
    this.y = lerp(this.y, this.targetY, 0.05);
    if (dist(this.x, this.y, this.targetX, this.targetY) < 1) {
      // 如果矩形已经到达目标位置，那么开始减小alpha值
      this.timer--;
      if (this.timer <= 0) {
        this.alpha -= 2;
      }
    }
  }

  void display() {
    stroke(0,this.alpha);
    fill(red(this.c), green(this.c), blue(this.c), this.alpha);
    rect(this.x, this.y, this.w, this.h);
  }

  boolean isTransparent() {
    return this.alpha <= 0;
  }
}

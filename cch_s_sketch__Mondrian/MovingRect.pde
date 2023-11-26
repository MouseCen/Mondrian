class MovingRect {
  float x, y, w, h, dx, dy;
  color c;
  float i=0;
  
  MovingRect(float x, float y, float w, float h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    dx = random(-3, 3);
    dy = random(-3, 3);
  }

  void update() {
    x += dx;
    y += dy;
    if (x < 0) {
      x = 0;
      dx = -dx;
    } else if (x > width - w) {
      x = width - w;
      dx = -dx;
    }
    if (y < 0) {
      y = 0;
      dy = -dy;
    } else if (y > height - h) {
      y = height - h;
      dy = -dy;
    }
  }

  void display() {
    fill(c,i);
    stroke(0,i);
    rect(x, y, w, h);
    i=i+0.5;
  }

}

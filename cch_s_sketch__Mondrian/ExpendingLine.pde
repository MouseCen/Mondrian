class ExpendingLine{
float x;
float y;
float th=0;
float dth=0.05;
float th_max;

ExpendingLine(float line_x,float line_y,float th_max){
this.x=line_x;
this.y=line_y ;
this.th_max=th_max;
}

void update(){
th=th+dth;
}

void display(){
stroke(0);
if(th<=th_max){
  
strokeWeight(th);
}

if(y==0){
line(x,y,x,800);
}
else{
line(x,y,800,y);

}


}


}

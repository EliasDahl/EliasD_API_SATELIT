float angle;
Table table;
float r=200;
PImage earth;
PImage Death;
PShape globe;
PShape globe2;
float sat1Lon;
float sat1Lat;
float sat2Lon;
float sat2Lat;
float angle2;
void setup()
{
  size(600,600,P3D);
  earth=loadImage("earth.jpg");
  Death=loadImage("death start.png");
  JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=2MET3E-DGKEYK-QVD7ZL-4SR4");
JSONArray positionsJson = j.getJSONArray("positions");
  JSONObject u = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/36516/41.702/-76.014/0/2/&apiKey=2MET3E-DGKEYK-QVD7ZL-4SR4");
JSONArray positionsJson2 = u.getJSONArray("positions");
 

JSONObject pos1 = positionsJson.getJSONObject(0);
JSONObject pos2 = positionsJson2.getJSONObject(0);

sat1Lon = pos1.getFloat("satlongitude");
sat1Lat = pos1.getFloat("satlatitude");

sat2Lon = pos2.getFloat("satlongitude");
sat2Lat = pos2.getFloat("satlatitude");
  println(sat1Lon,sat1Lat);
  println(sat2Lon,sat2Lat);
  
  noStroke();
  globe = createShape(SPHERE,r);
  globe.setTexture(earth);
  globe2 = createShape(SPHERE,10);
  globe2.setTexture(Death);
}

void draw()
{
  background(70);
  translate(width*0.5, height*0.5);
  rotateY(angle);
  if(keyPressed){if(key=='a'){angle+=0.01;}}
  if(keyPressed){if(key=='d'){angle-=0.01;}}
  rotateX(angle2);
  if(keyPressed){if(key=='s'){angle2-=0.01;}}
  if(keyPressed){if(key=='w'){angle2+=0.01;}}
  lights();
  fill(255);
  noStroke();
  shape(globe);
  
  
  float theta = radians(sat1Lat);
  float phi = radians(sat1Lon) + PI;
  float x = r * cos(theta) * cos(phi);
  float y = -r * sin(theta);
  float z = -r * cos(theta) * sin(phi);
  translate(x,y,z);
  shape(globe2);
  
  translate(-x,-y,-z);
  float theta2=radians(sat2Lat);
  float phi2=radians(sat2Lon)+PI;
  float x2 = r * cos(theta2) * cos(phi2);
  float y2 = -r * sin(theta2);
  float z2 = -r * cos(theta2) * sin(phi2);
  translate(x2,y2,z2);
  shape(globe2);
  
}

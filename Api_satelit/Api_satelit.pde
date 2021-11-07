float angle;
Table table;
float r=200;
float r2;
PImage earth;
PImage Death;
PShape satelite;
PShape globe;
PShape globe2;
float sat1Lon, sat1Lat,sat1Alt;
float sat2Lon,sat2Lat,sat2Alt;
float sat3Lon,sat3Lat,sat3Alt;
float sat4Lon,sat4Lat,sat4Alt;
//float angle2;
void setup()
{
  size(1000,1000,P3D);
  earth=loadImage("earth.jpg");
  Death=loadImage("death start.png");
  satelite = loadShape("satelite.obj");
  JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=2MET3E-DGKEYK-QVD7ZL-4SR4");
JSONArray positionsJson = j.getJSONArray("positions");
  JSONObject u = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/27424/41.702/-76.014/0/2/&apiKey=2MET3E-DGKEYK-QVD7ZL-4SR4");
JSONArray positionsJson2 = u.getJSONArray("positions");
  JSONObject k = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/31135/41.702/-76.014/0/2/&apiKey=2MET3E-DGKEYK-QVD7ZL-4SR4");
JSONArray positionsJson3 = k.getJSONArray("positions");
  JSONObject h = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/40069/41.702/-76.014/0/2/&apiKey=2MET3E-DGKEYK-QVD7ZL-4SR4");
JSONArray positionsJson4 = h.getJSONArray("positions");

 

JSONObject pos1 = positionsJson.getJSONObject(0);
JSONObject pos2 = positionsJson2.getJSONObject(0);
JSONObject pos3 = positionsJson3.getJSONObject(0);
JSONObject pos4 = positionsJson4.getJSONObject(0);

sat1Lon = pos1.getFloat("satlongitude");
sat1Lat = pos1.getFloat("satlatitude");
sat1Alt = pos1.getFloat("sataltitude");

sat2Lon = pos2.getFloat("satlongitude");
sat2Lat = pos2.getFloat("satlatitude");
sat2Alt = pos2.getFloat("sataltitude");

sat3Lon = pos3.getFloat("satlongitude");
sat3Lat = pos3.getFloat("satlatitude");
sat3Alt = pos3.getFloat("sataltitude");

sat4Lon = pos4.getFloat("satlongitude");
sat4Lat = pos4.getFloat("satlatitude");
sat4Alt = pos4.getFloat("sataltitude");
  println(sat1Lon,sat1Lat,sat1Alt);
  println(sat2Lon,sat2Lat,sat2Alt);
  println(sat3Lon,sat3Lat,sat3Alt);
  println(sat4Lon,sat4Lat,sat4Alt);
  
  noStroke();
  globe = createShape(SPHERE,r);
  globe.setTexture(earth);
  globe2 = createShape(SPHERE,15);
  globe2.setTexture(Death);
}

void draw()
{
  background(15,15,40);
    textSize(50);
  text("Rotate: A/D",20,60);
  translate(width*0.5, height*0.5);
  rotateY(angle);
  if(keyPressed){if(key=='d'){angle+=0.01;}}
  if(keyPressed){if(key=='a'){angle-=0.01;}}
  /*rotateX(angle2);
  if(keyPressed){if(key=='s'){angle2-=0.01;}}
  if(keyPressed){if(key=='w'){angle2+=0.01;}}*/
  lights();
  fill(255);
  noStroke();
  shape(globe);
  pointLight(1000,1000,1000,400,0,0);
  

  r2=r+sat1Alt*0.2;
  float theta = radians(sat1Lat);
  float phi = radians(sat1Lon) + PI;
  float x = r2 * cos(theta) * cos(phi);
  float y = -r2 * sin(theta);
  float z = -r2 * cos(theta) * sin(phi);
  translate(x,y,z);
  shape(globe2);
  textSize(20);
  text("ISS",-10,0,30);
  translate(-x,-y,-z);
  
  r2=r+sat2Alt*0.2;
  theta=radians(sat2Lat);
  phi=radians(sat2Lon)+PI;
  x = r2 * cos(theta) * cos(phi);
  y = -r2 * sin(theta);
  z = -r2 * cos(theta) * sin(phi);
  translate(x,y,z);
  shape(globe2);
  //shape(satelite,0,0);
  text("AQUA",-10,0,30);
  translate(-x,-y-z);
  
  r2=r+sat3Alt*0.2;
  theta=radians(sat3Lat);
  phi=radians(sat3Lon)+PI;
  x = r2 * cos(theta) * cos(phi);
  y = -r2 * sin(theta);
  z = -r2 * cos(theta) * sin(phi);
  translate(x,y,z);
  shape(globe2);
  //shape(satelite,0,0);
  text("AGILE",-10,0,30);
  translate(-x,-y,-z);
  
  r2=r+sat4Alt*0.2;
  theta=radians(sat4Lat);
  phi=radians(sat4Lon)+PI;
  x = r2 * cos(theta) * cos(phi);
  y = -r2 * sin(theta);
  z = -r2 * cos(theta) * sin(phi);
  translate(x,y,z);
  shape(globe2);
  //shape(satelite,0,0);
  text("METEOR M2",-10,0,30);
  translate(-x,-y,-z);
}

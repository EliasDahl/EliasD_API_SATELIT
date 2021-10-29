float angle;
Table table;
float r=200;
PImage earth;
PShape globe;
float sat1Lon;
float sat1Lat;
void setup()
{
  size(600,600,P3D);
  earth=loadImage("earth.jpg");
  JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=2MET3E-DGKEYK-QVD7ZL-4SR4");
JSONArray positionsJson = j.getJSONArray("positions");
 

JSONObject pos1 = positionsJson.getJSONObject(0);
JSONObject pos2 = positionsJson.getJSONObject(1);

sat1Lon = pos1.getFloat("satlongitude");
sat1Lat = pos1.getFloat("satlatitude");

float sat2Lon = pos2.getFloat("satlongitude");
float sat2Lat = pos2.getFloat("satlatitude");
  println(sat1Lon,sat1Lat);
  println(sat2Lon,sat2Lat);
  
  noStroke();
  globe = createShape(SPHERE,r);
  globe.setTexture(earth);
}
void draw()
{
  background(70);
  translate(width*0.5, height*0.5);
  rotateY(angle);
  angle += 0.01;
  lights();
  fill(255);
  noStroke();
  shape(globe);
  
  
  float theta = radians(sat1Lat);
  float phi = radians(sat1Lon) + PI;
  float x = r * cos(theta) * cos(phi);
  float y = -r * sin(theta);
  float z = -r * cos(theta) * sin(phi);
  translate(x,y,z+25);
  sphere(5);
}

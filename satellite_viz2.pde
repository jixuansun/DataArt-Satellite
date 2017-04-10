String dataPath = "/Users/sunjixuan/Desktop/satellite_viz/data";
ArrayList<Satellite> allSatellites = new ArrayList();

PVector rot =  new PVector();
PVector trot = new PVector(1.1, 0, 0);

void setup() {
  size(1450, 720, P3D);
  background(255);
  loadSatelliteData("/satellites.csv");

}


void draw() {
  
  //background(255);
  frameRate(10);


  //earth
  //strokeWeight(5);
  //stroke(#54278f);
  //point(width/2, height/2);
  fill(#fcfcfc);
  ellipse(width/2, height/2,30,28);
  stroke(0);

  for (int i = 0; i < 1300; i++) {
    allSatellites.get(i).render();
  }
}

void loadSatelliteData(String _url) {
  Table rows = loadTable(dataPath +_url);

  for (int i = 1; i<rows.getRowCount(); i++) {
    TableRow row = rows.getRow(i);

    int currentPerigee = pullData(row, 10);
    int currentApogee = pullData(row, 11);

    allSatellites.add(new Satellite(currentPerigee, currentApogee));
  }

  print(allSatellites.get(0).perigee);
}

int pullData(TableRow row, int pos) {

  int convertedData = 0;

  String pureData = row.getString(pos);
  String[] pureDataParsed = pureData.split(",");

  if (pureDataParsed.length > 1) {
    convertedData = int( pureDataParsed[0] + pureDataParsed[1] );
  } else {
    convertedData = int(  pureDataParsed[0]  );
  }

  return convertedData;
}
/*         Pokemon Pack Generator
 Created by Ethan Trott
 Edited by Stephen Kaplan
 
 Rar-Ts:
 0: common
 1: uncommon
 2: rare
 3: rareHolo
 4: ultraRare
 5: secretRare
 
 Groups: 
 First: common(0), uncommon(1)
 Second: rare(2), rareHolo(3)
 Third: ultraRare(4)
 Four: secretRare(5)
 Break: BREAKS(4)
 */
void setup() {
  fullScreen();
  json = loadJSONObject(packType+".json");
  list = loadJSONObject("list.json");
  packData = list.getJSONObject("rs");
  ints = new IntList();
  art1 = loadImage("images/" + packType+"/art1.jpg");
  art2 = loadImage("images/" + packType+"/art2.jpg");
  art3 = loadImage("images/" + packType+"/art3.jpg");
  art4 = loadImage("images/" + packType+"/art4.jpg");
  back = loadImage("images/back.png");
  textAlign(CENTER, CENTER);
  textSize(32);
  println("Ready");
  packOpen();
}

void draw() {
  background(#233076);
  imageMode(CENTER);
  if (waiting == true) {
    if (packArt == 1) {
      image(art1, width/2, height/2, width/5, height/1.5);
    } else if (packArt == 2) {
      image(art2, width/2, height/2, width/5, height/1.5);
    } else if (packArt == 3) {
      image(art3, width/2, height/2, width/5, height/1.5);
    } else if (packArt == 4) {
      image(art4, width/2, height/2, width/5, height/1.5);
    }
    fill(255);
    textSize(54);
    text("Pokémon Pack Generator", width/2, height/9);
    textSize(32);
    checkWaiting();
    fill(255);
    text("Click to Open "+packData.getString("name"), width/2, height/9*8);
    text("Press the Number Keys to Switch Packs", width/2, height/9*8+40);
  } else {
    textSize(54);
    text("Opening: "+ packData.getString("name"), width/2, height/9);
    textSize(32);
    if (holo[8]=="rev") {
      pushMatrix();
      fill(0, 255, 0);
      translate((4*width/6)-(width/9)/2-11, (2*height/3)-(height/3.5)/2-11);
      rect(0, 0, 180, 280, 5);
      popMatrix();
    }
    if (holo[9]=="reg") {
      pushMatrix();
      fill(255, 0, 0);
      translate((5*width/6)-(width/9)/2-11, (2*height/3)-(height/3.5)/2-11);
      rect(0, 0, 180, 280, 5);
      popMatrix();
    }

    imageMode(CENTER);
    image(card, width/6, height/3, width/9, height/3.5);
    image(card1, 2*width/6, height/3, width/9, height/3.5);
    image(card2, 3*width/6, height/3, width/9, height/3.5);
    image(card3, 4*width/6, height/3, width/9, height/3.5);
    image(card4, 5*width/6, height/3, width/9, height/3.5);
    image(card5, width/6, 2*height/3, width/9, height/3.5);
    image(card6, 2*width/6, 2*height/3, width/9, height/3.5);
    image(card7, 3*width/6, 2*height/3, width/9, height/3.5);
    image(card8, 4*width/6, 2*height/3, width/9, height/3.5);
    image(card9, 5*width/6, 2*height/3, width/9, height/3.5);
    imageMode(CORNER);
    checkRares();
  }
}

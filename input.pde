void keyPressed() {
  if (key == '1') {
    packType="rs";
    packData = list.getJSONObject("rs");
    json = loadJSONObject("rs.json");
    art1 = loadImage("images/" + packType+"/art1.jpg");
    art2 = loadImage("images/" + packType+"/art2.jpg");
    art3 = loadImage("images/" + packType+"/art3.jpg");
    art4 = loadImage("images/" + packType+"/art4.jpg");
  } else if (key == '2') {
    packType="ss";
    packData = list.getJSONObject("ss");
    json = loadJSONObject("ss.json");
    art1 = loadImage("images/" + packType+"/art1.jpg");
    art2 = loadImage("images/" + packType+"/art2.jpg");
    art3 = loadImage("images/" + packType+"/art3.jpg");
    art4 = loadImage("images/" + packType+"/art4.jpg");
  }
  presses = 0;
  waiting = true;
  packOpen();
}

void mousePressed() {
  presses+=1;
}

void checkRares() {
  if (rare[8]==true) {
    image(back, (4*width/6)-(width/9)/2-20, (2*height/3)-(height/3.5)/2-20, width/9+40, height/3.5+40);
    if (presses > 1) {
      rare[8]=false;
    }
  }
  if (rare[9]==true) {
    fill(255);
    text("Click to Flip Rares", width/2, height/9*8);
    image(back, (5*width/6)-(width/9)/2-20, (2*height/3)-(height/3.5)/2-20, width/9+40, height/3.5+40);
    if (wastrue==true) {
      if (presses > 2) {
        rare[9] = false;
        presses = 0;
        wastrue = false;
      }
    } else {
      if (presses > 1) {
        rare[9]=false;
        presses = 0;
        wastrue = false;
      }
    }
  } else {
    fill(255);
    text("Press a Key for a New Pack", width/2, height/9*8);
  }
}

void checkWaiting() {
  if (presses > 0) {
    waiting = false;
  }
}
//Created by Ethan Trott
JSONObject json;
IntList ints;

boolean waiting = true;

int packArt = int(random(1,5));

int [] num = new int[10];
String [] name = new String[10];
int [] id = new int[10];
String [] holo = new String[10];
boolean [] rare = new boolean[10];

boolean wastrue = false;

PImage card;
PImage card1;
PImage card2;
PImage card3;
PImage card4;
PImage card5;
PImage card6;
PImage card7;
PImage card8;
PImage card9;

PImage art1;
PImage art2;
PImage art3;
PImage art4;

PImage back;

int presses = 0;

void setup() {
  fullScreen();
  json = loadJSONObject("rs.json");
  ints = new IntList();
  art1 = loadImage("images/art1.jpg");
  art2 = loadImage("images/art2.jpg");
  art3 = loadImage("images/art3.jpg");
  art4 = loadImage("images/art4.jpg");
  back = loadImage("images/back.jpg");
  textAlign(CENTER, CENTER);
  textSize(32);
  println("Ready");
  packOpen();
}

void draw(){
  background(#233076);
  fill(255);
  textSize(54);
  text("Pokémon Pack Generator",  width/2, height/9);
  textSize(32);
  imageMode(CENTER);
  if (waiting == true){
    if (packArt == 1){
      image(art1, width/2, height/2, 327, 600);
    }else if (packArt == 2){
      image(art2, width/2, height/2, 327, 600);
    }else if (packArt == 3){
      image(art3, width/2, height/2, 327, 600);
    }else if (packArt == 4){
      image(art4, width/2, height/2, 327, 600);
    }
    
    if (presses > 0){
        waiting = false;
    }   
    fill(255);
    text("Click to Open Roaring Skies",  width/2, height/9*8);
  }else{
    fill(0,255,0);
    rect((4*width/6)-(width/9)/2-20,(2*height/3)-(height/3.5)/2-20,width/9+40, height/3.5+40);
    if (holo[9]=="reg"){
      fill(255,0,0);
      rect((5*width/6)-(width/9)/2-20,(2*height/3)-(height/3.5)/2-20,width/9+40, height/3.5+40);
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
      if (rare[8]==true){
        image(back,(4*width/6)-(width/9)/2-20,(2*height/3)-(height/3.5)/2-20,width/9+40, height/3.5+40);
        if (presses > 1){
          rare[8]=false;
        }
      }
      if (rare[9]==true){
        fill(255);
        text("Click to Flip Rares",  width/2, height/9*8);
        image(back,(5*width/6)-(width/9)/2-20,(2*height/3)-(height/3.5)/2-20,width/9+40, height/3.5+40);
        if (wastrue==true){
          if (presses > 2){
              rare[9] = false;
              presses = 0;
              wastrue = false;
          }
        }else{
          if (presses > 1){
            rare[9]=false;
            presses = 0;
            wastrue = false;
          }
        }
      }else{
        fill(255);
        text("Press a Key for a New Pack",  width/2, height/9*8);
      }
    }
  }

void keyPressed(){
    presses = 0;
    waiting = true;
    packOpen();
}

void mousePressed(){
  presses+=1;
}

void packOpen(){

  packArt = int(random(1,5));
  
  println("----------");
  randShuffle();
  for (int i=0; i<10; i++){
    num[1] = ints.get(21);
    num[2] = ints.get(3);
    num[3] = ints.get(4);
    num[4] = ints.get(5);
    num[5] = ints.get(6);
    num[6] = ints.get(7);
    num[7] = ints.get(8);
    num[0] = ints.get(9);
    if (i<8){
      JSONObject rarity = json.getJSONObject("first");
      
      JSONObject card = rarity.getJSONObject(str(num[i]));
      name[i] = card.getString("name");
      id[i] = card.getInt("id");
      println(id[i]+", "+ name[i]);
    }else if (i == 8){
      rare[i]=false;
      float test = random(0,101);
      if (test > 66){
        JSONObject rarity = json.getJSONObject("second");
        num[i] = int(random(1,29));
        rare[i] = true;
        wastrue = true;
        JSONObject card = rarity.getJSONObject(str(num[i]));
        name[i] = card.getString("name");
        id[i] = card.getInt("id");
        holo[i]="rev";
        println(id[i]+", "+ name[i]);
      }else{
        JSONObject rarity = json.getJSONObject("first");
        num[i] = int(random(1,59));
        JSONObject card = rarity.getJSONObject(str(num[i]));
        name[i] = card.getString("name");
        id[i] = card.getInt("id");
        holo[i]="rev";
        println(id[i]+", "+ name[i]);
      }
    }else if (i == 9){
      holo[i]="none";
      float test = random(0,101);
      if (test > 90){
        if (test > 99){
          JSONObject rarity = json.getJSONObject("fourth");
          num[i] = int(random(1,3));
          JSONObject card = rarity.getJSONObject(str(num[i]));
          name[i] = card.getString("name");
          id[i] = card.getInt("id");
          rare[i]=true;
          println(id[i]+", "+ name[i]);
        }else{
          JSONObject rarity = json.getJSONObject("third");
          num[i] = int(random(1,23));
          JSONObject card = rarity.getJSONObject(str(num[i]));
          name[i] = card.getString("name");
          id[i] = card.getInt("id");
          rare[i]=true;
          println(id[i]+", "+ name[i]);
        }
      }else{
        JSONObject rarity = json.getJSONObject("second");
        num[i] = int(random(1,23));
        JSONObject card = rarity.getJSONObject(str(num[i]));
        name[i] = card.getString("name");
        id[i] = card.getInt("id");
        if (card.getInt("rart")>2){
          holo[i]="reg";
        }
        rare[i]=true;
        println(id[i]+", "+ name[i]);
      }
    }
  }
  card = loadImage("images/" + id[0] + ".jpg");
  card1 = loadImage("images/" + id[1] + ".jpg");
  card2 = loadImage("images/" + id[2] + ".jpg");
  card3 = loadImage("images/" + id[3] + ".jpg");
  card4 = loadImage("images/" + id[4] + ".jpg");
  card5 = loadImage("images/" + id[5] + ".jpg");
  card6 = loadImage("images/" + id[6] + ".jpg");
  card7 = loadImage("images/" + id[7] + ".jpg");
  card8 = loadImage("images/" + id[8] + ".jpg");
  card9 = loadImage("images/" + id[9] + ".jpg");
}

void randShuffle(){
  for (int j=1; j<59; j++){
    ints.append(j);
  }
  ints.shuffle();
}
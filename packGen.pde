void packOpen() {

  packArt = int(random(1, 5));

  println("----------");
  randShuffle();
  for (int i=0; i<10; i++) {
    num[1] = ints.get(21);
    num[2] = ints.get(3);
    num[3] = ints.get(4);
    num[4] = ints.get(5);
    num[5] = ints.get(6);
    num[6] = ints.get(7);
    num[7] = ints.get(8);
    num[0] = ints.get(9);
    if (i<8) {
      JSONObject rarity = json.getJSONObject("first");
      JSONObject card = rarity.getJSONObject(str(num[i]));
      name[i] = card.getString("name");
      id[i] = card.getInt("id");
      println(id[i]+", "+ name[i]);
    } else if (i == 8) {
      rare[i]=false;
      float test = random(0, 101);
      if (test > 66) {
        if (packData.getBoolean("break") == true) {
          if (test > 94) {
            JSONObject rarity = json.getJSONObject("break");
            num[i] = int(random(1, (packData.getInt("amountB")+1)));
            rare[i] = true;
            wastrue = true;
            JSONObject card = rarity.getJSONObject(str(num[i]));
            name[i] = card.getString("name");
            id[i] = card.getInt("id");
            holo[i]="none";
            println(id[i]+", "+ name[i]);
          } else {
            JSONObject rarity = json.getJSONObject("second");
            num[i] = int(random(1, (packData.getInt("amount2")+1)));
            rare[i] = true;
            wastrue = true;
            JSONObject card = rarity.getJSONObject(str(num[i]));
            name[i] = card.getString("name");
            id[i] = card.getInt("id");
            holo[i]="rev";
            println(id[i]+", "+ name[i]);
          }
        } else {
          JSONObject rarity = json.getJSONObject("second");
          num[i] = int(random(1, (packData.getInt("amount2")+1)));
          rare[i] = true;
          wastrue = true;
          JSONObject card = rarity.getJSONObject(str(num[i]));
          name[i] = card.getString("name");
          id[i] = card.getInt("id");
          holo[i]="rev";
          println(id[i]+", "+ name[i]);
        }
      } else {
        JSONObject rarity = json.getJSONObject("first");
        num[i] = int(random(1, (packData.getInt("amount1")+1)));
        JSONObject card = rarity.getJSONObject(str(num[i]));
        name[i] = card.getString("name");
        id[i] = card.getInt("id");
        holo[i]="rev";
        println(id[i]+", "+ name[i]);
      }
    } else if (i == 9) {
      holo[i]="none";
      float test = random(0, 101);
      if (test > 90) {
        if (test > 100) {
          JSONObject rarity = json.getJSONObject("fourth");
          num[i] = int(random(1, (packData.getInt("amount4")+1)));
          JSONObject card = rarity.getJSONObject(str(num[i]));
          name[i] = card.getString("name");
          id[i] = card.getInt("id");
          rare[i]=true;
          println(id[i]+", "+ name[i]);
        } else {
          JSONObject rarity = json.getJSONObject("third");
          num[i] = int(random(1, (packData.getInt("amount3")+1)));
          JSONObject card = rarity.getJSONObject(str(num[i]));
          name[i] = card.getString("name");
          id[i] = card.getInt("id");
          rare[i]=true;
          println(id[i]+", "+ name[i]);
        }
      } else {
        JSONObject rarity = json.getJSONObject("second");
        num[i] = int(random(1, (packData.getInt("amount3")+1)));
        JSONObject card = rarity.getJSONObject(str(num[i]));
        name[i] = card.getString("name");
        id[i] = card.getInt("id");
        if (card.getInt("rart")>2) {
          holo[i]="reg";
        }
        rare[i]=true;
        println(id[i]+", "+ name[i]);
      }
    }
  }
  card = loadImage("images/" + packType+"/" + id[0] + ".jpg");
  card1 = loadImage("images/" + packType+"/" + id[1] + ".jpg");
  card2 = loadImage("images/" + packType+"/" + id[2] + ".jpg");
  card3 = loadImage("images/" + packType+"/" + id[3] + ".jpg");
  card4 = loadImage("images/" + packType+"/" + id[4] + ".jpg");
  card5 = loadImage("images/" + packType+"/" + id[5] + ".jpg");
  card6 = loadImage("images/" + packType+"/" + id[6] + ".jpg");
  card7 = loadImage("images/" + packType+"/" + id[7] + ".jpg");
  card8 = loadImage("images/" + packType+"/" + id[8] + ".jpg");
  card9 = loadImage("images/" + packType+"/" + id[9] + ".jpg");
}

void randShuffle() {
  for (int j=1; j<(packData.getInt("amount1")+1); j++) {
    ints.append(j);
  }
  ints.shuffle();
}
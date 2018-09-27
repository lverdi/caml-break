open Types
open Items


let init_player : character = {
  id = "player";
  trades = [];
  hasChanged = false;
  x = 33;
  y = 1;
  inv = [empty_item;empty_item;empty_item;empty_item;{id= "start"; item_type= None; x=0; y=0};];
  oriented = West;
  step = 0;
}

let officer : character = {
  id = "officer1";
  trades = [ { speech="Hmm... thanks for that... Here's a little something. Now scram.";
                required={id= "start_coins"; item_type= Coin; x=0; y=0};
                offered={id= "axe"; item_type= Axe; x=0; y=0}; };
              { speech="Keep it moving, Inmate #3110...";
                required={id= "FINAL"; item_type= None; x=0; y=0};
                offered={id= "Nothing"; item_type= None; x=0; y=0}; }
            ];
  hasChanged = false;
  x = 20;
  y = 12;
  inv = [{id= "axe"; item_type= Axe; x=0; y=0}; empty_item; empty_item; empty_item; empty_item];
  oriented = South;
  step = 0;
}

let officer2 : character = {
  id = "officer2";
  trades = [
             { speech="Have a great day, Officer Foster!";
               required={id= "FINAL"; item_type= None; x=0; y=0};
               offered={id= "Nothing"; item_type= None; x=0; y=0}; }
           ];
  hasChanged = false;
  x = 34;
  y = 18;
  inv = [{id= "Nothing"; item_type= None; x=0; y=0}; empty_item; empty_item; empty_item; empty_item];
  oriented = West;
  step = 0;
}


let prisoner1 : character = {
  id = "prisoner1";
  trades = [ { speech="Ugh... I am so hungry...";
                required={id= "apple"; item_type= Apple; x=0; y=0};
                offered={id= "skull"; item_type= Skull; x=0; y=0}; };
             { speech="Thanks bro. I found this skull, you want it?";
               required={id= "nothing"; item_type= None; x=0; y=0};
               offered={id= "nothing"; item_type= None; x=0; y=0}; }
            ];
  hasChanged = false;
  x = 16;
  y = 2;
  inv = [{id= "skull"; item_type= Skull; x=0; y=0};empty_item; empty_item; empty_item; empty_item];
  oriented = North;
  step = 0;
}

let roomie : character = {
  id = "roomie";
  trades = [ { speech="Hey roomie, looks like you're new around these parts. I hear you're trying to bust outta here.";
                required= {id= "start"; item_type= None; x=0; y=0};
                offered={id= "start"; item_type= None; x=0; y=0}; };
              { speech="Try walking around and see who might be able to help out. Here's a coin. Might come in handy one day.";
                required= {id= "start"; item_type= None; x=0; y=0};
                offered={id= "start_coins"; item_type= Coin; x=0; y=0}; };
              { speech="Be careful out there..";
                required={id= "FINAL"; item_type= None; x=0; y=0};
                offered={id= "Nothing"; item_type= None; x=0; y=0}; }
            ];
  hasChanged = false;
  x = 29;
  y = 1;
  inv = [{id= "start"; item_type= None; x=0; y=0}; {id= "start_coins"; item_type= Coin; x=0; y=0}; empty_item; empty_item; empty_item];
  oriented = East;
  step = 0;
}

let prisoner2 : character = {
  id = "prisoner2";
  trades = [ { speech="Man, this toilet has been clogged up for days... Sounds like something is stuck in there.";
               required={id= "nothing"; item_type= None; x=0; y=0};
               offered={id= "nothing"; item_type= None; x=0; y=0}; }
           ];
  hasChanged = false;
  x = 8;
  y = 1;
  inv = [{id= "nothing"; item_type= None; x=0; y=0}; empty_item; empty_item; empty_item; empty_item];
  oriented = West;
  step = 0;
}

let prisoner3 : character = {
  id = "prisoner3";
  trades = [ { speech="Psst.. Hey kid.. I have something you might like. Bring me a knife and I'll slide it over.";
               required={id= "knife"; item_type= Knife; x=0; y=0};
               offered={id= "hammer"; item_type= Hammer; x=0; y=0}; };

             { speech="Thanks. Take this see what you can knock down around here.";
                          required={id= "nothing"; item_type= Knife; x=0; y=0};
                          offered={id= "nothing"; item_type= Hammer; x=0; y=0}; }
           ];
  hasChanged = false;
  x = 19;
  y = 8;
  inv = [{id= "hammer"; item_type= Hammer; x=0; y=0}; empty_item; empty_item; empty_item; empty_item];
  oriented = West;
  step = 0;
}

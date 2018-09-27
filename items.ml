open Types

let empty_item : item = {
  id = "";
  item_type = None;
  x = 0;
  y = 0;
}

let items_list : item list = [
  {id= "book"; item_type= Book; x=2; y=8};
  {id= "apple"; item_type= Apple; x=3; y=14};
  {id= "knife"; item_type= Knife; x=10; y=2};
  {id= "cup"; item_type= Cup; x=2; y=17};
  {id= "clover"; item_type= Clover; x=18; y=11};
  {id= "caml"; item_type= Caml; x=33; y=8};
]

let door_list : door list = [
  {id="door1"; required_objects= {id= "key"; item_type= Key; x=0; y=0}; speech= "This door is locked"; x=30; y=9;};
  {id="door2"; required_objects= empty_item; speech=""; x=32; y=14;};
  {id="door3"; required_objects= {id= "caml"; item_type= Caml; x=0; y=0}; speech="Use a Camel to force through this door";x=13; y=19;};
  {id="door4"; required_objects= {id= "axe"; item_type= Axe; x=0; y=0}; speech= "Try breaking down this door";x=7; y=13;};
  {id="door5"; required_objects= {id= "clover"; item_type= Clover; x=0; y=0}; speech= "Use a four leaf Clover to open this door"; x=4; y=10;};
  {id="door6"; required_objects= {id= "start_coins"; item_type= Coin; x=0; y=0}; speech= "Talk to your cellmate."; x=29; y=4;};
]

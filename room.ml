open Types
open Gui

let jail =
  [
    (* grass *)

    { location = ( 16., 7.); obj_type = Grass };
    { location = ( 17., 7.); obj_type = Grass };
    { location = ( 18., 7.); obj_type = Grass };
    { location = ( 19., 7.); obj_type = Grass };
    { location = ( 20., 7.); obj_type = Grass };

    { location = ( 14.,  8.); obj_type = Grass };
    { location = ( 15.,  8.); obj_type = Grass };
    { location = ( 16.,  8.); obj_type = Grass };
    { location = ( 17.,  8.); obj_type = Grass };
    { location = ( 18.,  8.); obj_type = Grass };
    { location = ( 19.,  8.); obj_type = GrassUnwalkable };
    { location = ( 19.,  8.); obj_type = PrisonerSouth };
    { location = ( 20.,  8.); obj_type = Grass };
    { location = ( 21.,  8.); obj_type = Grass };
    { location = ( 22.,  8.); obj_type = Grass };

    { location = ( 14.,  9.); obj_type = Grass };
    { location = ( 15.,  9.); obj_type = Grass };
    { location = ( 16.,  9.); obj_type = Grass };
    { location = ( 17.,  9.); obj_type = Grass };
    { location = ( 18.,  9.); obj_type = Grass };
    { location = ( 19.,  9.); obj_type = Grass };
    { location = ( 20.,  9.); obj_type = Grass };
    { location = ( 21.,  9.); obj_type = Grass };
    { location = ( 22.,  9.); obj_type = Grass };

    { location = ( 13.,  10.); obj_type = Grass };
    { location = ( 14.,  10.); obj_type = Grass };
    { location = ( 15.,  10.); obj_type = Grass };
    { location = ( 16.,  10.); obj_type = Grass };
    { location = ( 17.,  10.); obj_type = Grass };
    { location = ( 18.,  10.); obj_type = Grass };
    { location = ( 19.,  10.); obj_type = Grass };
    { location = ( 20.,  10.); obj_type = Grass };
    { location = ( 21.,  10.); obj_type = Grass };
    { location = ( 22.,  10.); obj_type = Grass };
    { location = ( 23.,  10.); obj_type = Grass };

    { location = ( 13.,  11.); obj_type = Grass };
    { location = ( 14.,  11.); obj_type = Grass };
    { location = ( 15.,  11.); obj_type = Grass };

    { location = ( 17.,  11.); obj_type = Grass };
    { location = ( 18.,  11.); obj_type = Grass };
    { location = ( 19.,  11.); obj_type = Grass };
    { location = ( 20.,  11.); obj_type = Grass };
    { location = ( 21.,  11.); obj_type = Grass };
    { location = ( 22.,  11.); obj_type = Grass };
    { location = ( 23.,  11.); obj_type = Grass };

    { location = ( 13.,  12.); obj_type = Grass };
    { location = ( 14.,  12.); obj_type = Grass };
    { location = ( 15.,  12.); obj_type = Grass };
    { location = ( 16.,  12.); obj_type = Grass };
    { location = ( 17.,  12.); obj_type = Grass };
    { location = ( 18.,  12.); obj_type = Grass };
    { location = ( 19.,  12.); obj_type = Grass };
    { location = ( 20.,  12.); obj_type = GrassUnwalkable };
    { location = ( 20.,  12.); obj_type = OfficerSouth };
    { location = ( 21.,  12.); obj_type = Grass };
    { location = ( 22.,  12.); obj_type = Grass };
    { location = ( 23.,  12.); obj_type = Grass };

    { location = ( 14.,  13.); obj_type = Grass };
    { location = ( 15.,  13.); obj_type = Grass };
    { location = ( 16.,  13.); obj_type = Grass };
    { location = ( 17.,  13.); obj_type = Grass };
    { location = ( 18.,  13.); obj_type = Grass };
    { location = ( 19.,  13.); obj_type = Grass };
    { location = ( 20.,  13.); obj_type = Grass };
    { location = ( 21.,  13.); obj_type = Grass };
    { location = ( 22.,  13.); obj_type = Grass };

    { location = ( 14.,  14.); obj_type = Grass };
    { location = ( 15.,  14.); obj_type = Grass };
    { location = ( 16.,  14.); obj_type = Grass };
    { location = ( 17.,  14.); obj_type = Grass };
    { location = ( 18.,  14.); obj_type = Grass };
    { location = ( 19.,  14.); obj_type = Grass };
    { location = ( 20.,  14.); obj_type = Grass };
    { location = ( 21.,  14.); obj_type = Grass };
    { location = ( 22.,  14.); obj_type = Grass };

    { location = ( 16., 15.); obj_type = Grass };
    { location = ( 17., 15.); obj_type = Grass };
    { location = ( 18., 15.); obj_type = Grass };
    { location = ( 19., 15.); obj_type = Grass };
    { location = ( 20., 15.); obj_type = Grass };

    { location = ( 16.,  11.); obj_type = GrassUnwalkable };
    { location = ( 16.,  11.); obj_type = TreasureChest};


    (* top wall*)
    { location = ( 0., 0.); obj_type = Wall };
    { location = ( 1., 0.); obj_type = Wall };
    { location = ( 2., 0.); obj_type = Wall };
    { location = ( 3., 0.); obj_type = Wall };
    { location = ( 4., 0.); obj_type = Wall };
    { location = ( 5., 0.); obj_type = Wall };
    { location = ( 6., 0.); obj_type = Wall };
    { location = ( 7., 0.); obj_type = Wall };
    { location = ( 8., 0.); obj_type = Wall };
    { location = ( 9., 0.); obj_type = Wall };
    { location = ( 10., 0.); obj_type = Wall };
    { location = ( 11., 0.); obj_type = Wall };
    { location = ( 12., 0.); obj_type = Wall };
    { location = ( 13., 0.); obj_type = Wall };
    { location = ( 14., 0.); obj_type = Wall };
    { location = ( 15., 0.); obj_type = Wall };
    { location = ( 16., 0.); obj_type = Wall };
    { location = ( 17., 0.); obj_type = Wall };
    { location = ( 18., 0.); obj_type = Wall };
    { location = ( 19., 0.); obj_type = Wall };
    { location = ( 20., 0.); obj_type = Wall };
    { location = ( 21., 0.); obj_type = Wall };
    { location = ( 22., 0.); obj_type = Wall };
    { location = ( 23., 0.); obj_type = Wall };
    { location = ( 24., 0.); obj_type = Wall };
    { location = ( 25., 0.); obj_type = Wall };
    { location = ( 26., 0.); obj_type = Wall };
    { location = ( 27., 0.); obj_type = Wall };
    { location = ( 28., 0.); obj_type = Wall };
    { location = ( 29., 0.); obj_type = Wall };
    { location = ( 30., 0.); obj_type = Wall };
    { location = ( 31., 0.); obj_type = Wall };
    { location = ( 32., 0.); obj_type = Wall };
    { location = ( 33., 0.); obj_type = Wall };
    { location = ( 34., 0.); obj_type = Wall };
    { location = ( 35., 0.); obj_type = Wall };






    (*left wall*)
    { location = (0.,  1.); obj_type = Wall };
    { location = (0.,  2.); obj_type = Wall };
    { location = (0.,  3.); obj_type = Wall };
    { location = (0.,  4.); obj_type = Wall };
    { location = (0.,  5.); obj_type = Wall };
    { location = (0.,  6.); obj_type = Wall };
    { location = (0.,  7.); obj_type = Wall };
    { location = (0.,  8.); obj_type = Wall };
    { location = (0.,  9.); obj_type = Wall };
    { location = (0.,  10.); obj_type = Wall };
    { location = (0.,  11.); obj_type = Wall };
    { location = (0.,  12.); obj_type = Wall };
    { location = (0.,  13.); obj_type = Wall };
    { location = (0.,  14.); obj_type = Wall };
    { location = (0.,  15.); obj_type = Wall };
    { location = (0.,  16.); obj_type = Wall };
    { location = (0.,  17.); obj_type = Wall };
    { location = (0.,  18.); obj_type = Wall };
    { location = (0.,  19.); obj_type = Wall };
    { location = (0.,  20.); obj_type = Wall };
    { location = (0.,  21.); obj_type = Wall };
    { location = (0.,  22.); obj_type = Wall };
    { location = (0.,  23.); obj_type = Wall };
    { location = (0.,  24.); obj_type = Wall };
    { location = (0.,  25.); obj_type = Wall };
    { location = (0.,  26.); obj_type = Wall };
    { location = (0.,  27.); obj_type = Wall };
    { location = (0.,  28.); obj_type = Wall };
    { location = (0.,  29.); obj_type = Wall };
    { location = (0.,  30.); obj_type = Wall };
    { location = (0.,  31.); obj_type = Wall };
    { location = (0.,  32.); obj_type = Wall };
    { location = (0.,  33.); obj_type = Wall };


    (* right wall *)
    { location = ( 35.,  1.); obj_type = Wall };
    { location = ( 35.,  2.); obj_type = Wall };
    { location = ( 35.,  3.); obj_type = Wall };
    { location = ( 35.,  4.); obj_type = Wall };
    { location = ( 35.,  5.); obj_type = Wall };
    { location = ( 35.,  6.); obj_type = Wall };
    { location = ( 35.,  7.); obj_type = Wall };
    { location = ( 35.,  8.); obj_type = Wall };
    { location = ( 35.,  9.); obj_type = Wall };
    { location = ( 35.,  10.); obj_type = Wall };
    { location = ( 35.,  11.); obj_type = Wall };
    { location = ( 35.,  12.); obj_type = Wall };
    { location = ( 35.,  13.); obj_type = Wall };
    { location = ( 35.,  14.); obj_type = Wall };
    { location = ( 35.,  15.); obj_type = Wall };
    { location = ( 35.,  16.); obj_type = Wall };
    { location = ( 35.,  17.); obj_type = Wall };
    { location = ( 35.,  18.); obj_type = Wall };
    { location = ( 35.,  19.); obj_type = Wall };


    (* bottom wall*)
    { location = ( 1.,  19.); obj_type = Wall };
    { location = ( 2.,  19.); obj_type = Wall };
    { location = ( 3.,  19.); obj_type = Wall };
    { location = ( 4.,  19.); obj_type = Wall };
    { location = ( 5.,  19.); obj_type = Wall };
    { location = ( 6.,  19.); obj_type = Wall };
    { location = ( 7.,  19.); obj_type = Wall };
    { location = ( 8.,  19.); obj_type = Wall };
    { location = ( 9.,  19.); obj_type = Wall };
    { location = ( 10.,  19.); obj_type = Wall };
    { location = ( 11.,  19.); obj_type = Wall };
    { location = ( 12.,  19.); obj_type = Wall };
    { location = ( 13.,  19.); obj_type = Door };
    { location = ( 14.,  19.); obj_type = Wall };
    { location = ( 15.,  19.); obj_type = Wall };
    { location = ( 16.,  19.); obj_type = Wall };
    { location = ( 17.,  19.); obj_type = Wall };
    { location = ( 18.,  19.); obj_type = Wall };
    { location = ( 19.,  19.); obj_type = Wall };
    { location = ( 20.,  19.); obj_type = Wall };
    { location = ( 21.,  19.); obj_type = Wall };
    { location = ( 22.,  19.); obj_type = Wall };
    { location = ( 23.,  19.); obj_type = Wall };
    { location = ( 24.,  19.); obj_type = Wall };
    { location = ( 25.,  19.); obj_type = Wall };
    { location = ( 26.,  19.); obj_type = Wall };
    { location = ( 27.,  19.); obj_type = Wall };
    { location = ( 28.,  19.); obj_type = Wall };
    { location = ( 29.,  19.); obj_type = Wall };
    { location = ( 30.,  19.); obj_type = Wall };
    { location = ( 31.,  19.); obj_type = Wall };
    { location = ( 32.,  19.); obj_type = Wall };
    { location = ( 33.,  19.); obj_type = Wall };
    { location = ( 34.,  19.); obj_type = Wall };
    { location = ( 35.,  19.); obj_type = Wall };

    (* room 1 *)
    { location = ( 0.,  4.); obj_type = Wall };
    { location = ( 1.,  4.); obj_type = Wall };
    { location = ( 2.,  4.); obj_type = Wall };

    { location = ( 1.,  1.); obj_type = Bed };
    { location = ( 5.,  1.); obj_type = Toilet };
    (* { location = ( 3.,  4.); obj_type = Door }; *)

    { location = ( 4.,  4.); obj_type = Wall };
    { location = ( 5.,  4.); obj_type = Wall };
    { location = ( 6.,  4.); obj_type = Wall };

    { location = ( 6.,  1.); obj_type = Wall };
    { location = ( 6.,  2.); obj_type = Wall };
    { location = ( 6.,  3.); obj_type = Wall };

    (* room 2 *)
    { location = ( 7.,  4.); obj_type = Wall };
    { location = ( 8.,  4.); obj_type = Wall };
    { location = ( 9.,  4.); obj_type = Wall };

    { location = ( 7.,  1.); obj_type = Bed };
    { location = ( 8., 1.); obj_type  = PrisonerWest};
    { location = ( 12., 1.); obj_type = Toilet };
    (* { location = ( 10.,  4.); obj_type = Door }; *)

    { location = ( 11.,  4.); obj_type = Wall };
    { location = ( 12.,  4.); obj_type = Wall };
    { location = ( 13.,  4.); obj_type = Wall };

    { location = ( 13.,  1.); obj_type = Wall };
    { location = ( 13.,  2.); obj_type = Wall };
    { location = ( 13.,  3.); obj_type = Wall };


    (* room 3 *)
    { location = ( 14.,  4.); obj_type = Wall };
    { location = ( 15.,  4.); obj_type = Wall };
    { location = ( 16.,  4.); obj_type = Wall };

    { location = ( 14.,  1.); obj_type = Bed };
    { location = ( 16.,  2.); obj_type = PrisonerNorth };
    { location = ( 19.,  1.); obj_type = Toilet };
    (* { location = ( 17.,  4.); obj_type = Door }; *)

    { location = ( 18.,  4.); obj_type = Wall };
    { location = ( 19.,  4.); obj_type = Wall };
    { location = ( 20.,  4.); obj_type = Wall };

    { location = ( 20.,  1.); obj_type = Wall };
    { location = ( 20.,  2.); obj_type = Wall };
    { location = ( 20.,  3.); obj_type = Wall };

    (* room 4 *)
    { location = ( 21.,  4.); obj_type = Wall };
    { location = ( 22.,  4.); obj_type = Wall };
    { location = ( 23.,  4.); obj_type = Wall };

    { location = ( 21.,  1.); obj_type = Bed };
    { location = ( 26.,  1.); obj_type = Toilet };
    (* { location = ( 24.,  4.); obj_type = Door }; *)

    { location = ( 25.,  4.); obj_type = Wall };
    { location = ( 26.,  4.); obj_type = Wall };
    { location = ( 27.,  4.); obj_type = Wall };

    { location = ( 27.,  1.); obj_type = Wall };
    { location = ( 27.,  2.); obj_type = Wall };
    { location = ( 27.,  3.); obj_type = Wall };

    (* room 5 *)
    { location = ( 28.,  4.); obj_type = Wall };
    { location = ( 28.,  1.); obj_type = Bed };
    { location = ( 29.,  1.); obj_type = PrisonerEast };
    { location = ( 34.,  1.); obj_type = Bed };
    { location = ( 29.,  4.); obj_type = Door };


    { location = ( 30.,  4.); obj_type = Wall };
    { location = ( 31.,  4.); obj_type = Wall };
    { location = ( 32.,  4.); obj_type = Wall };
    { location = ( 33.,  4.); obj_type = Wall };
    { location = ( 34.,  4.); obj_type = Wall };

    (* room 6 *)

    { location = ( 1.,  7.); obj_type = Wall };
    { location = ( 2.,  7.); obj_type = Wall };
    { location = ( 3.,  7.); obj_type = Wall };
    { location = ( 4.,  7.); obj_type = Wall };

    { location = ( 4.,  8.); obj_type = Wall };
    { location = ( 4.,  9.); obj_type = Wall };
    { location = ( 4.,  10.); obj_type = DoorLeft };
    { location = ( 4.,  11.); obj_type = Wall };
    { location = ( 4.,  12.); obj_type = Wall };

    { location = ( 1.,  13.); obj_type = Wall };
    { location = ( 2.,  13.); obj_type = Wall };
    { location = ( 3.,  13.); obj_type = Wall };
    { location = ( 4.,  13.); obj_type = Wall };
    { location = ( 5.,  13.); obj_type = Wall };
    { location = ( 6.,  13.); obj_type = Wall };

    (* room 7 *)
    { location = ( 7.,  13.); obj_type = Door };
    { location = ( 8.,  13.); obj_type = Wall };
    { location = ( 9.,  13.); obj_type = Wall };

    { location = ( 9.,  14.); obj_type = Wall };
    { location = ( 9.,  15.); obj_type = Wall };
    { location = ( 9.,  16.); obj_type = Wall };
    { location = ( 9.,  17.); obj_type = Wall };
    { location = ( 9.,  18.); obj_type = Wall };

    (* room 8 *)
    { location = ( 30.,  7.); obj_type = Wall };
    { location = ( 31.,  7.); obj_type = Wall };
    { location = ( 32.,  7.); obj_type = Wall };
    { location = ( 33.,  7.); obj_type = Wall };
    { location = ( 34.,  7.); obj_type = Wall };

    { location = ( 30.,  8.); obj_type = Wall };
    { location = ( 30.,  9.); obj_type = DoorRight };
    { location = ( 30.,  10.); obj_type = Wall };
    { location = ( 30.,  11.); obj_type = Wall };

    { location = ( 30.,  12.); obj_type = Wall };



    (* corner 1 *)
    { location = ( 13.,  7.); obj_type = Wall };
    { location = ( 14.,  7.); obj_type = Wall };
    { location = ( 15.,  7.); obj_type = Wall };

    { location = ( 13.,  8.); obj_type = Wall };
    { location = ( 13.,  9.); obj_type = Wall };


    (* corner 2 *)
    { location = ( 13.,  13.); obj_type = Wall };
    { location = ( 13.,  14.); obj_type = Wall };

    { location = ( 13.,  15.); obj_type = Wall };
    { location = ( 14.,  15.); obj_type = Wall };
    { location = ( 15.,  15.); obj_type = Wall };

    (* corner 3 *)
    { location = ( 21.,  7.); obj_type = Wall };
    { location = ( 22.,  7.); obj_type = Wall };
    { location = ( 23.,  7.); obj_type = Wall };

    { location = ( 23.,  8.); obj_type = Wall };
    { location = ( 23.,  9.); obj_type = Wall };

    (* corner 4 *)
    { location = ( 23.,  13.); obj_type = Wall };
    { location = ( 23.,  14.); obj_type = Wall };

    { location = ( 21.,  15.); obj_type = Wall };
    { location = ( 22.,  15.); obj_type = Wall };
    { location = ( 23.,  15.); obj_type = Wall };


    (* tunnel *)

    { location = ( 30.,  13.); obj_type = Wall };


    { location = ( 30.,  14.); obj_type = Wall };
    { location = ( 31.,  14.); obj_type = Wall };
    { location = ( 32.,  14.); obj_type = Door };
    { location = ( 33.,  14.); obj_type = Wall };
    { location = ( 34.,  14.); obj_type = Wall };
    { location = ( 30.,  15.); obj_type = Wall };
    { location = ( 31.,  15.); obj_type = Wall };
    { location = ( 33.,  15.); obj_type = Wall };
    { location = ( 34.,  15.); obj_type = Wall };
    { location = ( 30.,  16.); obj_type = Wall };
    { location = ( 31.,  16.); obj_type = Wall };
    { location = ( 33.,  16.); obj_type = Wall };
    { location = ( 34.,  16.); obj_type = Wall };
    { location = ( 30.,  17.); obj_type = Wall };
    { location = ( 31.,  17.); obj_type = Wall };
    { location = ( 33.,  17.); obj_type = Wall };
    { location = ( 34.,  17.); obj_type = Wall };

    { location = ( 29.,  17.); obj_type = Wall };
    { location = ( 28.,  17.); obj_type = Wall };
    { location = ( 27.,  17.); obj_type = Wall };
    { location = ( 26.,  17.); obj_type = Wall };
    { location = ( 25.,  17.); obj_type = Wall };
    { location = ( 24.,  17.); obj_type = Wall };
    { location = ( 23.,  17.); obj_type = Wall };
    { location = ( 22.,  17.); obj_type = Wall };
    { location = ( 21.,  17.); obj_type = Wall };
    { location = ( 20.,  17.); obj_type = Wall };
    { location = ( 19.,  17.); obj_type = Wall };
    { location = ( 18.,  17.); obj_type = Wall };
    { location = ( 17.,  17.); obj_type = Wall };
    { location = ( 16.,  17.); obj_type = Wall };
    { location = ( 15.,  17.); obj_type = Wall };
    { location = ( 14.,  17.); obj_type = Wall };
    { location = ( 13.,  17.); obj_type = Wall };
    { location = ( 12.,  17.); obj_type = Wall };
    { location = ( 12.,  18.); obj_type = Wall };

    { location = ( 2.,  14.); obj_type = Table };
    { location = ( 5.,  14.); obj_type = Table };


    { location = ( 2.,  17.); obj_type = Table };
    { location = ( 5.,  17.); obj_type = Table };


    { location = ( 1.25,  14.); obj_type = Bench };
    { location = ( 3.15,  14.); obj_type = Bench };
    { location = ( 4.25,  14.); obj_type = Bench };
    { location = ( 6.15,  14.); obj_type = Bench };

    { location = ( 1.25,  17.); obj_type = Bench };
    { location = ( 3.15,  17.); obj_type = Bench };
    { location = ( 4.25,  17.); obj_type = Bench };
    { location = ( 6.15,  17.); obj_type = Bench };

    { location = ( 34.,  18.); obj_type = OfficerWest};

  ]

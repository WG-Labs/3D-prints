hight=180;

module base() {
  difference() {
   cube ([100,100,5]);
   translate([10,10,0])       
    cube ([80,80,5]);
  };
  translate([10,10,5])
    cube ([80,80,5]);
}   

module wallDip(x, y, z) {        
  translate([x,y,z])
      cube([25,5,35]);
}


module window(x,y,z) {
  windownHight = 16;
  windownWith = 7;
  spaceing = 1;
    
  translate([x,y,z]) {
    translate([spaceing,0,1])
      cube([windownWith,6,windownHight]);
    translate([(windownWith+(spaceing*2)),0,1])
      cube([windownWith,6,windownHight]);
    translate([((windownWith*2)+(spaceing*3)),0,1])
      cube([windownWith,6,windownHight]);
  }
    
}

module wall() {
//    seulen
  cube([8,8,hight]);
//    seite
  translate([43,3,0])
    cube([4,3,hight]);


  difference() {
    translate([0,4,0])
      cube([90,4,hight]);
    wallDip(15,0,10);
    wallDip(50,0,10);
    wallDip(15,0,50);
    wallDip(50,0,50);
    wallDip(15,0,90);
    wallDip(50,0,90);
    wallDip(15,0,130);
    wallDip(50,0,130);
    window(15,0,130);
    window(15,0,147);
    window(50,0,130); 
    window(50,0,147);
  }

};

module door() {
//    cube([10,10,200]);
//    translate([80,0,0])
//        cube([10,10,hight]);
//    translate([0,3,0])
//        cube([80,2,hight]);
};


module tardisBody() {
  translate([5,5,0])
    wall();    
  translate([5,95,0])
    rotate([0,0,-90])
    wall();
  translate([95,5,0])
    rotate([0,0,90])
    wall();
  translate([95,95,0])
    rotate([0,0,180])
    difference() {
      wall();
    }
};

module roof() {

  module schild() {
    translate([-4,5,(hight-5)])
      cube([4,80,15]);
  }

  module balken() {
    translate([-1,0,(hight-5)])
      cube([8,8,15]);
    schild();
  };

  color( "blue", 5 ) {
  translate([5,5,0])
    balken();    
  translate([5,95,0])
    rotate([0,0,-90])
    balken();
  translate([95,5,0])
    rotate([0,0,90])
    balken();
  translate([95,95,0])
    rotate([0,0,180])
    balken();

  translate([5,5,(hight + 5)])
    cube([90,90,5]);

  translate([10,10,(hight + 5)])
    cube([80,80,15]);

  }
  color("Red", 1) {
    translate([50,50,(hight+20)]){
      polyhedron(
        points=[ [40,40,0],[40,-40,0],[-40,-40,0],[-40,40,0], // the four points at base
                 [0,0,10]  ],                                 // the apex point 
        faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
                    [1,0,3],[2,1,3] ]                         // two triangles for square base
       );
    };
  };

  translate([50,50,(hight + 5)]){ 
    cylinder(30,5,5, $fn=50);
  }
  translate([50,50,(hight+35)]){ 
    cylinder(5,6,0, $fn=50);
  }
  // translate([50,50,(hight+40)]){ 
  //   cylinder(6,0.5,0.5, $fn=50);
  // }

};

// base();
// color("Red", 1) {

//   difference() {
//     tardisBody();
//     roof();
//     translate([5,5,(hight - 5)]){
//       cube(size=[8,8,hight], center=false);
//     }
//     translate([5,87,(hight - 5)]){
//       cube(size=[8,8,hight], center=false);
//     }
//     translate([87,5,(hight - 5)]){
//       cube(size=[8,8,hight], center=false);
//     }
//     translate([87,87,(hight - 5)]){
//       cube(size=[8,8,hight], center=false);
//     }
//   }
// }
roof();
  
  // difference() {
  //   roof();
  //   tardisBody();
  // }

/* Car window suction cup mount for Safecast bGeigie so it stops flapping at high speeds

Copyright Institute IRNAS Rače 2015. 

This documentation describes Open Hardware and is licensed under the CERN OHL v. 1.2.
You may redistribute and modify this documentation under the terms of the [CERN OHL v.1.2.](http://ohwr.org/cernohl). This documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED  WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A PARTICULAR PURPOSE. Please see the CERN  OHL  v.1.2 for applicable conditions.*/

//Define the following variables as per your use-case

//Material thickness of the lasercut plate affects spacer dimensions
thickness=6;

//spacer if safecast is mounted on the outside surface (screen towards glass)
module spacer_out(){
	//7mm thickness of suction cup
	height=33-7-thickness;
	difference(){
		//spacer itself
		cylinder(h=height,r=7,$fn=20,center=true);
		//4mm hole for screw
		cylinder(h=height,r=2,$fn=20,center=true);
	}
}

//spacer if safecast is mounted on the inside surface (sensor towards glass))
module spacer_in(){
	//7mm thickness of suction cup
	height=23-7-thickness;
	difference(){
		//spacer itself
		cylinder(h=height,r=7,$fn=20,center=true);
		//4mm hole for screw
		cylinder(h=height,r=2,$fn=20,center=true);
	}
}

//cutout for the case
module coutout(){
	hull() {
		for(x=[10,70]){
			for(y=[10,110]){
				rotate([0,0,0])
				translate([x,y,0])
				cylinder(h=5,r=10,$fn=20,center=true);
			}
		}	
	}
	//opening for close mechanism
	translate([82+3,122/2,0]) cube([12,82,5],center=true);
	//bottom strap cut
	translate([82/2+2.5,-7.5,0])	cube([37,5,5],center=true);
	//top strap cut
	translate([82/2-5,128,0])	cube([52,18,5],center=true);
}

//hole for the suction cup or spacer
module cup_hole(){
	//4mm hole for screw
	cylinder(h=5,r=2,$fn=20,center=true);
}

//cup/spacer position
module cup(){
	//cups in corner
	translate([0,-15,0]) cup_hole();
	translate([92,-15,0]) cup_hole();
	translate([92,147,0]) cup_hole();
	translate([0,147,0]) cup_hole();
}

//plate definition
module main(){
	hull() {
		for(x=[0,92]){
			for(y=[-15,147]){
				rotate([0,0,0])
				translate([x,y,0])
				cylinder(h=5,r=10,$fn=20,center=true);
			}
		}	
	}
}

//making all the holes
module final(){
	difference(){
		main();
		coutout();
		cup();
	}
}

//creating the STL object for plate
//final();
//or creating the DXF
projection(cut = true) final();

//creating the STL object for outer spacer
//spacer_out();

//creating the STL object for inner spacer
//spacer_in();


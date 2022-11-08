
module hex(hole, wall, thick){
    hole = hole;
    wall = wall;
    difference(){
        rotate([0, 0, 30]) cylinder(d = (hole + wall), h = thick, $fn = 6);
        translate([0, 0, -0.1]) rotate([0, 0, 30]) cylinder(d = hole, h = thick + 0.2, $fn = 6);
    }
}



module hexgrid(box, holediameter, wallthickness) {
    a = (holediameter + (wallthickness/2))*sin(60);
    for(x = [holediameter/2: a: box[0]]) {
        for(y = [holediameter/2: 2*a*sin(60): box[1]]) {
            translate([x, y, 0]) hex(holediameter, wallthickness, box[2]);
            translate([x + a*cos(60), y + a*sin(60), 0]) hex(holediameter, wallthickness, box[2]);

        }
    }
        
}

// first arg is vector that defines the bounding box, length, width, height
// second arg in the 'diameter' of the holes. In OpenScad, this refers to the corner-to-corner diameter, not flat-to-flat
// this diameter is 2/sqrt(3) times larger than flat to flat
// third arg is wall thickness.  This also is measured that the corners, not the flats. 


translate([4,6,0])hexgrid([70, 70, 3], 5, 3);

color("lightblue"){
    difference(){
        translate([0,0,0])cube([80,6,10]);
        translate([8,-1.5,-1])cylinder(d = 6, h = 20, $fn = 6);
        translate([72,-1.5,-1])cylinder(d = 6, h = 20, $fn = 6);
        translate([4,8,6])rotate([45,0,0])cube([72,10,10]);
    }
    difference(){
        translate([0,74,0])cube([80,6,10]);
        translate([8,81.5,-1])cylinder(d = 6, h = 20, $fn = 6);
        translate([72,81.5,-1])cylinder(d = 6, h = 20, $fn = 6);
        translate([4,72,6])rotate([45,0,0])cube([72,10,10]);
    }
    difference(){
        translate([0,0,0,])cube([6,80,10]);
        translate([2,4,12])rotate([0,45,0])cube([10,76,10]);
    }
    difference(){
        translate([74,0,0,])cube([6,80,10]);
        translate([63.8,4,12])rotate([0,45,0])cube([10,76,10]);
    }
}
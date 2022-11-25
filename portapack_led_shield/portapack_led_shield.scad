// circle control
$fs = 0.2;

// dimensions
h=4;

ledw=10;
ledh=15;
ledd=2.0;

swh=12;
sww=12;

pinw=5;
pinh=8;


difference(){
    translate([0,0,h/2]) cube([20, 20, h], true);
    translate([0,0,h/2]) cube([swh, sww, h*2], true);
    translate([5,ledh/2,h/2]) cylinder(h=h*2, r= ledd/2, center=true);
    translate([-5,ledh/2,h/2]) cylinder(h=h*2, r= ledd/2, center=true);
    translate([-5,-ledh/2,h/2]) cylinder(h=h*2, r= ledd/2, center=true);
    translate([5,-ledh/2,h/2]) cylinder(h=h*2, r= ledd/2, center=true);

    translate([5,ledh/2,h]) cylinder(h=2, r= ledd/2+1.2, center=true);
    translate([-5,ledh/2,h]) cylinder(h=2, r= ledd/2+1.2, center=true);
    translate([-5,-ledh/2,h]) cylinder(h=2, r= ledd/2+1.2, center=true);
    translate([5,-ledh/2,h]) cylinder(h=2, r= ledd/2+1.2, center=true);

    translate([pinh,0,h]) cube([pinw, pinh, 2], true);
    translate([-pinh,0,h]) cube([pinw, pinh, 2], true);
    translate([0,pinh,h]) cube([4, 4.5, 2], true);
    translate([0,-pinh,h]) cube([4, 4.5, 2], true);
}
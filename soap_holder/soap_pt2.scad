wh = 79.5;        // width of holder
ws = 100;       // center distance of struds
ds = 3;         // diameter of struds
hh = 11;        // height of holder
dh = 5;         // heigh difference of struds and holder

d=3.5;

b=((ws-wh)/2);    // helper for distance of hole


poly=[[0,-1],[0,hh+dh],[b,hh+dh],[b+5,hh+2],[b+5,hh-3],
[b+3,hh-3],[b+ds/2,hh],[b-ds/2,hh],[b-ds/2-4,-1]];

color("blue")linear_extrude(height=d, center =false)translate([wh,0,0])polygon(poly);

color("green")linear_extrude(height=d, center =false)scale([-1,1,1])polygon(poly);

color("red")cube([wh,dh,d]);




module old(){
difference(){
    cube([115,18,3],center=false);
    translate([18.5,8,-0.1])cube([78,11,5],center=false);
    translate([-1,-1,-1])cube([10,9,7],center=false);
    translate([6,0,-1])cube([3,13,7],center=false);
    translate([106,-1,-1])cube([10,9,7],center=false);
    translate([106,0,-1])cube([3,13,7],center=false);
    
}
}
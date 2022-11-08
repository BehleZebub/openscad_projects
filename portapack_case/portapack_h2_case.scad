//$fn= $preview ? 32:64;     // number of fragments, reduced resolution for preview.
$fn= 64;

//dimensions of portapack h2 with metal enclosure
pp_h=126.5;
pp_w=87.5;
pp_d=29;
//some other dimensions
rad_corner=8;   // radius at corners
add_d=6;        // add height depth
add_h_low=22;   // additional space below case
add_h_high=8;   // additional space above case


color("blue")
{
    difference()
    {
        case();
            //uncomment either interlock_a OR interlock_b
            //to create two parts that fit into each other
        //interlock_a();
        //interlock_b();
    }
}//end of blue



module interlock_a()
{
    difference(){
        translate([-10,-5,-6]) cube([pp_w+20,95,50]);
        translate([-10,90,-5]) cube([pp_w+20,86,50]);
        translate([-10,80,5.5]) cube([pp_w+20,15,19]);
    }    
}

module interlock_b()
{
    translate([-10,90,-5]) cube([pp_w+20,86,50]);
    translate([-10,80,5]) cube([pp_w+20,15,20]);
}

module case()
{
    difference()
    {
        translate([rad_corner/2,rad_corner/2,-add_d/2])minkowski(10)
        {
            cube([pp_w-rad_corner,pp_h+add_h_low+add_h_high,pp_d+add_d]);
            cylinder(r=rad_corner,h=0.1);
        }
    translate([4,add_h_low+4,0]) cube([pp_w-8,pp_h-8,pp_d+5]);
    translate([0,add_h_low,0])pp_h2();    
    translate([20,pp_h+25+18,9]) rotate([90,0,0])
        squ2rect(r_circ=8,h_circ=10,squareSize=[24,20,4],height=26.5);
    translate([-2,85,-3]) cylinder(r=.5,h=50,center=false);
    translate([89.5,85,-3]) cylinder(r=.5,h=50,center=false);
    }
};   


module pp_h2()
{
    cube([pp_w,pp_h,pp_d]);
    translate([18,1,8])rotate([90,0,0])cylinder(r=5,h=22);
    translate([36,1,8])rotate([90,0,0])cylinder(r=5,h=22);
    translate([57,-10,9])cube([10+5,40,7+5],center=true);
    translate([50,pp_h-.1,5])cube([25,5,7]);
};

module squ2rect(r_circ,h_circ,squareSize,height)
{
    hull()
    {
        translate([0,0,squareSize.z/2]) cube(squareSize, center=true);
        translate([0,0,height-h_circ]) cylinder(r=r_circ, h=h_circ, center=true);
    }
}
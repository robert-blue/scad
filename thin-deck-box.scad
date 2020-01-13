card_height = 100;
card_width = 75;
card_thickness = .1;
card_count = 40;

difference() {
    square(size=[card_height,card_width], center=true);
    translate([0,55,0]) 
        circle(r=50);
    translate([0,-55,0]) 
        circle(r=50);
}

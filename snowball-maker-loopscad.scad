

hole_rad = 2.5;
hole_height = 2.1;
hole_tolerance = .4;

base_length = (.2 * 6);
base_width = hole_rad * 2 + 2;

center_width = base_length /2;



linear_extrude(height=hole_rad - hole_tolerance) {

    // Base
    square([base_width, base_length], center=false);


    // Stem
    stem_length = hole_height + (hole_height/2) + 1;
    stem_width = (hole_rad * 2) - hole_tolerance;
    stem_left = (base_width - stem_width) /2 ;

    echo(stem_width=stem_width);
    echo(stem_length=stem_length);
    echo(base_width=base_width);
    echo(base_length=base_length);
            $fn = 90;
    difference() {

            // Loop
            loop_rad = stem_width / 2;
            loop_bottom = base_length + stem_length + loop_rad;
            loop_left = base_width / 2;
            loop_thickness = 1;

        union() {

            translate([stem_left,base_length])
                square([stem_width, stem_length], center=false);



            echo(loop_rad=loop_rad);
            echo(loop_bottom=loop_bottom);
            echo(loop_left=loop_left);


            translate([loop_left, loop_bottom - loop_rad ])
                    circle(r=loop_rad);
        }

        // Loop Hole
        translate([loop_left, loop_bottom - loop_rad])
            circle(r=hole_rad - loop_thickness);
    }
}
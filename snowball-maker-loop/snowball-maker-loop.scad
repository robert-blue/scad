
// Dimensions for hole at center of snowball maker cup
hole_rad = 2.5;
hole_height = 2.1;
hole_tolerance = .4;

// Dimensions for base of loop that sites inside the cup to hold it in
base_length = (.2 * 6);
base_width = hole_rad * 2 + 2;

// Dimensions for stem that fits through the hole in the cup
stem_length = hole_height + (hole_height / 2) + 1;
stem_width = (hole_rad * 2) - hole_tolerance;
stem_left = (base_width - stem_width) / 2;

// Dimensions for the loop for attaching string
loop_rad = stem_width / 2;
loop_bottom = base_length + stem_length + loop_rad;
loop_left = base_width / 2;
loop_thickness = 1;

linear_extrude(height = hole_rad - hole_tolerance)
{
    // Base
    square([ base_width, base_length ], center = false);

    $fn = 90;
    difference()
    {
        union()
        {
            // Stem
            translate([ stem_left, base_length ])
                square([ stem_width, stem_length ], center = false);

            // Loop
            translate([ loop_left, loop_bottom - loop_rad ])
                circle(r = loop_rad);
        }

        // Hole in loop
        translate([ loop_left, loop_bottom - loop_rad ])
            circle(r = hole_rad - loop_thickness);
    }
}




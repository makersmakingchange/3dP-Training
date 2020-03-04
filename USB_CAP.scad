// USB Cap in OpenSCAD - Stewart Russell, 2020-03

initials            = "JMc";

// design parameters, mm
width               = 12   + 0.1;
depth               =  4.5 + 0.1;
height              = 14;
print_tolerance     =  0.2;
wall_thickness      =  1.6;

difference() {
    // outer wall
    cube([  width  + 2 * wall_thickness, 
            depth  + 2 * wall_thickness, 
            height + wall_thickness     ],
          center=true);
    // "holes"
    union() {
        // hole for USB connector
        translate([0, 0, wall_thickness]) {
            cube([ width + print_tolerance, 
                    depth + print_tolerance, 
                    height ],
                center=true);
        }
        // initials
        translate([0, -(depth / 2) - wall_thickness, 0]) {
            rotate([90, 0, 0]) {
                linear_extrude(height=wall_thickness, 
                    center=true) {
                    text(   initials,
                            halign="center", 
                            valign="center",
                            size=5);
                }
            }
        }
    }
}

               

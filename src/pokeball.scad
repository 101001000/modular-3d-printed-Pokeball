/*

Pokeball v1.0;


*/


pokeball_size = 50;
inner_size = 48;
button_size = 15;
button_inner_size = 9;
button_out_size = 16;
band_width = 8;
cut_button_depth = 3.5;
button_spacer_height = 2;
button_out_width = 1;
button_in_width = 1;


resolution = 100;

module cut_button(){
    translate([0,inner_size/2])
    rotate([90,0,0])
    cylinder(h = cut_button_depth*2, d = button_out_size, center = true, $fn = resolution); 
}

module shell(){
        
    difference(){
        color("red")sphere(d = pokeball_size, $fn = resolution);
        
        translate([0,0,-pokeball_size/2])
        cube([pokeball_size,pokeball_size,band_width/2 + pokeball_size], center =    true);
        
        cut_button();
    } 
}

module spacer(){

    difference(){

        intersection(){

            sphere(d = inner_size, $fn = resolution);

            cylinder(h = band_width, d = inner_size, center = true, $fn = resolution);
        }

    cut_button();    
    }
}



module button_spacer(){
    translate([0,inner_size/2 - cut_button_depth + button_spacer_height/2,0])
    rotate([90,0,0])
    cylinder(h = button_spacer_height, d = button_out_size, center = true, $fn = resolution); 
}

module button(){
    translate([0,inner_size/2 - cut_button_depth + button_spacer_height + button_out_width/2, 0])
    rotate([90,0,0])
    cylinder(h = button_out_width, d = button_size, center = true, $fn = resolution);
    
    translate([0,inner_size/2 - cut_button_depth + button_spacer_height + button_out_width + button_in_width/2, 0])
    rotate([90,0,0])
    cylinder(h = button_in_width, d = button_inner_size, center = true, $fn = resolution);
}



color("white")button();
/*
color("black")button_spacer();
color("black")spacer();
shell();

rotate([0,180,0])
shell();
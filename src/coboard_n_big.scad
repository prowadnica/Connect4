$fa=0.1;$fs=0.1;

$columns=7;
$rows=6;

$pawnHeight=5;
$pawnWidth=25;

$floorHeight=7.5;
$wallWidth=2.5;
$wallOuter=10;
$wallPartition=2.5;
$wallMargin=0.75;

$windowMargin=4;

$standMargin=7.5;
$standHeight=2.5;

$roofHeight=5;

module board() {
width=$pawnWidth*$columns+$wallPartition*($columns-1)+$wallOuter*2;
depth = $wallWidth*2+$pawnHeight;
height=$floorHeight+$pawnWidth*$rows+$roofHeight;

difference() {
cube([width, depth, height]);

for( col = [0:$columns-1])
translate([$pawnWidth*col+$wallPartition*col+$wallOuter-$wallMargin, $wallWidth-$wallMargin, $floorHeight])
cube([$pawnWidth+$wallMargin*2, $pawnHeight+$wallMargin*2, height-$floorHeight]);

for( row = [0:$rows-1]) {
for( col = [0:$columns-1]) {
x=$wallPartition*col+$wallOuter+$pawnWidth*col-$wallMargin+$windowMargin;
z=$floorHeight+$pawnWidth*row;
w=$pawnWidth+$wallMargin*2-$windowMargin*2;
d=$wallWidth;
h=$pawnWidth;

translate([x, 0, z])
cube([w,d,h]);

translate([x, depth-d, z])
cube([w,d,h]);
}
}

}

translate([0, -$standMargin, -$standHeight])
cube([width, depth+$standMargin*2, $standHeight]);

translate([width/2, 0, 0])
difference() {
rotate([0,90,0])
cylinder(r=$floorHeight, h=width, center=true);
translate([0, 0, -$floorHeight/2])
cube([width,$floorHeight*2,$floorHeight], center=true);
}

translate([width/2, depth, 0])
difference() {
rotate([0,90,180])
cylinder(r=$floorHeight, h=width, center=true);
translate([0, 0, -$floorHeight/2])
cube([width,$floorHeight*2,$floorHeight], center=true);
}
}



board();
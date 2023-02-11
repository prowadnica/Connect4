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

module lid() {
width=$pawnWidth*$columns+$wallPartition*($columns-1)+$wallOuter*2;
depth = $wallWidth*2+$pawnHeight;
height=$floorHeight+$pawnWidth*$rows+$roofHeight;

difference() {

cube([width+5, depth+5, 2+$roofHeight]);
translate([2.5, 2.5, 2])
cube([width, depth, $roofHeight]);

}
}

lid();
$fa=0.1;$fs=0.1;

$pawnHeight=5;
$pawnWidth=25;
$markDepth=2.5;
$markWidth=15;

module cop1() {
difference() {
cube([$pawnWidth, $pawnWidth, $pawnHeight], center=true);

translate([0, 0, -$pawnHeight/2+$markDepth/2])
cube([$markWidth, $markWidth, $markDepth], center=true);

translate([0, 0, $pawnHeight/2-$markDepth/2])
cube([$markWidth, $markWidth, $markDepth], center=true);
}
}

module cop2() {
difference() {
cube([$pawnWidth, $pawnWidth, $pawnHeight], center=true);

translate([0, 0, -$pawnHeight/2+$markDepth/2])
cylinder(d=$markWidth, h=$markDepth, center=true);

translate([0, 0, $pawnHeight/2-$markDepth/2])
cylinder(d=$markWidth, h=$markDepth, center=true);
}
}

for( i = [0:4])
for( j = [0:4])
translate([i*30, j*30, 0])
if(i<4 || j<1)
cop1();
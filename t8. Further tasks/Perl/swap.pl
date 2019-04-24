#!/usr/bin/perl

$a = 10;
$b = 20;
print "initial value of a: $a \n";
print "initial value of b: $b \n";
$a = $a + $b;
$b = $a - $b;
$a = $a - $b;
print "Value of a: $a\n";
print "Value of b: $b\n";

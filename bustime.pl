#!/usr/bin/perl

use warnings;
use strict;

my $toUni = $ARGV[0] eq "from" ? 0 : 1;
my $direction = $toUni ? "to" : "from";

my $theTime = `date +'%H%M'`;
#my $theTime = "2321";
my @shuttlebus = qw(0730 0755 0820 0845 0910 0935 1000 1025 1050 1115 1140 1205 1230 1255 1320 1345 1410 1435 1500 1525 1550 1615 1640 1705 1730 1755 1820 1845 1910 1935 2000 2025 2050 2115);

if ($toUni) {
    push(@shuttlebus, "2215");
} else {
    push(@shuttlebus, "2145");
}

my $i = 0;
while ($i < @shuttlebus && $shuttlebus[$i] < $theTime) {
    $i++;
}
if ($i < $#shuttlebus) {
    print "The next three shuttle buses $direction Monash University Clayton are:\n$shuttlebus[$i]\n$shuttlebus[$i+1]\n$shuttlebus[$i+2]\n";
} else {
    print "Abandon all hope!\n";
}

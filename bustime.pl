#!/usr/bin/perl

use common::sense;
use warnings;
use strict;

my $theTime = `date +'%H%M'`;
my @shuttlebus = qw(
    0730 0755 0820 0845 0910 0935 1000 1025 1050 1115 1140 1205 1230 1255 1320
    1345 1410 1435 1500 1525 1550 1615 1640 1705 1730 1755 1820 1845 1910 1935
    2000 2025 2050 2115 2215
);

my $i = 0;
print "The next 5 buses are:\n";
foreach my $bustime (@shuttlebus) {
    if ($bustime > $theTime) {
        print $bustime, "\n";
        $i++;
    }
    last if $i == 5;
}

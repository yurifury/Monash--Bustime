#!/usr/bin/perl

use common::sense;
use POSIX;

my $theTime = `date +'%H%M'`;
chomp $theTime;
my @shuttlebus = qw(
    0730 0755 0820 0845 0910 0935 1000 1025 1050 1115 1140 1205 1230 1255 1320
    1345 1410 1435 1500 1525 1550 1615 1640 1705 1730 1755 1820 1845 1910 1935
    2000 2025 2050 2115 2215
);
my @originalTimes = @shuttlebus;

my $i = 0;
print "It is now $theTime.\n";
my $mod60Time  = substr($theTime, 0, 2) * 60;
$mod60Time += substr($theTime, 2, 2);

map { 
    my $mod60time = 0;
    $mod60time  = substr($_, 0, 2) * 60;
    $mod60time  += substr($_, 2, 2);
    $_ = $mod60time;
    } @shuttlebus;

#print "$_\n" foreach @shuttlebus;

    my $j = 0;
foreach my $bustime (@shuttlebus) {
    if ($bustime > $mod60Time) {
        my $eta = $bustime - $mod60Time;

        print "$originalTimes[$i] in $eta minutes\n";
        $j++;
    }
    $i++;
    last if $j == 4;
}

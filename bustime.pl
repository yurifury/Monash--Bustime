#!/usr/bin/perl

use common::sense;
use POSIX;
use DateTime;
use YAML;

my $currentTime = DateTime->now(time_zone => 'local');

#print Dump $currentTime;
my @shuttleBusTimes = qw/
    0730 0755 0820 0845 0910 0935 1000 1025 1050 1115 1140 1205 1230 1255 1320
    1345 1410 1435 1500 1525 1550 1615 1640 1705 1730 1755 1820 1845 1910 1935
    2000 2025 2050 2115 2215
    /;

    my $i = 0;
foreach my $busTime (@shuttleBusTimes) {
    last if $i > 4;

    my $busTimeObj = DateTime->now(time_zone => 'local');
    $busTimeObj->set(
        hour  => substr($busTime, 0, 2),
        minute    => substr($busTime, 2, 3),
    );
    my $nowHM = $currentTime->strftime('%H%M');
    my $busHM = $busTimeObj->strftime('%H%M');

    if ($busHM > $nowHM) {
        $i++;
        my $delta = $busTimeObj->delta_ms($currentTime);
        my $delta_readable = $delta->hours . $delta->minutes;
        print "Bus in $delta_readable\n";
    }
}

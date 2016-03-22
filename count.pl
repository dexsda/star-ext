#!/usr/bin/perl -w
use strict;
open FILE,$ARGV[0];
my @Vs=();
sub count {
    my ($V, $arr) = @_;
    my $sum = 0;
    for(@{$arr}){
        if($_<=$V){
            $sum++;
        }
    }
    return $sum;
}
for(<FILE>){
    if(/(.{60})([\d\-\.]+)\s(.+)/){
        my $V = $2;
        push @Vs,$V;
        #print $V."\n" if $V >=6;
    }
}

my $step=0.1;
my $V = 1;

#for((0..6)){
#    print count($_,\@Vs);
#    print "\n";
#}

while($V<6) {
    my $a = count($V,\@Vs);
    my $b = count($V-1,\@Vs);
    my $div = $a/$b;
    print $V." ".$div."\n";
    $V+=$step;
}

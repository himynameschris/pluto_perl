#!/usr/bin/perl -w
 
use File::Find;

$out = "";

$dir1 = $ARGV[0];  
$out = $ARGV[1];

if ($out eq "")  { $out = "data.txt"; }

open (MYFILE, ">>" . $out); 

my @all_file_names;

find sub {
     return if -d;
     push @all_file_names, $File::Find::name;
     }, $dir1;

for my $path ( @all_file_names ) {
	$path =~ s/$dir1\///g;
     print MYFILE "$path\n";
     }
	 
close (MYFILE); 
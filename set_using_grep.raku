multi sub prefix:<ι> (Int $*lim where $*lim >= 2) {
	return 1...$*lim;
}

multi sub infix:<∈> ($x, @*list) { # U+2208
	if grep $x, @*list { return True;} else { return False;} 
}

multi sub infix:<∉> ($x, @*list) { # U+2209

	return not $x ∈ @*list;
}

say 1 ∈ ι 3; # -> True
say 1 ∉ ι 3; # -> False

multi sub infix:<∪> (@*set1, @*set2) { # U+222A
	my @union;
	my $set1_elem;
	my $set2_elem;

	for @*set1 -> $set1_elem {
		if $set1_elem ∉ @union {  @union.push($set1_elem); }
	}
	
	for @*set2 -> $set2_elem {
		if $set2_elem ∉ @union { @union.push($set2_elem); }
	}

	return @union;
	}
 
say (1,2,3) ∪ (3,4,5,6); # -> (1,2,3,4,5,6)

multi sub infix:<∩> (@*set1, @*set2) { #U+2229
	my @intersection;
	my $elem;
	my @union = @*set1 ∪ @*set2;
	for @union -> $elem { 
		if $elem ∈ @*set1 and $elem ∈ @*set2 { @intersection.push($elem); }
	}
	return @intersection;
}
say (1,2,3) ∩ (1,5,3,7); # -> (1,3)

# Are we ready for some De Morgan?

my $A = (1,2,3);
my $B = (1,5,3,7);
my $Γ = (1,2);

say $A ∪ $B == $B ∪ $A;
say $A ∪ ($B ∪ $Γ) == ($A ∪ $B) ∪ $Γ;
say $A ∪ ($B ∩ $Γ) == ($A ∪ $B) ∩ ($A ∪ $Γ);
say $A ∪ ($A ∩ $B) == $A;
 



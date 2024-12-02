sub factorial (Int $num) {
	my $product = 1;
	for 1..$num -> $x {
		$product *= $x
	}
	return $product
}

say factorial 10;


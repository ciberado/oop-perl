use PetShop;

my $buster = Pet::Cat->new( 
	name => 'Buster' );
my $mimi   = Pet::Cat->new( 
	name => 'Mimi' );
my $addy   = Pet::Dog->new( 
	name => 'Addy' );
my $poppy  = Pet::Bird->new( 
	name => 'Poppy' );

my $pet_shop = PetShop->new( 
	pets => [ $buster, $mimi, $addy, $poppy ] 
	);

my $pets = $pet_shop->pets;

print "The pet shop has [",
	join( " ", map { $_->type } $pet_shop->pets ), 
	"]\n";

foreach my $p ( $pet_shop->pets ) {
    print "*************** ";
    print $p->name;
    print " dice que ";
    print $p->speak;
    print " ***************\n";
}
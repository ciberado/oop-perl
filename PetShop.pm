
#http://www.theperlreview.com/articles/moose.html
#http://es.slideshare.net/j1n3l0/oo-perl-with-moose

{
package PetShop;
use Moose;

has 'pets' => (
	is  => 'rw',
	isa => 'ArrayRef[Pet]',
    auto_deref => 1
	);
    
__PACKAGE__->meta->make_immutable;
}

{
package Pet;
use Moose;

has 'name' => (
	is       => 'rw',
	isa      => 'Str',
	required => 1
	);
	
has 'type' => (
	is      => 'ro',
	isa     => 'Str',
	default => 'animal'
	);
    
has 'sound' => (
	is      => 'ro',
	isa     => 'Str',
	default => ''
	);

sub BUILD {
    my $self = shift;
    $self->name(uc $self->name);
}
	
sub speak { 
    my $self = shift;
    
    return $self->sound; 
}    
    
__PACKAGE__->meta->make_immutable;    
}

{
package Pet::Cat;
use Moose;

extends 'Pet';

has '+type' => ( 
	default => 'cat' 
	);

has '+sound' => (
	default => 'miau'
	);
    
override 'speak' => sub {
    return uc super();
};
    
__PACKAGE__->meta->make_immutable;    
}

{
package Pet::Dog;
use Moose;

extends 'Pet';

has '+type' => ( 
	default => 'dog' 
	);
    
has '+sound' => (
	default => 'guau'
	);
    
__PACKAGE__->meta->make_immutable;    
}

{
package Pet::Bird;
use Moose;

extends 'Pet';

has '+type' => ( 
	default => 'bird' 
	);

__PACKAGE__->meta->make_immutable;    
}

no Moose;

1;
package ProductoFinanciero::CuentaAhorro;
use ProductoFinanciero;
use Moose;

extends 'ProductoFinanciero';

has 'penalizado' => (
	is       => 'rw',
	isa      => 'Bool',
    default  => 0
);

has '+SALDO_MINIMO' => (
	default => 0
);

sub BUILD {
    print "Inicializando cuenta de ahorro.\n";
}

override 'reintegrar' => sub {
    my $self = shift;
    super();
    $self->penalizado(1);
};

override 'actualizar_interes_mensual' => sub {
    my $self = shift;
    
    if ($self->penalizado == 0) {
        return super();
    } else {
        $self->penalizado(0);
        return 0;
    }
};



__PACKAGE__->meta->make_immutable;


no Moose;

1;
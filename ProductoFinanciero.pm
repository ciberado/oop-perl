package ProductoFinanciero;
use Moose;
use DateTime;

has 'SALDO_MINIMO' => (
	is       => 'ro',
	isa      => 'Num',
    default  => -100.0
);

has 'codigo' => (
	is       => 'rw',
	isa      => 'Str',
	required => 1
);

has 'saldo' => (
	is       => 'rw',
	isa      => 'Num',
    default  => 0
);

has 'interes_anual' => (
	is       => 'rw',
	isa      => 'Num',
    default  => 0.0
);

has 'fecha_creacion' => (
	is       => 'ro',
	isa      => 'DateTime',
    handles  => {
        anyo_creacion => 'year'
    }
);

sub BUILD {
    print "Inicializando producto financiero.\n";
}


sub ingresar { 
  my ($self, $cantidad) = @_;
  
  if ($cantidad < 0) { 
    die "No puede ingresarse un número negativo.";
  }
  $self->saldo($self->saldo + $cantidad);
}  

sub reintegrar { 
  my ($self, $cantidad) = @_;
  
  if ($cantidad < 0) { 
    die "No puede reintegrarse un número negativo.";
  }
  if ($self->saldo - $cantidad < $self->SALDO_MINIMO) {
    die "Saldo insuficiente para retirar $cantidad euros.";
  }
  $self->saldo($self->saldo - $cantidad);
}  

sub actualizar_interes_mensual {
    my $self = shift;
    
    if ($self->saldo < 0) {
        return 0;
    }
    
    my $interes_mensual = $self->interes_anual / 12.0;
    my $incremento = $self->saldo * $interes_mensual;
    $self->saldo($self->saldo + $incremento);
    return $incremento;
}


__PACKAGE__->meta->make_immutable;


no Moose;

1;
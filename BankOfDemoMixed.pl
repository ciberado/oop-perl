use DateTime;
use Try::Tiny;
use ProductoFinanciero;
use CuentaAhorro;


print "0> Arrancando!\n\n";

my $pf1 = ProductoFinanciero->new(
    codigo => '1111', saldo => 1000.0, interes_anual => 0.012, 
    fecha_creacion => DateTime->now);
    
print "1> Producto financiero creado.\n\n";    
    

my $ca1 = ProductoFinanciero::CuentaAhorro->new(
    codigo => '2222', saldo => 2000.0, interes_anual => 0.024, 
    fecha_creacion => DateTime->now, penalizado => 0);

print "2> Cuenta de ahorro creada.\n\n";    
    
my @productos = ($pf1, $ca1);

foreach (@productos) {
 	my $productoActual = $_;
    print "3> Reintegrando 500 euros de " . $productoActual->codigo . ".\n";
    $productoActual->reintegrar(500.0);
    print "4> Saldo actual " . $productoActual->saldo . "\n\n";
} 

foreach (@productos) {
 	my $productoActual = $_;
    print "5> Actualizando el interés de " . $productoActual->codigo . "!\n";
    my $intereses = $productoActual->actualizar_interes_mensual();
    print "6> Saldo actual " . $productoActual->saldo . ", intereses: " . $intereses . "\n\n";    
} 

print "7> Fin.\n\n";
    
1;
use DateTime;
use Try::Tiny;
use CuentaAhorro;

print "0> Arrancando!\n\n";

my $ca1 = ProductoFinanciero::CuentaAhorro->new(
    codigo => '2222', saldo => 1000.0, interes_anual => 0.024, 
    fecha_creacion => DateTime->now, penalizado => 0);

try {
    print "1> Reintegrando 1001 pavos.\n";
    $ca1->reintegrar(1001.0);
    print "2> Si puedes ver esto es que no lo hemos hecho bien.\n\n";
} 
catch  {
    my $exc = $_[0];
    warn "3> " . $exc . "\n";
};
    
print "4> Actualizando el interés!\n";
my $intereses = $ca1->actualizar_interes_mensual();
print "5> Saldo actual " . $ca1->saldo . ", intereses: " . $intereses . "\n\n";

print "6> Reintegrando dos euritos.\n";
$ca1->reintegrar(2.0);
print "7> Saldo actual " . $ca1->saldo . "\n\n";

print "8> Actualizando el interés!\n";
my $intereses = $ca1->actualizar_interes_mensual();
print "9> Saldo actual " . $ca1->saldo . ", intereses: " . $intereses . "\n\n";

print "10> Fin.\n\n";
    
1;
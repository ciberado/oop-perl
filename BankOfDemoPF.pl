use DateTime;
use Try::Tiny;
use ProductoFinanciero;


print "0> Arrancando!\n\n";

my $pf1 = ProductoFinanciero->new(
    codigo => '1111', saldo => 1000.0, interes_anual => 0.012, 
    fecha_creacion => DateTime->now);

print "1> Producto creado en " . $pf1->anyo_creacion . ".\n\n";    
    
print "2> Ingresando 1000 pavos.\n";
$pf1->ingresar(1000.0);
print "3> Saldo actual " . $pf1->saldo . "\n\n";
    
    
try {
    print "4> Reintegrando 3000 pavos.\n";
    $pf1->reintegrar(3000.0);
    print "5> Si puedes ver esto es que no lo hemos hecho bien.\n\n";
} 
catch  {
    my $exc = $_[0];
    warn "6> " . $exc . "\n";
};

print "7> Ok, ok, reintegrando 2050 euros.\n";
$pf1->reintegrar(2050.0);
print "8> Saldo actual " . $pf1->saldo . "\n\n";

print "9> Ingresando 150 euros.\n";
$pf1->ingresar(150.0);
print "10> Saldo actual " . $pf1->saldo . "\n\n";


print "11> Actualizando el interés!\n";
my $intereses = $pf1->actualizar_interes_mensual();
print "12> Saldo actual " . $pf1->saldo . ", intereses: " . $intereses . "\n\n";

print "13> Fin.\n\n";
    
1;
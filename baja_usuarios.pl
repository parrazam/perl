#!/usr/bin/perl

# Script que permite dar de baja un usuario.

# Author: Víctor Parra [parra@usal.es]

# AVISO: Requiere permisos de root
# Es necesario instalar el File::Path y el Linux::usermod
# ># perl -MCPAN -e 'install File::Path'
# ># perl -MCPAN -e 'install Linux::usermod'

# Parámetros:
# - [nombre_del_usuario] -> Nombre del usuario

$args=@ARGV;

if ($args < 1)
{
 print "\n";
 print "Uso: $0 [nombre_del_usuario]\n";
 print "\n";
 print "\n";
 die "Abortando";
}

$ruta="/home/" . $ARGV[0] . "/";

$usuario=$ARGV[0];
use Linux::usermod;
use File::Path;

print "Borrando el directorio $ruta...\n";
rmtree($ruta, 1, 1 ) or die "rmtree: $!\n";

Linux::usermod->del($usuario) or die "Deluser: $!\n";

print "\nUsuario $usuario borrado con éxito\n";
print "\n";
exit;

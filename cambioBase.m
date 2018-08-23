% Programa que convierte un numero en base 10 a un numero en cualquier otra base
% Elaborado por Luis Angel Muñoz Franco

clc %limpiar pantalla
fprintf("\n\tBienvenido, este programa convierte un numero base 10 a un numero en cualquier base\n\n")
cont = 1;

while cont == 1

% pedir datos al usuario
numero = input("\n\tDame el numero a convertir de base: ");

% separar la fraccion del entero
fraccion = mod(numero, 1);
entero = numero - fraccion;

base = input("\n\tDame la base (debe ser mayor a 1): ");

% hacer el calculo de la parte entera 

nuevoNum = []; %aqui guarda la parte entera del nuevo numero

while entero > 0
  % agrego un nuevo elemento a la izquierda al vector que es el modulo de el numero entero entre la base
  nuevoNum = [mod(entero, base), nuevoNum];
  entero = fix(entero/base);

end

%convertir el vector a string
nuevoNum = int2str(nuevoNum);


% hacer la parte fraccionada
if (fraccion != 0)
  fraNum = []; %aqui guarda la parte fraccionada del nuevo numero

  for i=0:9 %tendra 10 ceros despues del punto

    % agrega un nuevo elemento a la derecha del vector, que es el entero de multiplicar la fraccion del numero por la base
    fraccion = fraccion*base;
    ff = fix(fraccion);
    fraccion = abs(ff - fraccion);
    fraNum = [fraNum, ff];
  endfor

  % convertir el vector a string
  fraNum = int2str(fraNum);
  
  % imprimir el resultado
  fprintf("\n\tEl numero %f convertido a base %d es: %s . %s \n", numero, base, nuevoNum, fraNum)

% en caso que el numero no tenga fraccion, solo imprime la parte entera
else
  fprintf("\n\tEl numero %f convertido a base %d es: %s\n", numero, base, nuevoNum)
endif

cont = input("\n\t Quieres ingresar otro numero? 1=si, o para salir oprime enter: ");
clc

end

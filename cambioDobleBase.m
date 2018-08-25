% Programa que convierte un numero de cualquier base a un numero de cualquier otra base

%pedir datos

clc

  fprintf("\n\tBienvenido, este programa convierte un numero de cualquier base a cualquier otra base\n")


cont = 1;

format long e;

while cont
  
  numero = input("\n\tDime tu numero: ");

  baseOrig = input("\n\tCual es la base del numero: ");

  baseDes = input("\n\tDime a que base quieres convertir el numero (mayor a 1): ");

  %separar parte entera de la fraccion

  entero = floor(numero);
  format long e;
  decimal = numero - entero;

  %ver si la base del numero es decimal
  if baseOrig == 10

    entConv = entero;
    decConv = decimal;
  
  else

    %convertir el numero a array y separar el entero del punto
    
    entero = num2str(entero);
    decimal = num2str(decimal, 20);
    decimal = decimal(3:end);


    % hacer ciclos para hacer cambio de base

    %convertir entero a base 10
    n = length(entero)-1;
    entConv = 0;
  
    for i = entero
      entConv = entConv + str2num(i)*baseOrig^n;
      n--;
    end

    %convertir decimal a base 10
    n = -1;
    decConv = 0;

    for i = decimal
      decConv = decConv + str2num(i)*baseOrig^n;
      n--;
    end

  endif
  
  %convertir de base 10 a la base deseada

  % hacer el calculo de la parte entera 

  nuevoNum = []; %aqui guarda la parte entera del nuevo numero

  while entConv > 0
  % agrego un nuevo elemento a la izquierda al vector que es el modulo de el numero entero entre la base
  nuevoNum = [mod(entConv, baseDes), nuevoNum];
  entConv = fix(entConv/baseDes);
  end

  %convertir el vector a string
  nuevoNum = int2str(nuevoNum);


  % hacer la parte fraccionada
  if (decConv != 0)
    fraNum = []; %aqui guarda la parte fraccionada del nuevo numero

    for i=0:19 %tendra 20 ceros despues del punto

      % agrega un nuevo elemento a la derecha del vector, que es el entero de multiplicar la fraccion del numero por la base
      decConv = decConv*baseDes;
      ff = fix(decConv);
      decConv = abs(ff - decConv);
      fraNum = [fraNum, ff];
    endfor

    % convertir el vector a string
    fraNum = int2str(fraNum);
  
    % imprimir el resultado
    fprintf("\n\tEl numero final es: %s . %s \n", nuevoNum, fraNum)

  % en caso que el numero no tenga fraccion, solo imprime la parte entera
  else
    fprintf("\n\tEl nuevo numero es: %s\n", nuevoNum)
  endif


  cont = input("\n\tOtro numero? 1=si o presione enter para salir: ");
  
  clc
end

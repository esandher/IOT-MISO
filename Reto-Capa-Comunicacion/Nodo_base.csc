atget id id

data p "hola" id id
send p

loop
read mens
rdata mens tipo valor1 valor2

if( tipo== "critico" )
   cprint "Nodo descargad en: longitud" valor1,"latitud: " valor2
   data p "stop"
   send p id id
   wait 100000
   stop
end

if( tipo == "alerta")
   cprint "Alerta en: longitud" valor1 ", latitud: " valor2
end

wait 100
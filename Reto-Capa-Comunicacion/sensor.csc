set ant 999
set ite 0
set status  "encendido"

battery set 100
atget id id
getpos2 lonSen latSen

loop
wait 100
read mens
rdata mens tipo valor
inc ite
print ite


if( ite>=1000)
  
  cprint "sensor apagado 1 id" id
  wait 1000
  stop
end

if(tipo=="stop")
   data mens "stop"
   send mens * valor
   cprint "Para sensor:"id
   wait 1000
   stop
end
battery bat
if(bat<5)
   data p "stop" id id
   wait 1000
   cprint "sensor apagado enviar comando, por sensor id " id
   send p
   wait 1000
   stop
   
end

if((tipo=="hola") && (ant == 999))
   set ant valor
   data mens tipo id
   send mens * valor
end

if(tipo=="alerta")
   send mens ant
end
delay 10

areadsensor tempSen
rdata tempSen SensTipo idSens temp

if( temp>30)
   data mens "alerta" lonSen latSen
   send mens ant
end
-module(length).
-compile(export_all).

len(year,month)->
case 1: year rem 4 =:= 0 & month=:=january->
    len(year,month)=:=31;

case 2: year rem 4 =:= 0 & month=:=february->
    len(year,month)=:=29;

case 3: year rem 4 =:= 0 & month=:=march->
    len(year,month)=:=31;

case 4: year rem 4 =:= 0 & month=:=april->
    len(year,month)=:=30;

case 5: year rem 4 =:= 0 & month=:=may->
    len(year,month)=:=31;

case 6: year rem 4 =:= 0 & month=:=june->
    len(year,month)=:=30;

case 7: year rem 4 =:= 0 & month=:=july->
    len(year,month)=:=31;

case 8: year rem 4 =:= 0 & month=:=august->
    len(year,month)=:=31;

case 9: year rem 4 =:= 0 & month=:=september->
    len(year,month)=:=30;

case 10: year rem 4 =:= 0 & month=:=october->
    len(year,month)=:=31;

case 11: year rem 4 =:= 0 & month=:=november->
    len(year,month)=:=30;

case 12: year rem 4 =:= 0 & month=:=december->
    len(year,month)=:=31;

end.
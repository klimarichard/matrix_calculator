unit UZlomky;

interface

uses SysUtils;

 type TZlomek = class

  protected
   c:integer;
   j:integer;

  public
   constructor Create;

   procedure Zkrat;
   procedure Secti(zlomek:TZlomek; var vysl:TZlomek);   overload;
   procedure Odecti(zlomek:TZlomek; var vysl:TZlomek);    overload;
   procedure Nasob(number:real);             overload;
   procedure Prinasob(zlomek:TZlomek);

   function Citatel:integer;
   function Jmenovatel:integer;
   function Napln(citatel,jmenovatel:integer):boolean;
   function Vypis:string;
   function AbsHod:TZlomek;
   function PrevHod:boolean;
   function Vysledek:real;
   function RovnaSe(zlomek:TZlomek):boolean;
   function Porovnani(zlomek:TZlomek):ShortInt;
   function Secti(zlomek:TZlomek):TZlomek;              overload;
   function Odecti(zlomek:TZlomek):TZlomek;               overload;
   function Nasob(zlomek:TZlomek):TZlomek;   overload;
   function ZlomZDes(number:real):TZlomek;
   function ZlomZStr(number:string; var zlomek:TZlomek):boolean;
 end;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

implementation

constructor TZlomek.Create;                                                       //�AKA!!! �AKA!!!
 begin
  c:=0;
  j:=1;
 end;

{CONSTRUCTOR}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{ZKR�CEN� ZLOMKU}

procedure TZlomek.Zkrat;                                                           //p�eveden� na z�kladn� zlomek
 var a,b,d:integer;
 begin
  if c<>0 then
   begin
    a:=abs(c);
    b:=abs(j);
    if a>b then
     begin
      d:=a mod b;
      while d<>0 do
       begin
        a:=b;
        b:=d;
        d:=a mod b;
       end;
      c:=c div b;
      j:=j div b;
     end
    else
     begin
      d:=b mod a;
      while d<>0 do
       begin
        b:=a;
        a:=d;
        d:=b mod a;
       end;
      c:=c div a;
      j:=j div a;
     end;
   end
  else
   j:=1;                                                                            //aby byl zlomek v normovanem tvaru tohoto programu 0/1
 end;

{ZKR�CEN� ZLOMKU}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{NAPLN�N� ZLOMKU}

function TZlomek.Napln(citatel,jmenovatel:integer):boolean;                        //na�ten� zlomku
 begin
  if jmenovatel<0 then
   begin
    citatel:=-citatel;
    jmenovatel:=-jmenovatel;
   end; 
  if jmenovatel<>0 then
   begin
    c:=citatel;
    j:=jmenovatel;
    self.Zkrat;
    result:=true;
   end
  else
   result:=false; 
 end;

{NAPLN�N� ZLOMKU} 
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{HODNOTA �ITATELE & JMENOVATELE}

function TZlomek.Citatel:integer;                                                  //hodnota �itatele
 begin
  result:=c;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TZlomek.Jmenovatel:integer;                                               //hodnota jmenovatele
 begin
  result:=j;
 end;

{HODNOTA �ITATELE & JMENOVATELE}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{P�EVR�CEN� HODNOTA ZLOMKU}

function TZlomek.PrevHod:boolean;                                                   //p�evr�cen� hodnota
 var a:integer;
 begin
  if c<>0 then
   begin
    if c>0 then
     begin
      a:=j;
      j:=c;
      c:=a;
     end
    else
     begin
      a:=j;
      j:=-c;
      c:=-a;
     end;
    result:=true;
   end
  else
   result:=false;
 end;

{P�EVR�CEN� HODNOTA ZLOMKU}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{VYPS�N� ZLOMKU}

function TZlomek.Vypis:string;                                                      //vyps�n� zlomku
 begin
  result:='';
  if j<>1 then
   result:=IntToStr(c)+'/'+IntToStr(j)
  else
   result:=IntToStr(c); 
 end;

{VYPS�N� ZLOMKU} 
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{V�SLEDEK}

function TZlomek.Vysledek:real;                                                    //desetinn� v�sledek
 begin
  result:=c/j;
 end;

{V�SLEDEK}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{ABSOLUTN� HODNOTA}

function TZlomek.AbsHod:TZlomek;                                                    //absolutn� hodnota zlomku
 begin
  result:=TZlomek.Create;
  if c<0 then
   result.Napln(-c,j)
  else
   result.Napln(c,j);  
 end;

{ABSOLUTN� HODNOTA}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{P�EVODY NA ZLOMEK}

function TZlomek.ZlomZDes(number:real):TZlomek;                                    //zlomek z desetinn�ho ��sla
 var s,pred,po:string;
     a,b,i,delka:integer;
 begin
  s:=FloatToStr(number);                     //��slo do stringu
  delka:=length(s);                          //d�lka stringu
  a:=pos(',',s);                             //pozice desetinn� ��rky
  if a<>0 then                               //jestli v ��sle desetinn� ��rka
   begin
    pred:=copy(s,1,a-1);                     //��st p�ed des. ��rkou
    po:=copy(s,a+1,delka-a);                 //��st po des. ��rce
   end
  else
   begin
    pred:=copy(s,1,length(s));               //p�ed "des. ��rkou"
    po:='';                                  //po "des. ��rce"
   end;
  b:=1;
  for i:=1 to length(po) do                  //nastaven� jmenovatele jako 10^length(po)
   begin
    b:=b*10;                                 //hodnota jmenovatele
   end;
  result:=TZlomek.Create;
  if StrToInt(pred)<>0 then                  //jestli jsou ��sla p�ed des. ��rkou
   begin
    result.c:=StrToInt(pred+po);
    result.j:=b;
   end
  else
   begin
    result.c:=StrToInt(po);
    result.j:=b;
   end;
  result.Zkrat;                              //v�sledek na z�kladn� tvar
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TZlomek.ZlomZStr(number:string; var zlomek:TZlomek):boolean;              //zlomek ze stringu
 var a,b,i,citatel,jmenovatel,lom,delka:integer;
     pred,po:string;
     zlomek1:TZlomek;
 begin
  lom:=pos('/',number);
  if lom=0 then                                //jestli je zad�n zlomek
   begin
    delka:=length(number);                     //d�lka stringu
    a:=pos(',',number);                        //pozice desetinn� ��rky
    if a<>0 then                               //jestli v ��sle desetinn� ��rka
     begin
      pred:=copy(number,1,a-1);                //��st p�ed des. ��rkou
      po:=copy(number,a+1,delka-a);            //��st po des. ��rce
     end
    else
     begin
      pred:=copy(number,1,delka);              //p�ed "des. ��rkou"
      po:='';                                  //po "des. ��rce"
     end;
    b:=1;
    if length(po)>0 then
     for i:=1 to length(po) do                  //nastaven� jmenovatele jako 10^length(po)
      begin
       b:=b*10;                                 //hodnota jmenovatele
      end;
    zlomek:=TZlomek.Create;
    if StrToInt(pred)<>0 then                   //jestli jsou ��sla p�ed des. ��rkou
     zlomek.Napln(StrToInt(pred+po),b)
    else if po<>'' then                         //jestli to nen� jenom 0
          zlomek.Napln(StrToInt(po),b)
         else
          zlomek.Napln(0,1);
    result:=true;      
   end                                          //if lom=0 end
  else
   begin
    pred:=copy(number,1,lom-1);
    po:=copy(number,lom+1,length(number));
    zlomek:=TZlomek.Create;
    if pos(',',pred)=0 then                     //jestli je des. ��rka v �itateli
     if pos(',',po)=0 then                      //jestli je des. ��rka ve jmenovateli
      begin
       if zlomek.Napln(StrToInt(pred),StrToInt(po)) then       //��dn� des. ��rka
        result:=true
       else
        result:=false; 
      end
     else
      begin
       zlomek1:=zlomek.ZlomZDes(StrToFloat(po));               //des. ��rka ve jmenovateli
       if zlomek.Napln(StrToInt(pred)*zlomek1.Jmenovatel,zlomek1.Citatel) then
        result:=true
       else
        result:=false;
      end
    else
     if pos(',',po)=0 then                      //jestli je des. ��rka ve jmenovateli
      begin
       zlomek1:=zlomek.ZlomZDes(StrToFloat(pred));             //des. ��rka v �itateli
       if zlomek.Napln(zlomek.Citatel,zlomek.Jmenovatel*StrToInt(po)) then
        result:=true
       else
        result:=false; 
      end
     else
      begin
       zlomek1:=zlomek.ZlomZDes(StrToFloat(pred));             //ob� des. ��rky
       citatel:=zlomek1.Citatel;
       jmenovatel:=zlomek1.Jmenovatel;
       //zlomek1.Free;
       zlomek1:=zlomek.ZlomZDes(StrToFloat(po));
       if zlomek.Napln(citatel*zlomek1.Jmenovatel,jmenovatel*zlomek1.Citatel) then
        result:=true
       else
        result:=false; 
      end;
   end;                                       //if lom=0 else end
  if result then
   zlomek.Zkrat;
 end;

{P�EVODY NA ZLOMEK}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{VZTAHY MEZI ZLOMKY}

function TZlomek.RovnaSe(zlomek:TZlomek):boolean;                                   //rovnost dvou zlomk�
var a,b:integer;
 begin
  result:=false;
  if j<>zlomek.Jmenovatel then
   begin
    a:=c*zlomek.Jmenovatel;
    b:=zlomek.Citatel*j;
    if a=b then
     result:=true;
   end
  else
   if c=zlomek.Citatel then
    result:=true;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TZlomek.Porovnani(zlomek:TZlomek):ShortInt;                                //porovn�n� dvou zlomk�
 var a,b:integer;
 begin
  if self.RovnaSe(zlomek) then
   result:=0
  else
   begin
    if j<>zlomek.Jmenovatel then
     begin
      a:=c*zlomek.Jmenovatel;
      b:=zlomek.Citatel*j;
      if a>b then
       result:=1
      else
       result:=-1;
     end
    else
     if c>zlomek.Citatel then
      result:=1
     else
      result:=-1;
   end;
 end;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{PO�ETN� OPERACE}

procedure TZlomek.Secti(zlomek:TZlomek; var vysl:TZlomek);                          //se�ten� zlomk�, procedura
 begin
  vysl:=TZlomek.Create;
  vysl.Napln(c*zlomek.Jmenovatel+zlomek.Citatel*j,j*zlomek.Jmenovatel);
  vysl.Zkrat;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TZlomek.Secti(zlomek:TZlomek):TZlomek;                                     //se�ten� zlomk�, funkce
 begin
  result:=TZlomek.Create;
  result.Napln(c*zlomek.Jmenovatel+zlomek.Citatel*j,j*zlomek.Jmenovatel);
  result.Zkrat;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TZlomek.Odecti(zlomek:TZlomek; var vysl:TZlomek);                         //ode�ten� zlomk�, procedura
 begin
  vysl:=TZlomek.Create;
  vysl.Napln(c*zlomek.Jmenovatel-zlomek.Citatel*j,j*zlomek.Jmenovatel);
  vysl.Zkrat;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TZlomek.Odecti(zlomek:TZlomek):TZlomek;                                    //ode�ten� zlomk�, funkce
 begin
  result:=TZlomek.Create;
  result.Napln(c*zlomek.Jmenovatel-zlomek.Citatel*j,j*zlomek.Jmenovatel);
  result.Zkrat;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TZlomek.Prinasob(zlomek:TZlomek);                                         //n�soben� zlomkem, procedura
 begin
  self.Napln(c*zlomek.Citatel,j*zlomek.Jmenovatel);
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TZlomek.Nasob(zlomek:TZlomek):TZlomek;                                     //n�soben� zlomkem, funkce
 begin
  result:=TZlomek.Create;
  result.Napln(c*zlomek.Citatel,j*zlomek.Jmenovatel);
// result.Zkrat;  
 end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TZlomek.Nasob(number:real);                                               //n�soben� ��slem
 var zlomek:TZlomek;
 begin
  zlomek:=self.ZlomZDes(number);
  self:=self.Nasob(zlomek);
 end;
 
end.
 
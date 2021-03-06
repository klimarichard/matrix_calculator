unit UMatice;

interface

uses Grids, SysUtils, UZlomky;

type TDynPole = array of TZlomek;

type TMatice = class
      private
       matrix:array of array of TZlomek;

      public
       constructor Create;
       destructor Destroy;

       procedure Vypis(SG:TStringGrid);
       procedure Transponuj;
       procedure Exportuj(FileName:string);

       function Nacti(SG:TStringGrid):boolean;          overload;
       function Nacti(FileName:string):boolean;         overload;
       function Nacti(DynamicArray:TDynPole):boolean;   overload;
       function Secti(matrix2:TMatice; var matrix3:TMatice):boolean;
       function Odecti(matrix2:TMatice; var matrix3:TMatice):boolean;
       function Vynasob(matrix2:TMatice; var matrix3:TMatice):boolean;
       function NasobKonstantou(number:string):boolean;
       function ProhodRadky(RowFrom,RowTo:integer):boolean;
       function ProhodSloupce(ColFrom,ColTo:integer):boolean;
       function Preved:TMatice;
       function PocetRadku:integer;
       function PocetSloupcu:integer;
       function MaximumVeSloupci(ColNumber:integer; var index:integer):boolean;
       function Gauss(var ZmenaZnamenka:boolean; var matrix2:TMatice):boolean; overload;
       function Gauss(var matrix2:TMatice):boolean; overload;
       function MaSoustavaReseni:boolean;
       function VyhodnoceniGauss(var reseni:TDynPole):boolean;
       function Determinant(var Det:TZlomek):boolean;
end;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

implementation

constructor TMatice.Create;                                                       //�AKA!!! �AKA!!!
 begin
  setlength(matrix,1,1);
 end;

//////////////////////////////////////////////////////////////////////////////////////////

destructor TMatice.Destroy;                                                       //BUM!!! BUM!!!
 begin
  setlength(matrix,0,0);
 end;

{CONSTRUCTOR & DESTRUCTOR} 
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{NA�TEN� MATICE}

function TMatice.Nacti(SG:TStringGrid):boolean;                                     //na�ten� z SG
var i,j:integer;
    zlomek:TZlomek;
 begin
  result:=true;
  try
   setlength(matrix,SG.RowCount,SG.ColCount);
   for j:=0 to SG.ColCount-1 do
    for i:=0 to SG.RowCount-1 do
     begin
      if result then
       begin
        zlomek:=TZlomek.Create;
        if zlomek.ZlomZStr(SG.Cells[j,i],matrix[i,j]) then
         result:=true
        else
         result:=false;
       end;  
     end;
  except
   result:=false;
  end;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TMatice.Nacti(FileName:string):boolean;                                   //na�ten� ze souboru
var f:TextFile;
    a,i,j,m,n:integer;
    s,cislo:string;
    zlomek:TZlomek;
 begin
  try
   AssignFile(f,FileName);
   reset(f);
   read(f,m);
   readln(f,n);
   setlength(matrix,m,n);
   for i:=0 to m-1 do
    begin
     readln(f,s);
     for j:=0 to n-2 do
      begin
       if result then
        begin
         a:=pos(' ',s);
         cislo:=copy(s,1,a-1);
         zlomek:=TZlomek.Create;
         if zlomek.ZlomZStr(cislo,matrix[i,j]) then
          result:=true
         else
          result:=false;
         s:=copy(s,a+1,length(s));
        end;
      end;
      if zlomek.ZlomZStr(s,matrix[i,n-1]) then
      result:=true
     else
      result:=false; 
    end;
   CloseFile(f);
  except
   result:=false;
  end;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TMatice.Nacti(DynamicArray:TDynPole):boolean;                             //na�ten� z dynamick�ho pole
 var j:integer;
 begin
  try
   setlength(matrix,1,length(DynamicArray));
   for j:=0 to length(matrix[0])-1 do
    begin
     matrix[0,j]:=TZlomek.Create;
     matrix[0,j]:=DynamicArray[j];
     matrix[0,j].Zkrat;
    end;
   result:=true;
  except
   result:=false;
  end;   
 end;

{NA�TEN� MATICE} 
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{VYPS�N� MATICE}

procedure TMatice.Vypis(SG:TStringGrid);                                          //vyps�n� do SG
var i,j:integer;
 begin
  SG.RowCount:=length(matrix);
  if length(matrix)>0 then
   SG.ColCount:=length(matrix[0])
  else SG.ColCount:=0;
  SG.DefaultColWidth:=(SG.Width div SG.ColCount)-1;
  SG.DefaultRowHeight:=(SG.Height div SG.RowCount)-1; 
  for j:=0 to SG.ColCount-1 do
   for i:=0 to SG.RowCount-1 do
    SG.Cells[j,i]:=matrix[i,j].Vypis;
 end;

{VYPS�N� MATICE} 
////////////////////////////////////////////////////////////////////////////////////////// 
//////////////////////////////////////////////////////////////////////////////////////////

procedure TMatice.Transponuj;                                                     //transponuj matici
 var a,b,i,j:integer;
     r:TZlomek;
 begin
  if length(matrix)>=length(matrix[0]) then
   begin
    a:=length(matrix);
    b:=length(matrix[0]);
    setlength(matrix,a,a);
    for i:=0 to a-1 do
     for j:=i to a-1 do
      begin
       r:=matrix[i,j];
       matrix[i,j]:=matrix[j,i];
       matrix[j,i]:=r;
      end;
    setlength(matrix,b,a);
   end
  else
   begin
    a:=length(matrix);
    b:=length(matrix[0]);
    setlength(matrix,b,b);
    for i:=0 to b-1 do
     for j:=i to b-1 do
      begin
       r:=matrix[i,j];
       matrix[i,j]:=matrix[j,i];
       matrix[j,i]:=r;
      end;
    setlength(matrix,b,a);
   end;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TMatice.NasobKonstantou(number:string):boolean;                           //n�soben� konstantou
 var i,j:integer;
     zlomek,zlomek1:TZlomek;
 begin
  try
   if zlomek.ZlomZStr(number,zlomek) then
    begin
     for i:=0 to length(matrix)-1 do
      for j:=0 to length(matrix[0])-1 do
       begin
        matrix[i,j].Prinasob(zlomek);
       end;
     result:=true;
    end
   else
    result:=false;
  except
   result:=false;
  end;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMatice.Exportuj(FileName:string);                                      //exportov�n� do souboru
 var f:TextFile;
     i,j:integer;
 begin
  AssignFile(f,FileName+'.txt');
  rewrite(f);
  writeln(f,length(matrix),' ',length(matrix[0]));
  for i:=0 to length(matrix)-1 do
   begin
    for j:=0 to length(matrix[0])-2 do
     write(f,matrix[i,j].Vypis,' ');
    write(f,matrix[i,length(matrix[0])-1].Vypis); 
    writeln(f);
   end;
  CloseFile(f); 
 end;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{PROHOZEN� ��DK� & SLOUPC�}

function TMatice.ProhodRadky(RowFrom,RowTo:integer):boolean;                     //prohozen� ��dk�
 var a:TZlomek;
     j:integer;
 begin
  if ((RowFrom>=0) and (RowFrom<=(length(matrix)-1)) and (RowTo>=0) and (RowTo<=(length(matrix)-1))) then
   begin
    for j:=0 to length(matrix[0])-1 do
     begin
      a:=matrix[RowFrom,j];
      matrix[RowFrom,j]:=matrix[RowTo,j];
      matrix[RowTo,j]:=a;
     end;
    result:=true;
   end
  else
   result:=false; 
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TMatice.ProhodSloupce(ColFrom,ColTo:integer):boolean;                   //prohozen� sloupc�
 var a:TZlomek;                                                                      
     i:integer;
 begin
  if ((ColFrom>=0) and (ColFrom<=(length(matrix[0])-1)) and (ColTo>=0) and (ColTo<=(length(matrix[0])-1))) then
   begin
    for i:=0 to length(matrix)-1 do
     begin
      a:=matrix[ColFrom,i];
      matrix[ColFrom,i]:=matrix[ColTo,i];
      matrix[ColTo,i]:=a;
     end;
    result:=true;
   end
  else
   result:=false;   
 end;

{PROHOZEN� ��DK� & SLOUPC�} 
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

{PO�ETN� OPERACE}

function TMatice.Secti(matrix2:TMatice; var matrix3:TMatice):boolean;             //se�ti dv� matice
 var i,j:integer;
 begin
  if ((length(matrix)=length(matrix2.matrix)) and (length(matrix[0])=length(matrix2.matrix[0]))) then
   begin
    matrix3:=TMatice.Create;
    setlength(matrix3.matrix,length(matrix),length(matrix[0]));
    for i:=0 to length(matrix)-1 do
     for j:=0 to length(matrix[0])-1 do
      matrix[i,j].Secti(matrix2.matrix[i,j],matrix3.matrix[i,j]);
    result:=true;  
   end
  else
   result:=false;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TMatice.Odecti(matrix2:TMatice; var matrix3:TMatice):boolean;             //ode�ti dv� matice
 var i,j:integer;
 begin
  if ((length(matrix)=length(matrix2.matrix)) and (length(matrix[0])=length(matrix2.matrix[0]))) then
   begin
    matrix3:=TMatice.Create;
    setlength(matrix3.matrix,length(matrix),length(matrix[0]));
    for i:=0 to length(matrix)-1 do
     for j:=0 to length(matrix[0])-1 do
      matrix[i,j].Odecti(matrix2.matrix[i,j],matrix3.matrix[i,j]);
    result:=true;  
   end
  else
   result:=false;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TMatice.Vynasob(matrix2:TMatice; var matrix3:TMatice):boolean;           //vyn�sob dv� matice
 var i,j,k:integer;
 begin
  if length(matrix[0])=length(matrix2.matrix) then
   begin
    matrix3:=TMatice.Create;
    setlength(matrix3.matrix,length(matrix),length(matrix2.matrix[0]));
    for i:=0 to length(matrix)-1 do
     for j:=0 to length(matrix2.matrix[0])-1 do
      begin
       matrix3.matrix[i,j]:=TZlomek.Create;
       for k:=0 to length(matrix2.matrix)-1 do
        matrix3.matrix[i,j]:=matrix3.matrix[i,j].Secti(matrix[i,k].Nasob(matrix2.matrix[k,j]));
      end;
    result:=true;
   end
  else
   result:=false;
 end;

{PO�ETN� OPERACE} 
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

function TMatice.Preved:TMatice;                                                  //p�eve� matici do jin�
 var i,j:integer;
 begin
  result:=TMatice.Create;
  setlength(result.matrix,length(matrix),length(matrix[0]));
  for i:=0 to length(matrix)-1 do
   for j:=0 to length(matrix[0])-1 do
    result.matrix[i,j]:=matrix[i,j];
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TMatice.PocetRadku:integer;                                              //po�et ��dk�
 begin
  result:=length(matrix);
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TMatice.PocetSloupcu:integer;                                            //po�et sloupc�
 begin
  if PocetRadku>0 then
   result:=length(matrix[0])
  else
   result:=0; 
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TMatice.MaximumVeSloupci(ColNumber:integer; var index:integer):boolean;   //najdi maximum ve sloupci
 var i:integer;
     a,b:TZlomek;
 begin
  if ((ColNumber>=0) and (ColNumber<=(length(matrix[0])-1))) then
   begin
    index:=ColNumber;
    a:=matrix[ColNumber,ColNumber].AbsHod;
    for i:=ColNumber+1 to length(matrix)-1 do
     begin
      b:=matrix[i,ColNumber].AbsHod;
      if b.Porovnani(a)=1 then
       begin
        index:=i;
        a:=b;
       end;
     end;
    result:=true;
   end
  else
   result:=false;    
 end;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{GAUSS}

function TMatice.Gauss(var ZmenaZnamenka:boolean; var matrix2:TMatice):boolean;   //p�evod do Gaussova tvaru
 var max,i,j,k:integer;
     c,zlomek:TZlomek;
 begin
  result:=true;
  ZmenaZnamenka:=false;
  zlomek:=TZlomek.Create;                                                    {v tomto zlomku je nula (v konstruktoru je toto zajisteno)}
  matrix2:=TMatice.Create;
  matrix2:=Preved;                                                          {kopirovani matice}
  for i:=0 to length(matrix2.matrix)-2 do
   begin
    if result then                                                         {jestli maj� prob�hnout dal�� operace}
     begin
      if matrix2.MaximumVeSloupci(i,max) then                                      {nalezen� maxima ve sloupci}
       if not matrix2.matrix[max,i].RovnaSe(zlomek) then
        begin
         if max<>i then
          begin
           if matrix2.ProhodRadky(i,max) then                             {maximum ve sloupci do prvn�ho ��dku}
            ZmenaZnamenka:=not ZmenaZnamenka;
          end;                                                               //if max<>i END
         for j:=i+1 to length(matrix2.matrix)-1 do
          begin
           if matrix2.matrix[i,i].PrevHod then
            begin
             c:=matrix2.matrix[j,i].Nasob(matrix2.matrix[i,i]);              {konstanta pro n�soben� ��dku pro nulov�n�}
             matrix2.matrix[i,i].PrevHod;
             c.Napln(-c.Citatel,c.Jmenovatel);
            end; 
           if c.Porovnani(zlomek)<>0 then
            for k:=i to length(matrix2.matrix[0])-1 do
             matrix2.matrix[j,k]:=matrix2.matrix[j,k].Secti(c.Nasob(matrix2.matrix[i,k]));   {nulov�n� ��dku}
          end;                                                               //for j:=i+1 END
        end                                                                  //if not RovnaSe END
       else
        begin
         result:=false;
         zlomek.Free;
         exit;
        end; 
     end;                                                                   //if result END
   end;
   result:=false;
   for i:=0 to length(matrix2.matrix[0])-1 do
    if not (matrix2.matrix[length(matrix2.matrix)-1,i].RovnaSe(zlomek)) then
     begin
      result:=true;
      break;
     end;
   zlomek.Free;
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TMatice.Gauss(var matrix2:TMatice):boolean;                              //p�evod do Gaussova tvaru bez zm�ny znam�nka
 var a:boolean;
 begin
  result:=Gauss(a,matrix2);
 end;

//////////////////////////////////////////////////////////////////////////////////////////

function TMatice.MaSoustavaReseni:boolean;                                                 //kontrola, jestli ma soustava reseni (tedy jestli neexistuje
 var i,delka:integer;                                                                      //po Gaussovi rovnice napr. ve tvaru 0x+0y=3)
     nulovyZlomek:TZlomek;
 begin
  result:=true;
  delka:=length(matrix)-1;
  nulovyZlomek:=TZlomek.Create;
  for i:=0 to length(matrix[0])-2 do
   begin
    if matrix[delka,i].RovnaSe(nulovyZlomek) then
     continue
    else
     exit;
   end;
  if not (matrix[delka,length(matrix[delka])-1].RovnaSe(nulovyZlomek)) then
   result:=false;
 end;

{GAUSS}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{SOUSTAVA ROVNIC}

function TMatice.VyhodnoceniGauss(var reseni:TDynPole):boolean;                   //vyhodnocen� soustavy rovnic
 var i,j:integer;                                                                 
     a:TZlomek;
     zlomek:TZlomek;
 begin
  result:=true;
  zlomek:=TZlomek.Create;
  setlength(reseni,length(matrix));
  for i:=length(matrix)-1 downto 0 do
   begin
    a:=matrix[i,length(matrix[0])-1];
    for j:=length(matrix[0])-2 downto i+1 do
     begin
      a:=a.Odecti(matrix[i,j].Nasob(reseni[j]));
     end;
    if not matrix[i,i].RovnaSe(zlomek) then
     begin
      if matrix[i,i].PrevHod then
       reseni[i]:=a.Nasob(matrix[i,i]);
     end
    else
     result:=false; 
   end;
 end;

{SOUSTAVA ROVNIC} 
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{DETERMINANT}

function TMatice.Determinant(var Det:TZlomek):boolean;                        //determinant matice
 var a:boolean;
     i:integer;
     matrix2:TMatice;
 begin
  result:=true;
  Det:=TZlomek.Create;
  Det.Napln(1,1);
  if length(matrix)=length(matrix[0]) then
   if Gauss(a,matrix2) then
    begin
     for i:=0 to length(matrix2.matrix)-1 do
      Det:=Det.Nasob(matrix2.matrix[i,i]);
     if a then
      Det.Napln(-Det.Citatel,Det.Jmenovatel);
    end
   else
    begin
     Det.Napln(0,1);
    end
  else
   result:=false;
  matrix2.Free; 
 end;

end.



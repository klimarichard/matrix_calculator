unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, UMatice, UZlomky, UVelikost, Menus, ActnList;

type
  TMaticovac = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    StringGrid2: TStringGrid;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    StringGrid3: TStringGrid;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid4: TStringGrid;
    Button10: TButton;
    Button11: TButton;
    Button13: TButton;
    Button14: TButton;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    Option1: TMenuItem;
    Button15: TButton;
    PopupMenu2: TPopupMenu;
    Pevedomatice1: TMenuItem;
    A1: TMenuItem;
    B1: TMenuItem;
    Exportujmaticidotxt1: TMenuItem;
    Smazat1: TMenuItem;
    Button2: TButton;
    RadioGroup5: TRadioGroup;
    MainMenu1: TMainMenu;
    Soubor1: TMenuItem;
    Zavt1: TMenuItem;
    pravy1: TMenuItem;
    Natizesouboru1: TMenuItem;
    MaticiA1: TMenuItem;
    MaticiB1: TMenuItem;
    Smazat2: TMenuItem;
    MaticiA2: TMenuItem;
    MaticiB2: TMenuItem;
    Vslednoumatici1: TMenuItem;
    PevedoGaussovatvaru1: TMenuItem;
    MaticeA1: TMenuItem;
    MaticeB1: TMenuItem;
    Exportuj1: TMenuItem;
    Determinant1: TMenuItem;
    MaticeA2: TMenuItem;
    MaticeB2: TMenuItem;
    Ve1: TMenuItem;
    Transponuj1: TMenuItem;
    MaticiA3: TMenuItem;
    MaticiB3: TMenuItem;
    Button12: TButton;
    StaticText1: TStaticText;
    Bevel2: TBevel;
    StaticText2: TStaticText;
    Bevel4: TBevel;
    Bevel1: TBevel;
    Button16: TButton;
    Button17: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    ComboBox1: TComboBox;
    StringGrid5: TStringGrid;
    StaticText3: TStaticText;
    Button18: TButton;
    Rovnice1: TMenuItem;
    Poetneznmch1: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    procedure SmazMatici(SG:TStringGrid; Cols,Rows:integer);
    procedure SmazRadek(SG:TStringGrid; row:integer);
    procedure SmazSloupec(SG:TStringGrid; col:integer);
    procedure VelikostSG(SG:TStringGrid; Rows,Cols:integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure Exportujmaticidotxt1Click(Sender: TObject);
    procedure Zavt1Click(Sender: TObject);
    procedure MaticiA1Click(Sender: TObject);
    procedure MaticiB1Click(Sender: TObject);
    procedure MaticiA3Click(Sender: TObject);
    procedure MaticiB3Click(Sender: TObject);
    procedure MaticeA1Click(Sender: TObject);
    procedure MaticeB1Click(Sender: TObject);
    procedure MaticeA2Click(Sender: TObject);
    procedure MaticeB2Click(Sender: TObject);
    procedure Exportuj1Click(Sender: TObject);
    procedure MaticiA2Click(Sender: TObject);
    procedure MaticiB2Click(Sender: TObject);
    procedure Vslednoumatici1Click(Sender: TObject);
    procedure Ve1Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button18Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid5KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure NastavVelikost(Rows,Cols:integer);
  end;

 type TPole=array [1..5] of TLabel;

var
  Maticovac: TMaticovac;
  m1,m2,m3,m4:TMatice;
  sloupec,radek:TPole;
  carka,lomitko:boolean;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

implementation

{$R *.dfm}

procedure TMaticovac.FormCreate(Sender: TObject);                                     //form create
var i:integer;
begin
 m1:=nil;
 m2:=nil;
 m3:=nil;
 m4:=nil;
 sloupec[1]:=Label8;
 sloupec[2]:=Label9;
 sloupec[3]:=Label10;
 sloupec[4]:=Label11;
 sloupec[5]:=Label12;
 radek[1]:=Label15;
 radek[2]:=Label16;
 radek[3]:=Label17;
 radek[4]:=Label18;
 radek[5]:=Label19;
 ComboBox1.ItemIndex:=0;
 StringGrid5.ColCount:=3;
 StringGrid5.RowCount:=2;
 StringGrid5.DefaultColWidth:=31;
 StringGrid5.DefaultRowHeight:=30;
 StringGrid5.Height:=StringGrid5.DefaultRowHeight*StringGrid5.RowCount+2;
 StringGrid5.Width:=StringGrid5.DefaultColWidth*StringGrid5.ColCount+2;
 for i:=1 to 5 do
  begin
   sloupec[i].Hide;
   radek[i].Hide;
  end;
 Label20.Left:=460;
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.FormClose(Sender: TObject; var Action: TCloseAction);            //BUM!!! BUM!!!
begin
 m1.Free;
 m2.Free;
 m3.Free;
 m4.Free;
end;

{FORM CREATE & FORM CLOSE}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{MAZ�N�}

procedure TMaticovac.SmazMatici(SG:TStringGrid; Cols,Rows:integer);                    //sma� string grid
 var i,j:integer;
 begin
  for i:=0 to SG.RowCount-1 do
   for j:=0 to SG.ColCount-1 do
    SG.Cells[j,i]:='';
  VelikostSG(SG,Rows,Cols);  
 end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.SmazRadek(SG:TStringGrid; row:integer);                           //sma� ��dek string gridu
 var j:integer;
 begin
  for j:=0 to SG.ColCount-1 do          
   SG.Cells[j,SG.RowCount-1]:='';
 end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.SmazSloupec(SG:TStringGrid; col:integer);                         //sma� sloupec string gridu
 var i:integer;
 begin
  for i:=0 to SG.RowCount-1 do
   SG.Cells[SG.ColCount-1,i]:='';
 end;

{MAZ�N�}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{VELIKOST STRING GRIDU}

procedure TMaticovac.VelikostSG(SG:TStringGrid; Rows,Cols:integer);                    //velikost string gridu
 begin
  SG.RowCount:=Rows;
  SG.ColCount:=Cols;
  SG.DefaultRowHeight:=(SG.Height div SG.RowCount)-1;
  SG.DefaultColWidth:=(SG.Width div SG.ColCount)-1;
 end;

{VELIKOST STRING GRIDU} 
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{NA�TEN� MATICE}

procedure TMaticovac.Button1Click(Sender: TObject);                                    //na�ti z matice
begin
 if RadioGroup2.ItemIndex=0 then
  begin
   m1:=TMatice.Create;
   if m1.Nacti(StringGrid1) then
    m1.Vypis(StringGrid2)
   else
    ShowMessage('Matice nen� spr�vn� zad�na.');
  end
 else
  begin
   m2:=TMatice.Create;
   if m2.Nacti(StringGrid1) then
    m2.Vypis(StringGrid3)
   else
    ShowMessage('Matice nen� spr�vn� zad�na.');
  end;
 SmazMatici(StringGrid1,4,4);
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button3Click(Sender: TObject);                                   //na�ti ze souboru
begin
 if RadioGroup2.ItemIndex=0 then
  begin
   OpenDialog1.InitialDir:=Application.GetNamePath;
   if OpenDialog1.Execute then
    begin
     m1:=TMatice.Create;
     if m1.Nacti(OpenDialog1.FileName) then
      m1.Vypis(StringGrid2)
     else
      ShowMessage('Matice ze souboru nelze na��st.');
    end;
  end
 else
  begin
   OpenDialog1.InitialDir:=Application.GetNamePath;
   if OpenDialog1.Execute then
    begin
     m2:=TMatice.Create;
     if m2.Nacti(OpenDialog1.FileName) then
      m2.Vypis(StringGrid3)
     else
      ShowMessage('Matice ze souboru nelze na��st.');
    end;
  end;
end;

{NA�TEN� MATICE}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{P�ID�N� & ODEBR�N� ��DK� A SLOUPC�}

procedure TMaticovac.Button4Click(Sender: TObject);                                   //p�idej ��dek (tla��tko)
begin
 if StringGrid1.RowCount<12 then
  begin
   StringGrid1.RowCount:=StringGrid1.RowCount+1;
   StringGrid1.DefaultRowHeight:=(StringGrid1.Height div StringGrid1.RowCount)-1;
  end 
 else ShowMessage('Po�et ��dk� matice v tomto programu nem��e b�t v�t�� ne� 12.');
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button5Click(Sender: TObject);                                   //odeber ��dek (tla��tko)
begin
 if StringGrid1.RowCount>1 then
  begin
   SmazRadek(StringGrid1,StringGrid1.RowCount-1);
   StringGrid1.RowCount:=StringGrid1.RowCount-1;
   StringGrid1.DefaultRowHeight:=(StringGrid1.Height div StringGrid1.RowCount)-1;
  end
 else ShowMessage('Po�et ��dk� matice nem��e b�t men�� ne� 1.');
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button6Click(Sender: TObject);                                   //p�idej sloupec (tla��tko)
begin
 if StringGrid1.ColCount<12 then
  begin
   StringGrid1.ColCount:=StringGrid1.ColCount+1;
   StringGrid1.DefaultColWidth:=(StringGrid1.Width div StringGrid1.ColCount)-1;
  end 
 else ShowMessage('Po�et sloupc� matice v tomto programu nem��e b�t v�t�� ne� 12.');
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button7Click(Sender: TObject);                                   //odeber sloupec (tla��tko)
begin
 if StringGrid1.ColCount>1 then
  begin
   SmazSloupec(StringGrid1,StringGrid1.ColCount-1);
   StringGrid1.ColCount:=StringGrid1.ColCount-1;
   StringGrid1.DefaultColWidth:=(StringGrid1.Width div StringGrid1.ColCount)-1;
  end
 else ShowMessage('Po�et sloupc� matice nem��e b�t men�� ne� 1.');
end;

{P�ID�N� & ODEBR�N� ��DK� A SLOUPC�}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{N�SOBEN� KONSTANTOU}

procedure TMaticovac.Edit1KeyPress(Sender: TObject; var Key: Char);                 //zad�v�n� konstanty do editu
begin
 if (not carka) then
  case key of
   '0'..'9': ;
   ',','.': begin
             if ((Edit1.SelStart>0) and (Edit1.Text[Edit1.SelStart]<>'/')) then
              begin
               key:=',';
               carka:=true;
              end
             else
              key:=#0;
            end;
   #8: begin
        if Edit1.Text<>'' then
         if Edit1.Text[Edit1.SelStart]='/' then
          begin
           key:=#8;
           lomitko:=false;
          end
         else
          key:=#8
        else
         key:=#0;
       end;
   '/': begin
         if ((lomitko=false) and (Edit1.SelStart>0) and (Edit1.Text[Edit1.SelStart]<>',') and (Edit1.Text[Edit1.SelStart+1]<>',')) then
          begin
           key:='/';
           lomitko:=true;
           carka:=false;
          end
         else
          key:=#0;
        end;
  else key:=#0;
  end
 else
  case key of
   '0'..'9': ;
   ',','.': key:=#0;
   #8: begin
        if Edit1.Text<>'' then
         begin
          if Edit1.Text[Edit1.SelStart]=',' then
           begin
            key:=#8;
            carka:=false;
           end;
          if Edit1.Text[Edit1.SelStart]='/' then
           begin
            key:=#8;
            lomitko:=false;
           end;
         end
        else
         key:=#0;
       end;
   '/': begin
         if ((lomitko=false) and (Edit1.SelStart>0) and (Edit1.Text[Edit1.SelStart]<>',') and (Edit1.Text[Edit1.SelStart+1]<>',')) then
          begin
           key:='/';
           lomitko:=true;
           carka:=false;
          end
         else
          key:=#0;
        end;
  else
   key:=#0;
  end;
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button9Click(Sender: TObject);                                   //n�soben� konstantou
begin
 if RadioGroup1.ItemIndex=0 then
  begin
   if m1<>nil then
    try
     m1.NasobKonstantou(Edit1.Text);
     m1.Vypis(StringGrid2);
    except
     ShowMessage('V�mi zadan� ��slo je neplatn�.');
    end
   else
    ShowMessage('Matice A nen� na�tena.');
  end  
 else
  begin
   if m2<>nil then
    try
     m2.NasobKonstantou(Edit1.Text);
     m2.Vypis(StringGrid3);
    except
     ShowMessage('V�mi zadan� ��slo je neplatn�.');
    end
   else
    ShowMessage('Matice B nen� na�tena.'); 
  end;
 Edit1.Text:='';
 carka:=false;
 lomitko:=false;
end;

{N�SOBEN� KONSTANTOU}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{S��T�N� & OD��T�N�}

procedure TMaticovac.Button10Click(Sender: TObject);                               //s��t�n� matic
begin
 if ((m1<>nil) and (m2<>nil)) then
  begin
   if m1.Secti(m2,m3) then
    m3.Vypis(StringGrid4)
   else
    ShowMessage('Matice nejsou stejn�ho typu.');
  end
 else
  ShowMessage('Matice nejsou spr�vn� na�teny.');
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button11Click(Sender: TObject);                               //od��t�n� matic
begin
 if ((m1<>nil) and (m2<>nil)) then
  begin
   if m1.Odecti(m2,m3) then
    m3.Vypis(StringGrid4)
   else
    ShowMessage('Matice nejsou stejn�ho typu.');
  end
 else
  ShowMessage('Matice nejsou spr�vn� na�teny.');  
end;

{S��T�N� & OD��T�N�}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button8Click(Sender: TObject);                               //transponov�n� matice
begin
 if RadioGroup1.ItemIndex=0 then
  if m1<>nil then
   begin
    m1.Transponuj;
    m1.Vypis(StringGrid2);
   end
  else
   ShowMessage('Matice A nen� na�tena.')
 else if m2<>nil then
       begin
        m2.Transponuj;
        m2.Vypis(StringGrid3);
       end
      else
       ShowMessage('Matice B nen� na�tena.'); 
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button13Click(Sender: TObject);                              //n�soben� dvou matic
begin
 if ((m1<>nil) and (m2<>nil)) then
  if m1.Vynasob(m2,m3) then
   begin
    m3.Vypis(StringGrid4);
   end
  else
   ShowMessage('Matice mezi sebou nelze vyn�sobit.')
 else
  ShowMessage('Matice nejsou spr�vn� na�teny.');  
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button14Click(Sender: TObject);                              //exportov�n� do souboru
begin
 if m3<>nil then
  begin
   SaveDialog1.InitialDir:=Application.GetNamePath;
   if SaveDialog1.Execute then
    begin
     m3.Exportuj(SaveDialog1.FileName);
    end;
   SmazMatici(StringGrid4,1,1);
   m3:=nil;
   m3.Free;
  end
 else
  ShowMessage('V�sledn� matice neexistuje.');
end;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{VELIKOST MATICE}

procedure TMaticovac.NastavVelikost(Rows,Cols:integer);                           //nastaven� velikosti matice
begin
 if ((Rows>0) and (Cols>0) and (Rows<=12) and (Cols<=12)) then
  begin
   StringGrid1.RowCount:=Rows;
   StringGrid1.ColCount:=Cols;
   StringGrid1.DefaultRowHeight:=(StringGrid1.Height div StringGrid1.RowCount)-1;
   StringGrid1.DefaultColWidth:=(StringGrid1.Width div StringGrid1.ColCount)-1;
  end
 else
  ShowMessage('Maxim�ln� po�et ��dk� i sloupc� je v tomto programu 12.');
end;

{VELIKOST MATICE}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{GAUSS & DETERMINANT}

procedure TMaticovac.Button15Click(Sender: TObject);                              //zavol�n� Gaussovy metody
begin
 if RadioGroup5.ItemIndex=0 then
  if m1<>nil then
   begin
    if m1.Gauss(m3) then
     begin
      m3.Vypis(StringGrid4);
     end
    else
     ShowMessage('Zadan� matice do Gaussova tvaru nelze p�ev�st, proto�e je singul�rn�.');
   end
  else
   ShowMessage('Matice A nen� na�tena.')
 else
  if m2<>nil then
   begin
    if m2.Gauss(m3) then
     begin
      m3.Vypis(StringGrid4);
     end
    else
     ShowMessage('Zadan� matice do Gaussova tvaru nelze p�ev�st, proto�e je singul�rn�.'); 
   end
  else
   ShowMessage('Matice B nen� na�tena.')
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button2Click(Sender: TObject);                               //spo��t�n� determinantu
var d:TZlomek;                                                                       
begin
 if RadioGroup5.ItemIndex=0 then
  if m1<>nil then
   if m1.Determinant(d) then
    ShowMessage('Determinant matice A je '+d.Vypis)
   else
    ShowMessage('Determinant matice A neexistuje, matice nen� �tvercov�.')
  else
   ShowMessage('Matice A nen� na�tena.')
 else
  if m2<>nil then
   if m2.Determinant(d) then
    ShowMessage('Determinant matice B je '+d.Vypis)
   else
    ShowMessage('Determinant matice B neexistuje, matice nen� �tvercov�.')
  else
   ShowMessage('Matice B nen� na�tena.');
end;

{GAUSS & DETERMINANT}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.A1Click(Sender: TObject);                                    //p�eveden� v�sledku do A
begin
 if m3<>nil then
  begin
   m1:=m3.Preved;
   m1.Vypis(StringGrid2);
   SmazMatici(StringGrid4,1,1);
  end
 else
  ShowMessage('V�sledn� matice neexistuje.');
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.B1Click(Sender: TObject);                                    //p�eveden� v�sledku do B
begin
 if m3<>nil then
  begin
   m2:=m3.Preved;
   m2.Vypis(StringGrid3);
   SmazMatici(StringGrid4,1,1);
  end
 else
  ShowMessage('V�sledn� matice neexistuje.');
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Exportujmaticidotxt1Click(Sender: TObject);                  //export do souboru (pop-up)
begin
 Button14.Click;
end;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{PROCEDURY MENU}

procedure TMaticovac.Zavt1Click(Sender: TObject);                                 //zav�en� formul��e
begin
 Maticovac.Close;
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.MaticiA1Click(Sender: TObject);                              //na�ten� matice A ze souboru
begin
 m1:=TMatice.Create;
  OpenDialog1.InitialDir:=Application.GetNamePath;
  if OpenDialog1.Execute then
   begin
    if m1.Nacti(OpenDialog1.FileName) then
     m1.Vypis(StringGrid2)
    else
     ShowMessage('Matice ze souboru nelze na��st.');
   end;
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.MaticiB1Click(Sender: TObject);                              //na�ten� matice B ze souboru
begin
 m2:=TMatice.Create;
  OpenDialog1.InitialDir:=Application.GetNamePath;
  if OpenDialog1.Execute then
   begin
    if m2.Nacti(OpenDialog1.FileName) then
     m2.Vypis(StringGrid3)
    else
     ShowMessage('Matice ze souboru nelze na��st.'); 
   end;
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.MaticiA3Click(Sender: TObject);                              //transponov�n� matice A
begin
 if m1<>nil then
  begin
   m1.Transponuj;
   m1.Vypis(StringGrid2);
  end
 else
  ShowMessage('Matice A nen� na�tena.');
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.MaticiB3Click(Sender: TObject);                              //transponov�n� matice B
begin
 if m2<>nil then
  begin
   m2.Transponuj;
   m2.Vypis(StringGrid3);
  end
 else
  ShowMessage('Matice B nen� na�tena.');
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.MaticeA1Click(Sender: TObject);                              //Gauss�v tvar matice A
var a:boolean;
begin
 if m1<>nil then
  begin
   if m1.Gauss(a,m3) then
    m3.Vypis(StringGrid4)
   else
    ShowMessage('Matice A do Gaussova tvaru nelze p�ev�st, proto�e je singul�rn�.');
  end
 else
  ShowMessage('Matice A nen� na�tena.');
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.MaticeB1Click(Sender: TObject);                              //Gauss�v tvar matice B
var a:boolean;
begin
 if m2<>nil then
  begin
   if m2.Gauss(a,m3) then
    begin
     m3.Vypis(StringGrid4);
    end
   else
    ShowMessage('Matice B do Gaussova tvaru nelze p�ev�st, proto�e je singul�rn�.');
  end
 else
  ShowMessage('Matice B nen� na�tena.');
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.MaticeA2Click(Sender: TObject);                              //determinant matice A
var d:TZlomek;
begin
 if m1<>nil then
  if m1.Determinant(d) then
   ShowMessage('Determinant matice A je '+d.Vypis)
  else
   ShowMessage('Determinant matice A neexistuje, matice nen� �tvercov�.')
 else
  ShowMessage('Matice A nen� na�tena.');
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.MaticeB2Click(Sender: TObject);                              //determinant matice B
var d:TZlomek;
begin
 if m2<>nil then
  if m2.Determinant(d) then
   ShowMessage('Determinant matice B je '+d.Vypis)
  else
   ShowMessage('Determinant matice B neexistuje, matice nen� �tvercov�.')
 else
  ShowMessage('Matice B nen� na�tena.');
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Exportuj1Click(Sender: TObject);                             //export do souboru
begin
 Button14.Click;
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.MaticiA2Click(Sender: TObject);                              //smaz�n� matice A
begin
 if m1<>nil then
  m1.Free;
 Maticovac.SmazMatici(StringGrid2,1,1);
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.MaticiB2Click(Sender: TObject);                              //smaz�n� matice B
begin
 if m2<>nil then
  m2.Free;
 Maticovac.SmazMatici(StringGrid3,1,1);
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Vslednoumatici1Click(Sender: TObject);                       //smaz�n� v�sledn� matice
begin
 if m3<>nil then
  m3.Free;
 Maticovac.SmazMatici(StringGrid4,1,1);
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Ve1Click(Sender: TObject);                                   //smaz�n� v�ech matic
begin
 MaticiA2.Click;
 MaticiB2.Click;
 Vslednoumatici1.Click;
end;

{PROCEDURY MENU}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button16Click(Sender: TObject);                               //p�eveden� v�sledku do A
begin
 Maticovac.A1.Click;
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button17Click(Sender: TObject);                               //p�eveden� v�sledku do B
begin
 Maticovac.B1.Click;
end;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{ROVNICE}

procedure TMaticovac.ComboBox1Change(Sender: TObject);                                 //z�vislost na po�tu nezn�m�ch
 var i:integer;
begin
 for i:=ComboBox1.ItemIndex+1 to 5 do
  begin
   sloupec[i].Hide;
   radek[i].Hide;
  end;
 if (ComboBox1.ItemIndex+1)>0 then
  for i:=1 to ComboBox1.ItemIndex do
   begin
    sloupec[i].Show;
    radek[i].Show;
   end;
 StringGrid5.ColCount:=ComboBox1.ItemIndex+3;
 StringGrid5.RowCount:=ComboBox1.ItemIndex+2;
 StringGrid5.Height:=StringGrid5.DefaultRowHeight*StringGrid5.RowCount+ComboBox1.ItemIndex+2;
 StringGrid5.Width:=StringGrid5.DefaultColWidth*StringGrid5.ColCount+ComboBox1.ItemIndex+2;
 Label20.Left:=460+ComboBox1.ItemIndex*32;
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.Button12Click(Sender: TObject);                               //vyhodnocen� soustavy rovnic
var a:TDynPole;
    i:integer;
begin
 m4:=TMatice.Create;
 if m4.Nacti(StringGrid5) then
  begin
   if m4.Gauss(m3) then
    begin
     if m3.MaSoustavaReseni then
      begin
       if m3.VyhodnoceniGauss(a) then
        begin
         m4.Nacti(a);
         VelikostSG(StringGrid4,m4.PocetRadku,m4.PocetSloupcu);
         m4.Vypis(StringGrid4);
        end
       else
        ShowMessage('Zadan� soustava nem� jednozna�n� �e�en�.');
      end
     else
      ShowMessage('Zadan� soustava nem� �e�en�.'); 
    end
   else
    ShowMessage('Zadan� soustava nem� jednozna�n� �e�en�.');


   SmazMatici(StringGrid5,3,2);
   StringGrid5.DefaultColWidth:=31;
   StringGrid5.DefaultRowHeight:=30;
   StringGrid5.Height:=StringGrid5.DefaultRowHeight*StringGrid5.RowCount+2;
   StringGrid5.Width:=StringGrid5.DefaultColWidth*StringGrid5.ColCount+2;
   ComboBox1.ItemIndex:=0;
   for i:=1 to 5 do
    begin
     sloupec[i].Hide;
     radek[i].Hide;
    end;
   Label20.Left:=460;
  end
 else
  begin
   ShowMessage('Matice soustavy nen� spr�vn� zad�na');
  end; 
end;

{ROVNICE}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{SMAZ�N� V�SLEDN� MATICE}

procedure TMaticovac.Button18Click(Sender: TObject);
begin
 if m3<>nil then
  begin
   m3.Free;
   m3:=nil;
   SmazMatici(StringGrid4,1,1);
  end
 else
  ShowMessage('V�sledn� matice zat�m neexistuje.');  
end;

{SMAZ�N� V�SLEDN� MATICE}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{MENU - ROVNICE}

procedure TMaticovac.N21Click(Sender: TObject);                                     //2 nezn�m�
begin
 ComboBox1.ItemIndex:=0;
 ComboBox1Change(sender);
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.N31Click(Sender: TObject);                                     //3 nezn�m�
begin
 ComboBox1.ItemIndex:=1;
 ComboBox1Change(sender);
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.N41Click(Sender: TObject);                                     //4 nezn�m�
begin
 ComboBox1.ItemIndex:=2;
 ComboBox1Change(sender);
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.N51Click(Sender: TObject);                                     //5 nezn�m�ch
begin
 ComboBox1.ItemIndex:=3;
 ComboBox1Change(sender);
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.N61Click(Sender: TObject);                                    //6 nezn�m�ch
begin
 ComboBox1.ItemIndex:=4;
 ComboBox1Change(sender);
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.N71Click(Sender: TObject);                                    //7 nezn�m�ch
begin
 ComboBox1.ItemIndex:=5;
 ComboBox1Change(sender);
end;

{MENU - ROVNICE}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
{ZAD�V�N� DO STRING GRID�}

procedure TMaticovac.StringGrid1KeyPress(Sender: TObject; var Key: Char);           //StringGrid - zad�vac�
begin
 case key of
  '0'..'9','/','-',#8: ;
  ',','.': key:=',';
 else
  key:=#0;
 end;
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TMaticovac.StringGrid5KeyPress(Sender: TObject; var Key: Char);          //StringGrid - rovnice
begin
 case key of
  '0'..'9','/','-',#8: ;
  ',','.': key:=',';
 else
  key:=#0; 
 end;
end;

end.

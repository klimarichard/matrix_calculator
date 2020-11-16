unit UVelikost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TVelikost = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    PocetRadku: TLabel;
    PocetSloupcu: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Velikost: TVelikost;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////  

implementation

uses Unit1;

{$R *.dfm}

procedure TVelikost.Button2Click(Sender: TObject);                                 //zavøení formuláøe
begin
 Velikost.Hide;
end;

//////////////////////////////////////////////////////////////////////////////////////////

procedure TVelikost.Button1Click(Sender: TObject);                                 //zmìna velikosti
begin
 Maticovac.NastavVelikost(ComboBox1.ItemIndex+1,ComboBox2.ItemIndex+1);
 Velikost.Hide;
end;

end.

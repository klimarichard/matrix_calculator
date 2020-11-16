program MaticovyKalkulator;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Maticovac},
  UMatice in 'UMatice.pas',
  UZlomky in 'UZlomky.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Maticovac';
  Application.CreateForm(TMaticovac, Maticovac);
  Application.CreateForm(TVelikost, Velikost);
  Application.Run;
end.

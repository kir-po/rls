program PRLS;

uses
  Forms,
  URLS in 'URLS.pas' {Form1},
  UTable in 'UTable.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'RLS';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

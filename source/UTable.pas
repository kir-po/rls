unit UTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, System.Win.ComObj, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    StringGrid2: TStringGrid;
    Button4: TButton;
    SaveDialog1: TSaveDialog;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

  implementation

uses
  URLS;  

{$R *.dfm}

//Пользовательские процедуры:

procedure TForm2.Button1Click(Sender: TObject);
var
  i,j: Integer;
begin
  if man_porog<>0 then ShowMessage('Установите порог на "0"!')
  else
    begin
      for i:=0 to 3199 do
        for j:=0 to 1023 do
          begin
            table[i+1,j+1]:=StrToInt(StringGrid1.Cells[i,j]);
            table_por[i+1,j+1]:=table[i+1,j+1];
          end;
      ShowMessage('Данные внесены в массив');
    end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  with Form1 do
    begin
      FillTable;
      MinMax(table_por,3200,1024);
      ShowMessage('Таблица заполнена');
    end;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  i,j: Integer;
begin
  Form1.NayadaToBussol;
  for i:=0 to 3199 do
    for j:=0 to 1023 do
      begin
        table_por[i+1,j+1]:=table[i+1,j+1]-man_porog;
      end;

  //заполнение грида
  for i:=0 to 3199 do
    for j:=0 to 1023 do
      begin
        StringGrid1.Cells[i,j]:=FloatToStr(table_por[i+1,j+1]);
      end;
  ShowMessage('Загружено!');
end;

procedure TForm2.Button4Click(Sender: TObject);
var
 ExcelApp, Sheet: variant;
 Col, Row: Word;
 ExcelFile: String;
 Counter: Integer;
begin
  ProgressBar1.Position:=0;
  Counter:=0;
  if SaveDialog1.Execute
  then
    begin
      ExcelFile:=SaveDialog1.FileName;
      ProgressBar1.Visible:=True;
    end;
  ExcelApp := CreateOleObject('Excel.Application');
  try
    ExcelApp.Visible := False;
    ExcelApp.Workbooks.Add;
    Sheet := ExcelApp.ActiveWorkbook.Worksheets[1];
    for Col := 1 to 3200 do
      for Row := 1 to 1024 do
        begin
          Sheet.Cells[Row, Col] := table[Col,Row];
           if Col=((3200 div 100)+Counter)
           then
             begin
               Counter:=Counter+(3200 div 100);
               ProgressBar1.Position:=ProgressBar1.Position+1;
             end;
        end;
    ExcelApp.ActiveWorkbook.SaveAs(ExcelFile);
    ProgressBar1.Visible:=False;
    ShowMessage('Сохранено!');
  finally
    ExcelApp.Application.Quit;
    ExcelApp := unassigned;
  end;
end;

end.

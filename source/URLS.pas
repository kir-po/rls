unit URLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UTable, ExtCtrls, StdCtrls, ComCtrls, System.Math;

type
  TMatrixNayada = array [1..4096,1..4096] of Integer;
  TMatrixBig = array [1..3200,1..1024] of Integer;
  TMatrixSmall = array [1..400,1..1024] of Integer;
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    RadioGroup1: TRadioGroup;
    GroupBox3: TGroupBox;
    CheckBox2: TCheckBox;
    TrackBar2: TTrackBar;
    Label3: TLabel;
    TrackBar3: TTrackBar;
    Label4: TLabel;
    CheckBox3: TCheckBox;
    GroupBox4: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    RadioGroup2: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure Ekran();
    procedure FillTable();
    procedure Button1Click(Sender: TObject);
    function ColCalc (var matr: TMatrixSmall; x,y:Integer):TColor;
    procedure MinMax(var matr:TMatrixBig; m,n:Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Porog();
    procedure AutoPorog(az: Integer);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ResizeTable();
    procedure RLI(az,da: Integer);
    procedure NayadaToBussol();
    procedure AutoVARU(window, range: Integer);
    procedure qSort(var A: array of Integer; min, max: Integer);
    procedure CheckBox2Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  nayada_table: TMatrixNayada;
  table: TMatrixBig;
  table_por: TMatrixBig;
  small_table: TMatrixSmall;
  x0,y0,R,G,B: Integer;
  maxM,minM: Integer;             //макс., мин. значение матрицы.
  //RGB1: TColor;
  cvet: TColor;
  rad_ed: Double;
  az:Integer;
  man_porog: Integer;              //ручной порог
  auto_porog: Integer;             //автопорог
  window: Integer;                 //размер окна
  range: Integer;                  //дальность
  minimize: Integer;               //во сколько раз уменьшать
  shkala: Integer;                 //шкала дальности
  MGRC: Integer;                   //максимальный габаритный размер цели

implementation

{$R *.dfm}
//Пользовательские функции:

function TForm1.ColCalc (var matr: TMatrixSmall; x,y:Integer):TColor;
// matr - матрица АЛ и ДД
// x, y - координаты ячейки
// m, n - ширина и длина матрицы
var
  R1,G1,B1:Integer;               //R1,G1,B1 - результирующий цвет.
  XY:Integer;                     //x,y-ое значение матрицы.
  v,Ya,Cb,Cr: Double;             //
begin
  XY:=matr[x,y];
  //преобразуем в YCbCr
  Ya:=XY/(maxM-minM)*255;
  Cb:=-0.1687*R-0.3313*G+0.5*B+128.0;
  Cr:=0.5*R-0.4187*G-0.0813*B+128.0;
  //считаем B
  v:=Ya + 1.772 * (Cb - 128.0);
  if v > 255 then v := 255 else if v < 0 then v := 0;
  B1:=Round(v);
  //считаем G
  v:=Ya - 0.34414 * (Cb - 128.0) - 0.71414 * (Cr - 128.0);
  if v > 255 then v := 255 else if v < 0 then v := 0;
  G1:=Round(v);
  //считаем R
  v:=Ya + 1.402 * (Cr - 128.0);
  if v > 255 then v := 255 else if v < 0 then v := 0;
  R1:=Round(v);
  //Результат
  Result:=RGB(R1, G1, B1);
end;


//Пользовательские процедуры:
procedure TForm1.MinMax(var matr: TMatrixBig; m,n:Integer);
var
  i,j:Integer;                    //Счётчики для поиска макс., мин. зн.
begin
  //находим максимальное и минимальное значение в матрице.
  maxM := matr[1, 1];
  minM := matr[1, 1];
  for i := 1 to m do
    for j := 1 to n do
    begin
      if matr[i, j] < minM then
        minM := matr[i, j];
      if matr[i, j] > maxM then
        maxM := matr[i, j];
    end;
  TrackBar1.Max:=maxM;
end;

procedure TForm1.Ekran();
begin
  with Image1.Canvas do
    begin
      Brush.Color:=clBtnFace;
      Rectangle(0,0,Image1.Width,Image1.Height);
      Brush.Color:=clBlack;
      Ellipse(0,0,Image1.Width,Image1.Height);
    end;
end;

procedure TForm1.FillTable();
var
i,j,max: integer;
begin
  max:=50;
  for i:=0 to 3199 do
    for j:=0 to 1023 do
      begin
        table[i+1,j+1]:=Random(max);
        table_por[i+1,j+1]:=table[i+1,j+1]-man_porog;
        Form2.StringGrid1.Cells[i,j]:=floattostr(table[i+1,j+1]);
      end;
end;

procedure TForm1.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex=0 then
    begin
      with Form1 do
        begin
          Height:=850;
          Width:=1090;
        end;
      with Image1 do
        begin
          Height:=800;
          Width:=800;
        end;
      Ekran;
      GroupBox1.Left:=810;
      GroupBox2.Left:=810;
      GroupBox3.Left:=810;
      GroupBox4.Left:=810;
      RadioGroup2.Left:=810;
      minimize:=8;
      x0:=Round(Image1.Width/2);
      y0:=Round(Image1.Height/2);
    end;
  if RadioGroup2.ItemIndex=1 then
    begin
      with Form1 do
        begin
          Height:=690;
          Width:=935;
        end;
      with Image1 do
        begin
          Height:=640;
          Width:=640;
        end;
      Ekran;
      GroupBox1.Left:=650;
      GroupBox2.Left:=650;
      GroupBox3.Left:=650;
      GroupBox4.Left:=650;
      RadioGroup2.Left:=650;
      minimize:=10;
      x0:=Round(Image1.Width/2);
      y0:=Round(Image1.Height/2);
    end;
end;

procedure TForm1.ResizeTable();
var
  i,j,k: Integer;                       //счётчики
  p_table8: array [1..8] of Double;     //промежуточный массив 8
  p_table10: array [1..10] of Double;   //промежуточный массив 16
begin
  for i:=1 to (3200 div minimize) do
    for j:=1 to 1024 do
      begin
        if minimize=10 then
          begin
            for k:=1 to 10 do
              begin
                p_table10[k]:=table_por[((i-1)*10)+k,j];
              end;
            small_table[i,j]:=Round(Mean(p_table10));
          end;
        if minimize=8 then
          begin
            for k:=1 to 8 do
              begin
                p_table8[k]:=table_por[((i-1)*8)+k,j];
              end;
            small_table[i,j]:=Round(Mean(p_table8));
          end;
      end;
end;

procedure TForm1.Porog();
var
a,b,c,d,i,j,k,l: integer;
begin
  man_porog:=TrackBar1.Position;
  for i:=1 to 3200 do
    for j:=1 to 1024 do
      begin
        table_por[i,j]:=table[i,j]-man_porog;
      end;
  a:=Form2.StringGrid1.LeftCol;
  b:=Form2.StringGrid1.LeftCol+Form2.StringGrid1.VisibleColCount;
  c:=Form2.StringGrid1.TopRow;
  d:=Form2.StringGrid1.TopRow+Form2.StringGrid1.VisibleRowCount;
  for k:=a to b do
    for l:=c to d do
      begin
        Form2.StringGrid1.Cells[k,l]:=FloatToStr(table_por[k+1,l+1]);
      end;
end;

procedure TForm1.AutoPorog(az: Integer);
var
i: Integer;     //счётчик
p_table: array [1..100] of Double;
begin
  //вычисление автопорога
  for i := 3001 to 3100 do p_table[i-3000]:=table[i,az+1];
  if RadioGroup1.ItemIndex=0
  then auto_porog:=Round(Mean(p_table)+(3*StdDev(p_table)))
  else auto_porog:=Round(Mean(p_table));

  //присвоение новых значений
  Label2.Caption:='Значение автопорога: ' + IntToStr(auto_porog);
  for i := 1 to 3200 do
    begin
      table_por[i,az+1]:=table[i,az+1]-auto_porog;
      Form2.StringGrid1.Cells[i-1,az]:=IntToStr(table_por[i,az+1]);
    end;
end;

procedure TForm1.NayadaToBussol();
var
  F: File;                              //файл с аз. лин., дискр. дальн. Наяда-5МП
  StrList: TStringList;                 //список строк
  i,j,k: Integer;                       //счётчики
  sm: Integer;                          //смещение
  p_table: array [1..4] of Integer;     //промежуточный массив
  summ: Double;                         //сумма значений промежуточного массива
begin
  //загружаем файл в StrList
  if OpenDialog1.Execute
  then AssignFile(F,OpenDialog1.FileName)
  else
    begin
      ShowMessage('GoodBye!');
      Exit;
    end;
  StrList:=TStringList.Create;
  StrList.Sorted:=False;
  StrList.Duplicates:=dupIgnore;
  StrList.LoadFromFile(OpenDialog1.FileName);

  //загружаем данные в массив Наяда-5МП
  sm:=0;
  for j:=0 to 4095 do
    for i:=0 to 4103 do
      begin
        if i>7 then nayada_table[i-7,j+1]:=StrToInt('$'+StrList[i+sm]);
        if sm<16805880 then
          begin
            if i=4103 then sm:=sm+4104;
          end;
      end;
  StrList.Destroy;

  //преобразуем в массив Буссоль-С
  for i:=1 to 3200 do
    for j:=1 to 1024 do
      begin
      summ:=0;
        for k:=1 to 4 do
          begin
            p_table[k]:=nayada_table[i,((j-1)*4)+k];
            summ:=summ+p_table[k];
          end;
        table[i,j]:=Round(summ/4);
      end;
end;

procedure TForm1.AutoVARU(window, range: Integer);
var
  p_table: array of Integer;            //промежуточный массив
  mean_table: array [1..100] of Double; //для определения поднимашки
  meanz: Integer;                       //поднимашка

  mean_finish: array [1..40] of Double; //массив для определения среднего для определения конца "волн"
  a_of_means: array [1..80] of Integer; //массив средних значений МОС

  polovina: Integer;                    //половина размера окна - 1
  min_plus: Integer;                    //превышение окном границ массива
  i,j: Integer;                         //счётчики
begin
  if CheckBox3.Checked then
    begin
        //вычисляем дальность отражений от волн
        for i := 1 to 80 do
          begin
            for j := 1 to 40 do
              begin
                mean_finish[j]:=table[j+((i-1)*40),az+1];
              end;
            a_of_means[i]:=Round(Mean(mean_finish));
            Form2.StringGrid2.Cells[0,i-1]:=IntToStr(a_of_means[i]);
            if not (i=1) then
              begin
                if Round(a_of_means[i])>Round(a_of_means[i-1])
                then
                  begin
                    range:=(i-1)*40;
                    Label4.Caption:='Дальность: ' + IntToStr(range);
                    Break
                  end;
              end;


          end;

        //вычисляем размер окна МФ
        window:=Round((2*MGRC)/((shkala*1852)/3200));
        Label3.Caption:='Размер окна: ' + IntToStr(window);
    end;

  //проверяем окно на чётность
  if window mod 2 = 0 then window:=window+1;

  //заполняем окно
  polovina:=Round((window-1)/2);
  SetLength(p_table,window);
  for i := 1 to range do
    begin
      if i>polovina
      then
        begin
          for j := i-polovina to i-1 do
            begin
              p_table[j-i+polovina]:=table[j,az+1];
            end;
        end
      else
        begin
          min_plus:=Abs(i-polovina)+1;
          for j := 1 to min_plus do
            p_table[j-1]:=table[1,az+1];
          if min_plus+1<=polovina then
            begin
              for j := min_plus+1 to polovina do
                begin
                  p_table[j-1]:=table[j,az+1];
                end;
            end;
        end;

      if i+polovina<range then
        begin
          for j := i to i+polovina do
            begin
              p_table[j-i+polovina]:=table[j,az+1];
            end;
        end
      else
        begin
          min_plus:=(i+polovina)-range;
          for j := window-min_plus+1 to window do
            p_table[j-1]:=table[range,az+1];
          for j := polovina+1 to window-min_plus do
            p_table[j-1]:=table[i+j-polovina+1,az+1];
        end;
      //сортируем p_table
      qSort(p_table,0,High(p_table));

      //среднее в линейке
      for j := 3001 to 3100 do mean_table[j-3000]:=table[j,az+1];
      meanz:=Round(Mean(mean_table));

      //заполняем table_por новыми значениями
      if CheckBox1.Checked
      then
        begin
          table_por[i,az+1]:=table[i,az+1]-p_table[polovina+1]+meanz-auto_porog;
        end
      else
        begin
          table_por[i,az+1]:=table[i,az+1]-p_table[polovina+1]+meanz-man_porog;
        end;
    end;


    for i := 1 to 3200 do
    begin
      Form2.StringGrid1.Cells[i-1,az]:=IntToStr(table_por[i,az+1]);
    end;
end;

procedure TForm1.qSort(var A: array of Integer; min, max: Integer);
var i, j, supp, tmp: Integer;
begin
supp:=A[max-((max-min) div 2)];
i:=min; j:=max;
while i<j do
  begin
    while A[i]<supp do i:=i+1;
    while A[j]>supp do j:=j-1;
    if i<=j then
      begin
        tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
        i:=i+1; j:=j-1;
      end;
  end;
if min<j then qSort(A, min, j);
if i<max then qSort(A, i, max);
end;








//Не пользовательские процедуры:
procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.DoubleBuffered:=True;
  minimize:=8;
  shkala:=16;
  MGRC:=150;
  man_porog:=0;
  x0:=Round(Image1.Width/2);
  y0:=Round(Image1.Height/2);
  az:=1;
  rad_ed:=(2*Pi)/1024;
  R:=0;
  G:=50;
  B:=0;
  Ekran;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  a: array [1..3200] of Integer;
  i: Integer;
begin
  for i := 1 to 3200 do a[i]:=table[i,1];
  if SumInt(a)=0 then ShowMessage('Массив пуст!') else
  begin
    MinMax(table,3200,1024);
    Timer1.Enabled:=True;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  da:Integer;
begin
  if CheckBox1.Checked then AutoPorog(az);
  if CheckBox2.Checked then AutoVARU(window,range);
  ResizeTable;
  if az=1024 then az:=0;
  for da:=0 to ((3200 div minimize)-1) do
    begin
      cvet:=ColCalc(small_table,da+1,az+1);
      RLI(az,da);
    end;  
  az:=az+1;
end;

procedure TForm1.RLI(az,da: Integer);
var
  alph,alph0: Double;
  rad_az,rad_alph0,rad_alph: Double;
  delta_y,delta_x,delta_y0,delta_x0: Integer;
begin
  alph0:=az-0.5;
  alph:=1;
  rad_alph0:=rad_ed*alph0;
  rad_alph:=rad_ed*alph;
  rad_az:=rad_ed*az;

  //преобразование в полярные координаты:
  delta_x:=Round(Sin(rad_alph0+rad_alph)*da);
  delta_y:=Round(Cos(rad_alph0+rad_alph)*da);
  delta_x0:=Round(Sin(rad_alph0)*da);
  delta_y0:=Round(Cos(rad_alph0)*da);

  //хитрость:
  if (delta_x=delta_x0) and (delta_y=delta_y0)
  then
    begin
      delta_x:=Round(Sin(rad_az)*da);
      delta_y:=Round(Cos(rad_az)*da);
      with Image1.Canvas do
        begin
          Brush.Color:=cvet;
          Pen.Color:=cvet;
          Ellipse(x0+delta_x-1,y0-delta_y-1,x0+delta_x+1,y0-delta_y+1);
        end;
    end
  else
    begin
      //отрисовка секторов:
      with Image1.Canvas do
        begin
          Pen.Color:=cvet;
          Arc(x0-Round(da),y0-Round(da),x0+Round(da),y0+Round(da),x0+delta_x,y0-delta_y,x0+delta_x0,y0-delta_y0);
        end;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer1.Enabled:=False;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  Label1.Caption:='Значение порога: ' + IntToStr(Round((TrackBar1.Position/maxM)*100));
  Porog;
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
  window:=TrackBar2.Position;
  Label3.Caption:='Размер окна: ' + IntToStr(TrackBar2.Position);
end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
  range:=TrackBar3.Position;
  Label4.Caption:='Дальность: ' + IntToStr(TrackBar3.Position);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    begin
      Label1.Font.Color:=clGray;
      GroupBox1.Enabled:=False;
      TrackBar1.Enabled:=False;
    end
  else
    begin
      GroupBox1.Enabled:=True;
      TrackBar1.Enabled:=True;
      Label1.Font.Color:=clBlack;
      Label2.Caption:='Значение автопорога: -';
      TrackBar1.Position:=auto_porog;
      //Porog;
    end;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    begin
      if not CheckBox3.Checked then TrackBar2.Enabled:=True;
      if not CheckBox3.Checked then TrackBar3.Enabled:=True;
      CheckBox3.Enabled:=True;
      Label3.Caption:='Размер окна: ' + IntToStr(TrackBar2.Position);
      Label4.Caption:='Дальность: ' + IntToStr(TrackBar3.Position);
    end
  else
    begin
      if not CheckBox3.Checked then TrackBar2.Enabled:=False;
      if not CheckBox3.Checked then TrackBar3.Enabled:=False;
      CheckBox3.Enabled:=False;
      Label3.Caption:='Размер окна: -';
      Label4.Caption:='Дальность: -';
      Porog;
    end;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked
  then
      begin
        TrackBar2.Enabled:=False;
        TrackBar3.Enabled:=False;
        Label3.Caption:='Размер окна: ' + IntToStr(window);
        Label4.Caption:='Дальность: ' + IntToStr(range);
      end
  else
      begin
        if CheckBox2.Checked then TrackBar2.Enabled:=True;
        if CheckBox2.Checked then TrackBar3.Enabled:=True;
        Label3.Caption:='Размер окна: ' + IntToStr(window);
        Label4.Caption:='Дальность: ' + IntToStr(range);
        Porog;
      end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form2.Show;
end;

end.

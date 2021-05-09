unit CalcCol;

interface
  function Color(matr of array; x,y,n,R,G,B of Integer):TColor;

implementation
  function Color(matr:Array;x,y,n,R,G,B:Integer):TColor;
    begin
      ShowMessage('Работает!')
    end;

end.

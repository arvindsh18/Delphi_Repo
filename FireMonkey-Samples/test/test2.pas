unit DecisionDBCalc;
 
interface
 
uses
  System.SysUtils, Data.DB, Data.Win.ADODB, Vcl.Dialogs;
 
procedure ProcessStudentScore(StudentID: Integer);
 
implementation
 
procedure ProcessStudentScore(StudentID: Integer);
var
  Query: TADOQuery;
  Score1, Score2, Total: Integer;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.ConnectionString := 'Provider=SQLOLEDB;Data Source=YourServer;Initial Catalog=YourDB;Integrated Security=SSPI;';
    Query.SQL.Text := 'SELECT Score1, Score2 FROM StudentScores WHERE StudentID = :ID';
    Query.Parameters.ParamByName('ID').Value := StudentID;
    Query.Open;
 
    // Decision node: check if record exists
    if not Query.Eof then
    begin
      Score1 := Query.FieldByName('Score1').AsInteger;
      Score2 := Query.FieldByName('Score2').AsInteger;
 
      // Calculation node
      Total := Score1 + Score2;
 
      // Decision node: evaluate result
      if Total >= 100 then
        ShowMessage('Student passed with total score: ' + IntToStr(Total))
      else
        ShowMessage('Student failed with total score: ' + IntToStr(Total));
    end
    else
      ShowMessage('No record found for StudentID: ' + IntToStr(StudentID));
  finally
    Query.Free;
  end;
end;
 
end.
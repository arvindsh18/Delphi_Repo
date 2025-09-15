unit StudentEvaluator;

interface

uses
  System.SysUtils, Data.DB, Data.Win.ADODB, Vcl.Dialogs;

procedure EvaluateStudentPerformance(StudentID: Integer);

implementation

procedure EvaluateStudentPerformance(StudentID: Integer);
var
  Query: TADOQuery;
  Score1, Score2, Total: Integer;
begin
  Query := TADOQuery.Create(nil);
  try
    //DB Call: Connect and query student scores
    Query.ConnectionString := 'Provider=SQLOLEDB;Data Source=YourServer;Initial Catalog=YourDB;Integrated Security=SSPI;';
    Query.SQL.Text := 'SELECT Score1, Score2 FROM StudentScores WHERE StudentID = :ID';
    Query.Parameters.ParamByName('ID').Value := StudentID;
    Query.Open;

    //Decision Node: Check if student record exists
    if not Query.Eof then
    begin
      Score1 := Query.FieldByName('Score1').AsInteger;
      Score2 := Query.FieldByName('Score2').AsInteger;

      // Calculation Node: Compute total score
      Total := Score1 + Score2;

      // Decision Node: Evaluate performance
      if Total >= 100 then
        ShowMessage('Student passed with total score: ' + IntToStr(Total))
      else if Total >= 50 then
        ShowMessage('Student needs improvement. Total score: ' + IntToStr(Total))
      else
        ShowMessage('Student failed. Total score: ' + IntToStr(Total));
    end
    else
      ShowMessage('No record found for StudentID: ' + IntToStr(StudentID));
  finally
    Query.Free;
  end;
end;

end.

unit ExternalCallExample;

interface

uses
  System.SysUtils, ExternalUnit;

type
  TExternalCallClass = class
  public
    procedure Execute;
  end;

implementation

procedure TExternalCallClass.Execute;
var
  ResultText: string;
begin
  // Calling a method from an external unit
  ResultText := ExternalFunction('Delphi') + ExternalCall(A, 'Value2') + ExternalCall2() + 'Value1';
  Writeln('Result from external function: ', ResultText);
end;

end.

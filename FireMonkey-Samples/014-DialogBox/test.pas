

unit MyUnit;

interface

uses
  System.SysUtils, System.Classes, FMX.DialogService;

implementation

procedure Test;
begin
  SomeMethod(
    procedure
    begin
      ShowMessage('Hello');
    end);
end;

end.
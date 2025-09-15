unit CLIAndGUIExample;
interface
uses
 System.SysUtils, FMX.Forms, FMX.StdCtrls, FMX.Controls, FMX.Types, FMX.Dialogs;
type
 TCLIAndGUIExample = class(TForm)
   Button1: TButton;
   Edit1: TEdit;
   CheckBox1: TCheckBox;
   ComboBox1: TComboBox;
   procedure Button1Click(Sender: TObject);
 private
   procedure HandleCLIInput;
   procedure HandleGUIInput;
 public
   procedure Execute;
 end;
var
 CLIAndGUIExample: TCLIAndGUIExample;
implementation
{$R *.fmx}
procedure TCLIAndGUIExample.HandleCLIInput;
var
 UserName: string;
 Age: Integer;
begin
 Write('Enter your name: ');
 ReadLn(UserName);
 Write('Enter your age: ');
 ReadLn(Age);
 Writeln('Hello ', UserName, '! You are ', Age, ' years old.');
end;
procedure TCLIAndGUIExample.HandleGUIInput;
var
 InputText: string;
 SelectedIndex: Integer;
 CheckedValue: Boolean;
begin
 InputText := Edit1.Text;
 SelectedIndex := ComboBox1.ItemIndex;
 CheckedValue := CheckBox1.IsChecked;
 ShowMessage('Text: ' + InputText +
             ', Selected Index: ' + SelectedIndex.ToString +
             ', Checked: ' + BoolToStr(CheckedValue, True));
end;
procedure TCLIAndGUIExample.Button1Click(Sender: TObject);
begin
 HandleGUIInput;
end;
procedure TCLIAndGUIExample.Execute;
begin
 HandleCLIInput;
 Application.Initialize;
 Application.CreateForm(TCLIAndGUIExample, CLIAndGUIExample);
 Application.Run;
end;
end.
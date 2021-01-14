unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uGlobalHelper, Stringy, HotLog;

type
  TForm1 = class(TACustForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  myHotLog : THotLog;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
   myText   : TStringy;      // Define a TStringy variable
   count    : Integer;       // Holds return value from TStringy method calls
   position : Integer;       // Gives the position during string searching
 begin
   self.Color := clTeal;


   myHotLog := THotLog.Create;
   myhotlog.StartLogging;
   myhotlog.Add('Started');



   // Create an instance of the TStringy class, with our desired text string
   // Note that we have added TAB (#11),Carriage return (#13) and Line Feed (#10)
   // characters to the string. These are recognised as word separators
   myText := TStringy.Create('The big fat cat sat'+#13#9+'on the'+#13+'BIG mottled mat');
   myhotlog.Add(myText.Text);

   // Show the number of words in our string:
   ShowMessage('Word count = '+IntToStr(myText.WordCount));
   myhotlog.Add('Word count = '+IntToStr(myText.WordCount));

   // Set up a new string to work on.
   // This illustrates a 'write' property (WordCount can only be read)
   myText.Text := 'In an enriched time there was a Rich man, with a rich sister';

   // How many words in our new string?
   ShowMessage('Word count now = '+IntToStr(myText.WordCount));

   // Try to replace the word 'rich' with the word 'desolate'
   count := myText.Replace('rich','desolate');

   // How did the string replace get on?
   ShowMessage('rich was replaced '+IntToStr(count)+' times');
   ShowMessage(myText.Text);

   // Now try to find the string 'rich' - it is no longer in the string
   position := myText.FindFirst('rich');
   if position > 0
   then ShowMessage('''rich'' first index = '+IntToStr(position))
   else ShowMessage('''rich'' was not found in the string now');

   // We'll restore the string and look for all occurences of 'rich'
   // Notice how the myText object remembers where it is in the following
   // sequence of calls. This is a huge benefit of object orientation.
   myText.Text := 'In an enriched time there was a Rich man, with a rich sister';
   position := myText.FindFirst('rich');

   while position > 0 do
   begin
     ShowMessage('''rich'' found at index : '+IntToStr(position));
     // Find the next occurence
     // Notice that myText also remembers the search string - we do not have
     // to keep providing it.
     position := myText.FindNext;
   end;

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  myhotlog.Add('Form Destroy');
  myHotLog.Destroy;
end;

end.

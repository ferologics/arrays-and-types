unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
const male  :boolean= true;
      female:boolean= false;
      size  :integer= 1;  //2 .... -.-
type  Person = record
                  name      : string;
                  sureName  : string;
                  age       : integer;
                  gender    : boolean;
                  phone     : string;
               end;
      p = array[0..1] of Person;
var per:Person;
    i:integer;
    personDatabase:p;
procedure fillDatabase(size:integer;var person:Person; database:p; nm:string;snm:string;ag:integer; gd:boolean; ph:string);
begin
    person.name:= nm;
    person.sureName:= snm;
    person.age:= ag;
    person.gender:= gd;
    person.phone:= ph;
    //setlength(database,size);
    for i:=0 to size do
        begin
          database[i]:=person;
        end;
end;
procedure TForm1.Button1Click(Sender: TObject);
var namee, sureName, phone:string;
    age, size:integer;
    gender:boolean;
begin
   namee   := Form1.Edit1.Text;
   sureName:= Form1.Edit2.Text;
   age     := StrToIntDef(Form1.Edit3.Text,0);
   if      (Form1.Edit4.Text = 'male')   then gender:= male
   else if (Form1.Edit4.Text = 'female') then gender:= female;
   phone   := Form1.Edit5.Text;

   fillDatabase(size, per, personDatabase, namee, sureName, age, gender, phone);

   size+=1;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  for i:=0 to size do
      Form1.Memo1.Lines.Add(personDatabase[i].name);
      Form1.Memo1.Lines.Add(personDatabase[i].sureName);
      Form1.Memo1.Lines.Add(IntToStr(personDatabase[i].age));
      Form1.Memo1.Lines.Add(BoolToStr(personDatabase[i].gender));
      Form1.Memo1.Lines.Add(personDatabase[i].phone);
end;

end.


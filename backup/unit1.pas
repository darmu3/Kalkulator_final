unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

type
  CompInfo=record
    index,top,left,width,height,fontsize:integer;
  end;
  complist=array of CompInfo;

  { TForm1 }


  TForm1 = class(TForm)
    ButtonSum: TButton;
    ButtonMinus: TButton;
    ButtonMult: TButton;
    ButtonDiv: TButton;
    Button16: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button31: TButton;
    Edit1: TEdit;
    procedure ButtonSumClick(Sender: TObject);
    procedure ButtonMinusClick(Sender: TObject);
    procedure ButtonMultClick(Sender: TObject);
    procedure ButtonDivClick(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private
    { private declarations }
    DefWidth,defHeight:integer;
    clist:complist;
  public
    { public declarations }

  end;

var
  Form1: TForm1;
  ch1, ch2, rez: real;
  znak: char;

implementation
uses math;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
  defwidth:=width;
  defheight:=height;
  for i:= 0 to ComponentCount-1 do
    if (Components[i].Classname = 'TRadioButton')
    or (Components[i].Classname ='TCheckBox')
    or (Components[i].Classname ='TButton')
    or (Components[i].Classname ='TBitBtn')
    or (Components[i].Classname ='TSpeedButton')
    or (Components[i].Classname ='TEdit')
    or (Components[i].Classname ='TRadioGroup')
    or (Components[i].Classname ='TCheckGroup')
    or (Components[i].Classname ='TListBox')
    or (Components[i].Classname ='TComboBox')
    or (Components[i].Classname ='TEdit')
    or (Components[i].Classname ='TSpinEdit')
    or (Components[i].Classname ='TLabel') then begin
      setlength(clist,Length(clist)+1);
      clist[Length(clist)-1].top:=(Components[i] as tcontrol).top;
      clist[Length(clist)-1].left:=(Components[i]as tcontrol).left;
      clist[Length(clist)-1].width:=(Components[i] as tcontrol).width;
      clist[Length(clist)-1].height:=(Components[i]as tcontrol).height;
      clist[Length(clist)-1].fontsize:=(Components[i]as tcontrol).font.Size;
      clist[Length(clist)-1].index:=i;
    end;
end;

procedure TForm1.FormResize(Sender: TObject);
var i:integer;
begin
  if width >1000 then width:=800;
  if width<150   then width:=250;
  if height>800 then height:=800;
  if height<150 then height:=250;
  For i:=0 to length(clist)-1 do begin
    (components[clist[i].index] as tcontrol).Top:=round(clist[i].top*height/defheight);
    (components[clist[i].index] as tcontrol).height:=round(clist[i].height*height/defheight);
    (components[clist[i].index] as tcontrol).left:=round(clist[i].left*width/defwidth);
    (components[clist[i].index] as tcontrol).width:=round(clist[i].width*width/defwidth);
    (components[clist[i].index] as tcontrol).font.Size:=round(clist[i].fontsize*min(width/defwidth,height/defheight));
  end;
end;



procedure TForm1.Button20Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '1';
end;

procedure TForm1.Button19Click(Sender: TObject);
var j, i:string;
begin
  j:=Edit1.Text;
  if j <> '' then Delete(j, Length(j), 1);
  Edit1.Text:=j;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  Edit1.Clear;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  if Edit1.Text = '' then abort;
  ch1 := StrToFloat(Edit1.Text);
  if ch1 > 0 then
  rez := sqrt(ch1);
  Edit1.Text:=FloatToStr(rez);
  if ch1<0 then Edit1.Text:='';
end;

procedure TForm1.ButtonSumClick(Sender: TObject);
begin
  if Edit1.Text = '' then abort;
  ch1:=StrToFloat(Edit1.Text);
  znak:= '+';
  Edit1.Clear;
end;


procedure TForm1.ButtonMinusClick(Sender: TObject);
begin
  if Edit1.Text = '' then abort;
  ch1:=StrToFloat(Edit1.Text);
  znak:= '-';
  Edit1.Clear;
end;

procedure TForm1.ButtonMultClick(Sender: TObject);
begin
  if Edit1.Text = '' then abort;
  ch1:=StrToFloat(Edit1.Text);
  znak:= '*';
  Edit1.Clear;
end;

procedure TForm1.ButtonDivClick(Sender: TObject);
begin
  if Edit1.Text = '' then abort;
  ch1:=StrToFloat(Edit1.Text);
  znak:= '/';
  Edit1.Clear;
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '2';
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '3';
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '4';
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '5';
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '6';
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '7';
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '8';
end;

procedure TForm1.Button28Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '9';
end;

procedure TForm1.Button29Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '0';
end;

procedure TForm1.Button31Click(Sender: TObject);
begin
  if Edit1.Text = '' then abort;
  ch2 := StrToFloat(Edit1.Text);
  Edit1.Clear;
  if znak = '+' then
  begin
    rez := ch1 + ch2;
  end;
  if znak = '-' then
  begin
    rez := ch1 - ch2;
  end;
  if znak = '*' then
  begin
    rez := ch1 * ch2;
  end;
  if znak = '/' then
  begin
    if ch2 = 0 then begin ShowMessage('Деление на ноль невозможно!'); Abort; end;
    rez := ch1 / ch2;
  end;
  Edit1.Text:= FloatToStr(rez);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  Edit1.MaxLength:=13;
end;








end.


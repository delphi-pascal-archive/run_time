unit RunTimeUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, ColorGrd;

type
  TForm1 = class(TForm)
    MainMenu: TMainMenu;
    pmComponent: TPopupMenu;
    pmTag1: TMenuItem;
    pmTag2: TMenuItem;
    PanelTest: TPanel;
    Panel2: TPanel;
    rgComponents: TRadioGroup;
    N3: TMenuItem;
    AllColor: TMenuItem;
    Tag12: TMenuItem;
    Tag22: TMenuItem;
    N6: TMenuItem;
    miAllClear: TMenuItem;
    N8: TMenuItem;
    TEdit1: TMenuItem;
    TCheckBox1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    ColorGrid: TColorGrid;
    miCheckBox: TMenuItem;
    miChecked: TMenuItem;
    N9: TMenuItem;
    Label1: TLabel;
    N4: TMenuItem;
    pmLine: TMenuItem;
    pmNewMessage: TMenuItem;
    procedure PanelTestDblClick(Sender: TObject);
    procedure pmTag1Click(Sender: TObject);
    procedure pmTag2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure AllColorClick(Sender: TObject);
    procedure miCheckBoxClick(Sender: TObject);
    procedure miCheckedClick(Sender: TObject);
    procedure miAllClearClick(Sender: TObject);
    procedure pmComponentPopup(Sender: TObject);
    procedure ControlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ControlMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pmNewMessageClick(Sender: TObject);
  private
    { Private declarations }
    DragPoint : TPoint;
    procedure OnClickButton(Sender: TObject );
    procedure ClearComponent(TypeClass: integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

type
 TListClass=array[0..3] of TControlClass;

Const
 ListClass: TListClass=(TEdit,TButton,TCheckBox,TLabel);

//       Создаем  компонент текущего типа
procedure TForm1.PanelTestDblClick(Sender: TObject);
const
 no:integer=0;
var
 TypeClass: TControlClass;
 New: TControl;
 Point: TPoint;
 MessTag: PChar;
begin
 if (rgComponents.ItemIndex>=0) and
            (rgComponents.ItemIndex<rgComponents.Items.Count)
 then
  begin
   // Получаем ссылку на выбранный класс
   TypeClass:=TControlClass(ListClass[rgComponents.ItemIndex]);
   inc(no);  // увеличиваем счетчик компонент
   // Cоздаем компонент - вызываем конструктор выбранного класса
   New:=TypeClass.Create(PanelTest);
   Point:=PanelTest.ScreenToClient(Mouse.CursorPos);
   New.Top:=Point.y;
   New.Left:=Point.x;
   TLabel(New).OnMouseDown:=ControlMouseDown;
   TLabel(New).OnMouseMove:=ControlMouseMove;
   // Имя = название класса + номер нового компонента
   // Если не задавать имя, необходимо явно задать
   // свойства Text для TEdit и Сaption для остальных
   New.Name:=New.ClassName+IntToStr(No);
   if TypeClass=TButton
   then
    begin
     TButton(New).OnClick:=OnClickButton;
     GetMem(MessTag, Length('Нажата кнопка №'+IntToStr(no))+1);
     StrCopy(MessTag, PChar('Нажата кнопка №'+IntToStr(no)));
     TButton(New).Tag:=LongInt(MessTag);
    end
   else New.Tag:=1;
   TEdit(New).PopupMenu:=pmComponent;
   New.Parent:=PanelTest;
  end;
end;

procedure TForm1.pmTag1Click(Sender: TObject);
begin
 pmComponent.PopUpComponent.Tag:=1;
end;

procedure TForm1.pmTag2Click(Sender: TObject);
begin
 pmComponent.PopUpComponent.Tag := 2;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 if (pmComponent.PopUpComponent is TButton)
 then FreeMem(Ptr(TButton(pmComponent.PopUpComponent).Tag));
 pmComponent.PopUpComponent.Free;
end;

Procedure TForm1.OnClickButton(Sender: TObject );
var
 value: string;
begin
 value:=PChar(Ptr(TButton(Sender).Tag));
 MessageDlg(Value ,mtInformation,[mbOk],0);
end;

// Изменение цвета шрифта у компонентов
procedure TForm1.AllColorClick(Sender: TObject);
var
 i: integer;
begin
 if TControl(Sender).Tag=0
 then
  for i:=0 to PanelTest.ControlCount-1 do
   TEdit(PanelTest.Controls[i]).Font.Color:=ColorGrid.ForegroundColor
 else
  for i:=0 to PanelTest.ControlCount-1 do
   if TWinControl(PanelTest.Controls[i]).Tag=TControl(Sender).Tag
   then TEdit(PanelTest.Controls[i]).Font.Color:=ColorGrid.ForegroundColor;
end;

procedure TForm1.miCheckBoxClick(Sender: TObject);
var
 Item: TMenuItem;
 i: integer;
begin
 // очищаем  список
 for i:=TMenuItem(Sender).Count-1 downto 2 do
  TMenuItem(Sender).Delete(i);
 // Формируем меню по текущему списку CheckBox'ов
 for i:=0 to PanelTest.ControlCount-1 do
 if (PanelTest.Controls[i] is  TCheckBox)
 then
  begin
   Item:=NewItem( TCheckBox(PanelTest.Controls[i]).Caption, 0,
                             False, True, miCheckedClick, 0, '');
   TMenuItem(Sender).Add(Item);
   Item.Tag:=LongInt(PanelTest.Controls[i]);
  end;
end;

procedure TForm1.miCheckedClick(Sender: TObject);
var
 i: integer;
begin
 if TMenuItem(Sender).Tag=0
 then
  begin
   for i:=0 to PanelTest.ControlCount-1 do
   if (PanelTest.Controls[i] is TCheckBox)
   then TCheckBox(PanelTest.Controls[i]).Checked:=True
  end
 else TCheckBox(Ptr(TMenuItem(Sender).Tag)).Checked:=True;
end;

procedure TForm1.miAllClearClick(Sender: TObject);
var
 i: integer;
begin
 iF TMenuItem(Sender).Tag=0
 then
  begin
   for i:=0 to PanelTest.ControlCount-1 do
    if not (PanelTest.Controls[i] is TButton) and
                        not (PanelTest.Controls[i] Is TLabel)
    then
     begin
      if (PanelTest.Controls[i] is TEdit)
      then TEdit(PanelTest.Controls[i]).Text:=''
      else TCheckBox(PanelTest.Controls[i]).Checked:=False;
     end;
  end
 else ClearComponent(TMenuItem(Sender).Tag);
end;

procedure TForm1.pmComponentPopup(Sender: TObject);
begin
 pmTag1.Checked:=TPopupMenu(Sender).PopupComponent.Tag=1;
 pmTag2.Checked:=not pmTag1.Checked;
 pmLine.Visible:=TPopupMenu(Sender).PopupComponent Is TButton;
 pmNewMessage.Visible:=pmLine.Visible;
end;

Procedure TForm1.ClearComponent( TypeClass : Integer);
var
 i: integer;
begin
 if TypeClass=2
 then
  for i:=0 to PanelTest.ControlCount-1 do
   begin
    if (PanelTest.Controls[i] Is TCheckBox)
    then TCheckBox(PanelTest.Controls[i]).Checked:=False
   end
 else
  for i:=0 to PanelTest.ControlCount-1 do
   begin
    if  (PanelTest.Controls[i] Is TEdit)
    then TEdit(PanelTest.Controls[i]).Text:=''
   end;
end;

procedure TForm1.ControlMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 DragPoint:=Point(x,y);
end;

procedure TForm1.ControlMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if (ssLeft in Shift)
 then
  begin
   TControl(Sender).Left:=TControl(Sender).Left+x-DragPoint.x;
   TControl(Sender).Top:=TControl(Sender).Top+y-DragPoint.y;
  end;
end;

procedure TForm1.pmNewMessageClick(Sender: TObject);
var
 Value  : string;
 MessTag: PChar;
begin
 MessTag:=PChar(TButton(pmComponent.PopupComponent).Tag);
 Value:=MessTag;
 if InputQuery('Сменить сообщение',
   'Для кнопки '+TButton(pmComponent.PopupComponent).Name, Value)
 then
  begin
   FreeMem(MessTag);
   GetMem(MessTag , Length(Value)+1);
   StrCopy(MessTag , PChar(Value));
   TButton(pmComponent.PopupComponent).Tag:=LongInt(MessTag);
  end;
end;

end.


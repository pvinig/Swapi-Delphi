unit swapi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls,
  REST.Response.Adapter, Vcl.DBCtrls, Vcl.ComCtrls,ShellAPI,Richedit ;

type
  TForm1 = class(TForm)
    SWAPI: TLabel;
    Buscar: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Edit1: TEdit;
    RichEdit1: TRichEdit;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    procedure BuscarClick(Sender: TObject);
    procedure WndProc(var Message: TMessage); override;
    procedure RichEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
const
    api ='https://swapi.dev/api/';
var
    mask: Word;
procedure TForm1.RichEdit1Change(Sender: TObject);
begin
    mask := SendMessage(RichEdit1.Handle, EM_GETEVENTMASK, 0, 0);
    SendMessage(RichEdit1.Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);
    SendMessage(RichEdit1.Handle, EM_AUTOURLDETECT, Integer(True), 0);

end;

procedure TForm1.BuscarClick(Sender: TObject);
begin

    RichEdit1.Clear;
    RichEdit1.Lines.Add(' ');
    RESTClient1.BaseURL := api + Edit1.Text;
    RESTRequest1.Execute;
    RichEdit1.Lines.insert(0,RESTRequest1.Response.JSONText);

end;

procedure TForm1.WndProc(var Message: TMessage);
var
  buttonPointer: TENLink;
  url, endPoint: string;
begin
  if (Message.Msg = WM_NOTIFY) then
  begin
    if (PNMHDR(Message.lParam).code = EN_LINK) then
    begin
      buttonPointer := TENLink(Pointer(TWMNotify(Message).NMHdr)^);
      if (buttonPointer.Msg = WM_LBUTTONDOWN) then
      begin
        SendMessage(RichEdit1.Handle, EM_EXSETSEL, 0, Longint(@(buttonPointer.chrg)));
        url := RichEdit1.SelText.SubString(26);
          url := Copy(url,0,length(url)-2);
        endPoint := stringReplace(url,'\','',[rfReplaceAll, rfIgnoreCase]);

        RichEdit1.Clear;
        RichEdit1.SelStart := 0;
        RESTClient2.BaseURL := api + endPoint;
        RESTRequest2.Execute;
        RichEdit1.Lines.insert(0,RESTRequest2.Response.JSONText);
      end;
    end;
  end;
  inherited;

end;
end.


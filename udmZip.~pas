unit udmZip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, KAZip;

type
  TForm1 = class(TForm)
    KAZip1: TKAZip;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button3: TButton;
    OpenDialog2: TOpenDialog;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    function RemoveAcentos(Str: String): String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  cont: integer;
begin
  if OpenDialog1.Execute then
  begin
    Memo1.Lines.Clear;
    for cont := 0 to OpenDialog1.Files.Count - 1 do
    begin
      Memo1.Lines.Add(OpenDialog1.Files[cont]);
    end;
    ShowMessage('Arquivos adicionados!');
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  nomeArquivo: string;
  nomeFinal: string;
  cont: integer;
begin
  if (Pos('/', Memo1.Lines[0]) > 0) or (Pos('\', Memo1.Lines[0]) > 0) then
  begin
    if SaveDialog1.Execute then
    begin
      KAZip1.CreateZip(SaveDialog1.FileName);
      KAZip1.Open(SaveDialog1.FileName);

      for cont := 0 to OpenDialog1.Files.Count - 1 do
      begin
        if (Pos('/', Memo1.Lines[cont]) > 0) or (Pos('\', Memo1.Lines[cont]) > 0) then
        begin
          nomeArquivo := RemoveAcentos(ExtractFileName(Memo1.Lines[cont]));
          KAZip1.AddFile(OpenDialog1.Files[cont], nomeArquivo);
        end
        else
          ShowMessage('Arquivo: ' + Memo1.Lines[cont] + ' n„o encontrado');
      end;
      ShowMessage('Exportado com sucesso!');
      KAZip1.Close;
    end;
  end
  else
    ShowMessage('Para exportar selecione a opÁ„o de ADICIONAR.');
end;

function TForm1.RemoveAcentos(Str: String): String;
const ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹/\';
      SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU__';
var x : Integer;
begin
  for x := 1 to Length(Str) do
  begin
    if Pos(Str[x],ComAcento)<>0 Then
    begin
      Str[x] := SemAcento[Pos(Str[x],ComAcento)];
    end;
  end;
  Result := Str;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  cont: integer;
begin
  if OpenDialog2.Execute then
  begin
    Memo1.Lines.Clear;
    KAZip1.Open(OpenDialog2.FileName);

    for cont := 0 to KAZip1.Entries.Count - 1 do
    begin
      Memo1.Lines.Add(KAZip1.Entries.Items[cont].FileName);
    end;

    ShowMessage('Importado com sucesso');
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  KAZip1.Free;
end;

end.

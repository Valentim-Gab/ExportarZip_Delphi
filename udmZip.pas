unit udmZip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, KAZip, ZipForge;

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
    Label1: TLabel;
    Button4: TButton;
    SaveDialog2: TSaveDialog;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
    Button1.Enabled := True;
    Button4.Enabled := False;
    Label1.Caption := 'Arquivos adicionados';
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
      ShowMessage('Compactado com sucesso!');
      KAZip1.Close;
    end;
  end
  else
    ShowMessage('Para exportar selecione a opÁ„o de ADICIONAR.');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  cont: Integer;
begin
  if OpenDialog2.Execute then
  begin
    Memo1.Lines.Clear;
    Memo1.Lines.Add(OpenDialog2.FileName);
    ShowMessage('Importado com sucesso');
    Button1.Enabled := False;
    Button4.Enabled := True;
    Label1.Caption := 'Arquivos importados';
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  compressedFile: TZipForge;
begin
  compressedFile := TZipForge.Create(nil);
  try
    try
      with compressedFile do
      begin
        compressedFile.FileName := OpenDialog2.FileName;
        OpenArchive(fmOpenRead);
        ShowMessage('Selecione o destino para descompactar');
        if SaveDialog2.Execute then
        begin
          BaseDir := SaveDialog2.FileName;
          ExtractFiles('*.*');
          CloseArchive();
          ShowMessage('Arquivos descompactados com sucesso!');
        end;
      end;
    except
      on E: Exception do
      begin
        Writeln('Exception: ', E.Message);
        Readln;
      end;
    end;
  finally
    compressedFile.Free;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  KAZip1.Free;
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

end.

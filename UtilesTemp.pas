unit UtilesTemp;

interface

uses Vcl.Forms, System.SysUtils;

type
  TAlarma = record
    Horas,
    Minutos,
    Segundos,
    TiempoSeg: word;     //tiempo representado en segundos
    Mensaje: string;     //mensaje a mostrar al activarse la alarma
  end;

var
  Alarma: TAlarma;

  procedure MostrarVentana(AClass: TFormClass; Estilo: TFormBorderStyle);
  function CadCrono(Hh,Mm,Ss: word): string;
  function SegundosAFormatoHora(Seg: word): string;

implementation

procedure MostrarVentana(AClass: TFormClass; Estilo: TFormBorderStyle);
begin
  with AClass.Create(Application) do
    try
      BorderIcons:=[biSystemMenu];
      BorderStyle:=Estilo;
      KeyPreview:=true;
      Position:=poScreenCenter;
      ShowModal;
    finally Free
    end;
end;

function CadCrono(Hh,Mm,Ss: word): string;
var
  H,M,S: string;
begin
  if Hh<10 then H:='0'+Hh.ToString
           else H:=Hh.ToString;
  if Mm<10 then M:='0'+Mm.ToString
           else M:=Mm.ToString;
  if Ss<10 then S:='0'+Ss.ToString
           else S:=Ss.ToString;
  Result:=H+':'+M+':'+S;
end;

function SegundosAFormatoHora(Seg: word): string;
var
  Hh,Mm: word;
begin
  Hh:=0;
  Mm:=0;
  if Seg>=3600 then
  begin
    Hh:=Seg div 3600;
    Seg:=Seg mod 3600;
  end;
  if Seg>=60 then
  begin
    Mm:=Seg div 60;
    Seg:=Seg mod 60;
  end;
  Result:=CadCrono(Hh,Mm,Seg);
end;

end.

unit Demo.Generics.ObjectContainer;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  {-}
  DemoConsole;

type
  TObjectContainer = class
    class procedure Run(
      const aConsole: IConsole;
      const aOwner: TComponent);
  end;

implementation

type
  TObjectContainer<T: class, constructor> = class(TComponent)
  strict private
    fObj: T;
  public
    property Obj: T read fObj;
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  end;

constructor TObjectContainer<T>.Create(aOwner: TComponent);
begin
  inherited;
  fObj := T.Create();
end;

destructor TObjectContainer<T>.Destroy;
begin
  fObj.Free;
  inherited;
end;

class procedure TObjectContainer.Run(
  const aConsole: IConsole;
  const aOwner: TComponent);
var
  container: TObjectContainer<TStringList>;
begin
  container := TObjectContainer<TStringList>.Create(aOwner);
  container.Obj.Add('3. three');
  container.Obj.Add('1. one');
  container.Obj.Insert(0, '2. two');
  container.Obj.Sort;
  aConsole.Writeln('  container.Obj.CommaText = ' + container.Obj.CommaText);
end;

end.

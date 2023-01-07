unit PetStore3Client;

interface

uses
  SysUtils, 
  OpenApiRest, 
  PetStore3Json, 
  PetStore3Dtos;

type
  TRestService = class;
  TPetStore3Config = class;
  TPetStore3Client = class;
  
  TRestService = class(TCustomRestService)
  protected
    function CreateConverter: TCustomJsonConverter; override;
    function Converter: TJsonConverter;
  end;
  
  TPetStore3Config = class(TCustomRestConfig)
  public
    constructor Create;
  end;
  
  IPetStore3Client = interface(IRestClient)
  end;
  
  TPetStore3Client = class(TCustomRestClient, IPetStore3Client)
  public
    constructor Create;
  end;
  
implementation

{ TRestService }

function TRestService.CreateConverter: TCustomJsonConverter;
begin
  Result := TJsonConverter.Create;
end;

function TRestService.Converter: TJsonConverter;
begin
  Result := TJsonConverter(inherited Converter);
end;

{ TPetStore3Config }

constructor TPetStore3Config.Create;
begin
  inherited Create;
  BaseUrl := '';
end;

{ TPetStore3Client }

constructor TPetStore3Client.Create;
begin
  inherited Create(TPetStore3Config.Create);
end;

end.

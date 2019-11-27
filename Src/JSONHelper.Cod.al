codeunit 79910 "JSONHelper WLD"
{
    Access = Public;

    var
        JsonObjectVar: JsonObject;

    procedure InitializeJsonObjectFromText(JSONText: Text)
    begin
        if not JsonObjectVar.ReadFrom(JSONText) then
            Error('Invalid JSON Text \ %1', JSONText);
    end;

    procedure InitializeJsonObjectFromToken(Token: JsonToken)
    begin
        JsonObjectVar := Token.AsObject();
    end;

    procedure GetJsonObject(): JsonObject
    begin
        exit(jsonObjectVar);
    end;

    procedure GetJsonToken(JsonObject: JsonObject; TokenKey: text) JsonToken: JsonToken
    begin
        if not JsonObject.Get(TokenKey, JsonToken) then
            Error('Could not find a token with key %1', TokenKey);
    end;

    procedure GetJsonToken(TokenKey: text) JsonToken: JsonToken
    begin
        if not JsonObjectVar.Get(TokenKey, JsonToken) then
            Error('Could not find a token with key %1', TokenKey);
    end;

    procedure GetJsonTokenAsValue(JsonObject: JsonObject; TokenKey: text) JsonValue: JsonValue
    var
        JsonToken: JsonToken;
    begin
        if not JsonObject.Get(TokenKey, JsonToken) then
            Error('Could not find a token with key %1', TokenKey);
        JsonValue := JsonToken.AsValue();
    end;

    procedure SelectJsonToken(Path: text) JsonToken: JsonToken
    begin
        if not JsonObjectVar.SelectToken(Path, JsonToken) then
            Error('Could not find a token with path %1', Path);
    end;

    procedure SelectJsonToken(JsonObject: JsonObject; Path: text) JsonToken: JsonToken
    begin
        if not JsonObject.SelectToken(Path, JsonToken) then
            Error('Could not find a token with path %1', Path);
    end;

    procedure SetValue("Key": Text; "Value": text)
    begin
        if JsonObjectVar.Contains("Key") then
            JsonObjectVar.Replace("Key", "Value")
        else
            JsonObjectVar.Add("Key", "Value");

    end;
}
randomUuid() {
  TypeLib := ComObjCreate("Scriptlet.TypeLib")
  uuid := TypeLib.Guid
  uuid := StrReplace(StrReplace(uuid, "{"), "}")
  StringLower, uuid, uuid

  return uuid
}

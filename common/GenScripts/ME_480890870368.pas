unit atNamedParameter;

// ������: "w:\quality\test\garant6x\AdapterTest\CoreObjects\atNamedParameter.pas"
// ���������: "SimpleClass"

interface

uses
 l3IntfUses
 , atParameter
;

type
 TatNamedParameter = class(TatParameter)
  private
   f_Name: AnsiString;
    {* ���� ��� �������� Name }
   f_Description: AnsiString;
    {* ���� ��� �������� Description }
  protected
  public
   constructor Create(const name: AnsiString;
    const description: AnsiString;
    const defaultValue: AnsiString); reintroduce; overload;
   constructor Create(const name: AnsiString;
    const description: AnsiString); reintroduce; overload;
   constructor Create(const name: AnsiString); reintroduce; overload;
  public
   property Name: AnsiString
    read f_Name;
   property Description: AnsiString
    read f_Description;
 end;//TatNamedParameter

implementation

uses
 l3ImplUses
;

constructor TatNamedParameter.Create(const name: AnsiString;
 const description: AnsiString;
 const defaultValue: AnsiString);
//#UC START# *480890C200C7_480890870368_var*
//#UC END# *480890C200C7_480890870368_var*
begin
//#UC START# *480890C200C7_480890870368_impl*
    inherited Create(defaultValue);
    f_Name := name;
    f_Description := description;
//#UC END# *480890C200C7_480890870368_impl*
end;//TatNamedParameter.Create

constructor TatNamedParameter.Create(const name: AnsiString;
 const description: AnsiString);
//#UC START# *480890DD012B_480890870368_var*
//#UC END# *480890DD012B_480890870368_var*
begin
//#UC START# *480890DD012B_480890870368_impl*
    Create(name);
    f_Description := description;
//#UC END# *480890DD012B_480890870368_impl*
end;//TatNamedParameter.Create

constructor TatNamedParameter.Create(const name: AnsiString);
//#UC START# *480890EF00D2_480890870368_var*
//#UC END# *480890EF00D2_480890870368_var*
begin
//#UC START# *480890EF00D2_480890870368_impl*
    inherited Create;
    f_Name := name;
    f_Description := '';
//#UC END# *480890EF00D2_480890870368_impl*
end;//TatNamedParameter.Create

end.

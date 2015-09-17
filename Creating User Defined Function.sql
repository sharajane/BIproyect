CREATE FUNCTION fEtlTransformStateToLongName
	( @StateAbbreviation nChar(2) )
	Returns nVarchar(50)
AS

	Begin
		Return
			( Select Case @StateAbbreviation
				When 'CA' Then 'California'
				When 'OR' Then 'Oregon'
				When 'WA' Then 'Washington'
		End )
	End

Function CDPCoalesce
{
<#
.SYNOPSIS
Function for coalesce operator.
.DESCRIPTION
Function for coalesce operator (if $a not null then $a, else $b). For PS versions before v7.
.INPUTS
$a - First nullable value
$b - Second nullable value
.OUTPUTS
$a, $b, includes $null.
.EXAMPLE
CDPCoalesce
>202101260528
.EXAMPLE
CDP-Get-DateTimeString -dt (Get-Date "Dec 31 1969 11:59:59.999 PM") -ms
>19691231235959999
#>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [Bool]$a,
        [Parameter(Mandatory=$True)]
        [Bool]$b
    )
    If ($a -ne $null) {$a} Else {$b}
}
New-Alias "??" CDPCoalesce
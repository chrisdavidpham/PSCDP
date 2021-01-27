Function CDPGet-DateTimeString
{
<#
.SYNOPSIS
Get a date time string.
.DESCRIPTION
Get a date time string in the format yyyyMMddHHmm. Seconds and milliseconds are optional.
.INPUTS
[DateTime] DateTime (dt)     - DateTime Now will be used if not provided.
[Switch]   Seconds (s)       - Append seconds to the output.
[Switch]   Milliseconds (ms) - Append seconds and milliseconds to the output.
.OUTPUTS
String with DateTime format of yyyyMMddHHmm. yyyyMMddHHmmss if seconds specified. yyyyMMddHHmmssfff if milliseconds specified.
.EXAMPLE
CDP-Get-DateTimeString
>202101260528
.EXAMPLE
CDP-Get-DateTimeString -dt (Get-Date "Dec 31 1969 11:59:59.999 PM") -ms
>19691231235959999
#>
    [CmdletBinding()]
    param
    (
            [Alias("dt")]
            [Parameter(ValueFromPipeline=$True)]
            [DateTime]$DateTime,
            [Alias("s")]
            [Parameter()]
            [Switch]$Seconds=$True,
            [Alias("ms")]
            [Parameter]
            [Switch]$MilliSeconds=$True
    )
    Begin
    {
        String DateTimeString = "00000000000000000"
        String DateTimeFormat = "yyyyMMddHHmmssfff"
    }
    Process
    {
        If ($DateTime -eq $null) {$DateTime = Get-Date}
        If ($Milliseconds -eq $null) {$DateTime = "yyyyMMddHHmmss"}
        If ($Seconds -eq $null) {$DateTime = "yyyyMMddHHmm"}
        DateTimeString = Get-Date -Date $DateTime -Format $DateTimeFormat
    }
    End
    {
        DateTimeString
    }
}
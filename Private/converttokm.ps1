function ConvertToKm {
    param(
        [Parameter(Mandatory=$true)]
        [double]$Miles
    )
    
    return $Miles * 1.60934
}
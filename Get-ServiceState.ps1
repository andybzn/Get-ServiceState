#Script Name: #Get-ServiceState
#Creator: Dark-Coffee
#Version: 1.0.0
#Updated: 25th September 2019
#Url: https://github.com/dark-coffee/Get-ServiceState

<#
.Description
The Get-ServiceState function returns the absolute status of the selected service. Useful for test functions.
.Parameter Name
This parameter accepts the ACTUAL name of the service, NOT the display name.
.Parameter Computername
This parameter accepts the computer name of the target computer(singular), else resolves to the local computer.
.Example
Get-ServiceState -Name BITS
.Example
Get-ServiceState -Name BITS -ComputerName TargetPC
#>

function Get-ServiceState {
    param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)][String]$Name, 
        [Parameter(Mandatory=$false,ValueFromPipeline=$true)][String]$ComputerName
    )

    if($ComputerName -ne ""){
        $ComputerName = $ComputerName
    }else{
        $ComputerName = "localhost"
    }

    $State = (Get-Service -Name $Name -ComputerName $Computername | Select-Object -ExpandProperty Status)
    $State
}

<#
.SYNOPSIS
    Launches VALORANT via Riot Client and sets the game process priority to High.

.DESCRIPTION
    This script starts VALORANT through the Riot Client using command-line arguments.
    It then waits up to 300 seconds (5 minutes) for the VALORANT process to appear,
    and attempts to set its priority to "High" once detected.
#>

Start-Process -FilePath "C:\Riot Games\Riot Client\RiotClientServices.exe" -ArgumentList "--launch-product=valorant --launch-patchline=live"

Write-Output "Launching VALORANT via Riot Client..."

$process = $null
for ($i = 0; $i -lt 300; $i++) {
  Start-Sleep -Seconds 1
  $process = Get-Process -Name "VALORANT-Win64-Shipping" -ErrorAction SilentlyContinue
  if ($process) {
    Write-Output "VALORANT process detected."
    break
  }
}

if ($process) {
  try {
    $process.PriorityClass = "High"
  }
  catch {
    Write-Error "Failed to set priority: $_"
  }
}
else {
  Write-Warning "VALORANT process not found within 300 seconds."
}

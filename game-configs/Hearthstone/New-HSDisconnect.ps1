﻿New-NetFirewallRule `
  -DisplayName "Heathstone Disconnect" `
  -Direction Outbound `
  -Program "E:\Program Files (x86)\Hearthstone\Hearthstone.exe" `
  -Action Block `
  -Profile Any `
  -Enabled False `
  -Protocol Any `
  -RemoteAddress Any `
  -LocalAddress Any `
  -RemotePort Any `
  -LocalPort Any
  
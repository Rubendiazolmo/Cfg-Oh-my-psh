# Define los alias de las interfaces que quieres filtrar
$interfacesDeseadas = @("Wi-Fi", "Ethernet")

# Filtrar la salida por las interfaces deseadas
$ipOutput = Get-NetIPConfiguration |
    Where-Object { $interfacesDeseadas -contains $_.InterfaceAlias } |
    ForEach-Object { "$($_.InterfaceAlias): $($_.IPv4Address.IPAddress)" } -join ' | '

$ipOutput = (Get-NetIPConfiguration | ForEach-Object { "$($_.InterfaceAlias): $($_.IPv4Address.IPAddress)" }) -join ' | '

setx MY_IP "$ipOutput"

clear

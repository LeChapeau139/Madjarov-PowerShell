#Permettre de récupérer l'adresse IP d'un pc (ifconfig)
$ipconfig = ipconfig
# ToString() permet de passer tout en str, puis -split sépare tous les éléments séparé par ":"
$ip = ($ipconfig | Select-String "IPv4 Address").ToString() -split ":"
#.Trim() permet de supprimer les espaces en trop
$ip = $ip[1].Trim()
#Affiche la variable $ip 
Write-Host "L'adresse IP de la machine virtuelle est : $ip"


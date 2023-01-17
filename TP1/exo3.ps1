#Permettre de récupérer l'adresse IP d'un pc (ifconfig)
ipconfig | Select-String "IPv4"
#Afficher les paramètres de la carte réseau 
Get-NetAdapter

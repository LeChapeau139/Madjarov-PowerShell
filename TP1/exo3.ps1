#Permettre de récupérer l'adresse IP d'un pc (ifconfig)
#---------------------------------------------------------------------------------------------------------------------#
#Permet d'afficher toutes les @IPs de type IPv4
ipconfig | Select-String "IPv4"
#---------------------------------------------------------------------------------------------------------------------#
#Afficher TOUS les paramètres de la carte réseau 
Get-NetAdapter
#---------------------------------------------------------------------------------------------------------------------#

#Permet de lister tous les services qui sont en cours d'execution
#---------------------------------------------------------------------------------------------------------------------#
#Get-Service nous permet de récupérer le status de chaque service actif, lorsqu'ils sont en mode "running" donc marche 
$services = Get-Service | Where-Object {$_.Status -eq "Running"}
#Pour chaque service en cours dans tous les services
foreach ($service_run in $services) 
    {
    #On affiche le nom du service
    Write-Host "Nom du service: $($service_run.Name)"
    #On affiche le statut du service
    Write-Host "Statut du service: $($service_run.Status)"
    #On délimite chaque service par "---" 
    Write-Host "---"
    }
#---------------------------------------------------------------------------------------------------------------------#

#Permet de lister toutes les interfaces réseaux avec leur Nom / @MAC / Statut
#---------------------------------------------------------------------------------------------------------------------#
#Get-NetAdapter nous permet de récupérer les paramètres de la carte réseau
$interfaces = Get-NetAdapter
#Pour chaque interface dans tous les paramètres
foreach ($interface in $interfaces) 
    {
    #On affiche le nom de l'interface en précisant le nom
    Write-Host "Nom de l'interface : $($interface.Name)"
    #On affiche le nom de l'interface en précisant l'@MAC
    Write-Host "Adresse MAC : $($interface.MacAddress)"
    #On affiche le nom de l'interface en précisant le statut de chaque interface
    Write-Host "Statut : $($interface.Status)"
    #On délimite chaque interface par "---" 
    Write-Host "---"
    }
#---------------------------------------------------------------------------------------------------------------------#
# Vérifier si on a des arguments 
if ($args.Count -eq 0) 
    {
    Write-Host "Erreur, vous n'avez rentré aucun argument"
    exit
    }

# Affecter l'adresse IP à une variable $adr (argument 1)
$adr = $args[0]

# Afficher la variable $adr avec l'adresse mise en argument
Write-Host "Adresse IP saisie : $adr"

# Séparer les octets de l'adresse IP en utilisant la commande Split
$arrAdr = $adr.Split(".")

# Transformer les éléments de la variable de type chaine en variables de type entier
$arrAdr = $arrAdr | ForEach-Object { [int]$_ }

$arrAdr | ForEach-Object {
    if ($_ -gt 255) {
        Write-Host "Erreur : un des octets de l'adresse IP depasse 255."
        exit
    }
}

# Tester le type de classe d'adresse IP
if ($arrAdr[0] -lt 128) 
{
Write-Host "Adresse IP de Classe A"
}   
elseif ($arrAdr[0] -lt 192) 
{
Write-Host "Adresse IP de Classe B"
} 
elseif ($arrAdr[0] -lt 224)
{
Write-Host "Adresse IP de Classe C"
}
elseif ($arrAdr[0] -lt 240)
{
Write-Host "Adresse IP de Classe D"
} 
elseif ($arrAdr[0] -lt 255)
{
Write-Host "Adresse IP de Classe E"
} 
else 
{
Write-Host "Adresse IP non valide"
}


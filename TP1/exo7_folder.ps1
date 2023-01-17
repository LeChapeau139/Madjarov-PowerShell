# Vérifie s'il y a un paramètre passé en ligne de commande
if ($args.Count -eq 0) {
    # Demande le chemin d'accès au répertoire à compresser
    $directory = Read-Host "Entrez le chemin d'accès au répertoire que vous voulez compresser"
} else {
    $directory = $args[0]
}

# Crée un répertoire "Archives" s'il n'existe pas
if (!(Test-Path "Archives")) {
    New-Item -ItemType Directory -Path "Archives"
}

# Compresse le répertoire dans une archive ZIP
Compress-Archive -Path $directory -DestinationPath "Archives\$($directory).zip"
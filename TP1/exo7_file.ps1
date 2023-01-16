# Vérifie s'il y a un paramètre passé en ligne de commande
if ($args.Count -eq 0) {
    # Demande le nom du fichier à compresser
    $file = Read-Host "Entrez le nom du fichier que vous voulez compresser :"
} else {
    $file = $args[0]
}

# Crée un répertoire "Archives" s'il n'existe pas
if (!(Test-Path "Archives")) {
    New-Item -ItemType Directory -Path "Archives"
}

# Compresse le fichier dans une archive ZIP
Compress-Archive -Path $file -DestinationPath "Archives\$($file).zip"
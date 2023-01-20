# Récupération des arguments
$path = $args[0]
$intervalle = $args[1]

# Vérification de la présence des arguments
if ($path -eq $null) {
    Write-Output "Absence de fichier ou dossier à sauvegarder"
    exit
}
if ($intervalle -eq $null) {
    Write-Output "Absence d’intervalle de sauvegarde"
    exit
}

# Vérification de la nature de l'élément passé en argument
if (Test-Path -PathType Leaf $path) {
    Write-Output "Fichier passé en argument"
} elseif (Test-Path -PathType Container $path) {
    Write-Output "Dossier passé en argument"
}

# Vérification de la valeur de l'intervalle
if ($intervalle -lt 30) {
    Write-Output "Intervalle trop petit"
    exit
} else {
    Write-Output "La valeur de l’intervalle est $intervalle secondes"
}

# Récupération du chemin du répertoire personnel de l'utilisateur connecté
$userPath = [Environment]::GetFolderPath("Personal")

# Copie de l'élément à sauvegarder dans le répertoire personnel
Copy-Item -Path $path -Destination $userPath -Recurse

# Temporisation avant la prochaine sauvegarde
Start-Sleep -Seconds $intervalle

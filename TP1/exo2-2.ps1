#Créer une variable username, puis demande sur le shell :
$username = Read-Host "Entrez votre nom d'utilisateur"
#Créer une variable password, puis demande sur le shell :
$password = Read-Host -AsSecureString "Entrez votre mot de passe"
#Fait en sorte que le mot de passe sorte en clair, et non en crypté
$password = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
Write-Host "Le nom d'utilisateur que vous avez choisi est : $username"
Write-Host "Et le mot de passe qui correspond : $password"
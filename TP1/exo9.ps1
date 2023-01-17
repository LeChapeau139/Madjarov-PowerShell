# Entrer le nom du nouvel utilisateur que vous souhaitez
$username = Read-Host "Entrez le nom de votre nouvel utilisateur "
# Entrer le nom du mot de passe correspondant que vous souhaitez
$password = Read-Host -AsSecureString "Entrez le mot de passe corespondant"
# Crypter le mot de passe pour qu'il ne s'affiche pas en clair
$pass_crypt = ConvertTo-SecureString -AsPlainText $password -Force
#Ajouter le nouvel utilisateur avec son nom et son mdp
New-LocalUser -Name $username -Password $pass_crypt
#Afficher les propriétés du nouvel utilisateur
Get-LocalUser -Name $username | Select-Object *
$username = Read-Host "Entrez le nom de votre nouvel utilisateur "
$password = Read-Host -AsSecureString "Entrez le mot de passe corespondant"
$pass_crypt = ConvertTo-SecureString -AsPlainText $password -Force
New-LocalUser -Name $username -Password $pass_crypt
Get-LocalUser -Name $username | Select-Object *
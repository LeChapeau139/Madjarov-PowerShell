#Affecter à la variable $password, le mot de passe "motdepasse", et le crypter avec "-AsSecureString"
$mon_password = ConvertTo-SecureString "motdepasse" -AsSecureString
#Créer un nouvel utilisateur avec comme nom "new_quentin_user", et le mot de passe défini juste avant
New-LocalUser -Name "new_quentin_user" -Password $mon_password
# Instanciation de l'objet Ping
$ping = new-object System.Net.NetworkInformation.Ping
# Demander l'adresse IP que vous voulez tester 
$adrr = Read-Host "Quel adresse IP vous voulez tester ? (X.X.X.X)"

# Test ping vers une machine active / non active

$res = $ping.send("$adrr")
if ($res.Status -eq "Success") {
    Write-host "La machine $adrr est active"
} else {
    Write-host "La machine $adrr est inactive"
}

# Boucle pour tester le ping sur un ensemble de machines dans un réseau
$3oct_adrr = Read-Host "Quel adresse IP vous voulez tester, que les 3 premiers octets? (X.X.X.**)"

for ($i = 1; $i -le 10; $i++) {
    #Dans la variable $ip, on récupère les 3 premiers octet de @IP, et on ajoute $i via la boucle 
    $ip = "$3oct_adrr.$i"
    if (Test-Connection -ComputerName "$ip" -Count 1 -Quiet) {
        write-host "La machine $ip est active"
    } else {
        write-host "La machine $ip est inactive"
    }
}

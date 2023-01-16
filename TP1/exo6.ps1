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
$semi_adrr = Read-Host "Quel adresse IP vous voulez tester, que les 3 premiers octets? (X.X.X.**)"

for ($i = 1; $i -le 10; $i++) {
    $ip = "$semi_adrr.$i"
    write-host "On teste la machine $ip"
    $res = $ping.send($ip)
    if ($res.Status -eq "Success") {
        write-host "La machine $ip est active"
    } else {
        write-host "La machine $ip est inactive"
    }
}

# Utilisation de la commande Test-Connection pour obtenir le même résultat en limitant le nombre de requêtes à 1
Test-Connection -ComputerName "$ip" -Count 1 | Select-Object -ExpandProperty Status
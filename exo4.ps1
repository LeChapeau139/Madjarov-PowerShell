$inputString = Read-Host "Entrez une chaine de caracteres separee par (',' ou '.' ou '-')"
$inputSplit = Read-Host "Quel est votre separateur ? "
$splitString = $inputString.split("$inputSplit")
Write-Host "Voici votre chaine de caractere séparee :"
foreach ($element in $splitString)  
    {
    Write-Host $element
    }
    
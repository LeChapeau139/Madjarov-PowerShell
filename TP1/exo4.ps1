# La variable $inputString vous pose une question sur le shell
$inputString = Read-Host "Entrez une chaine de caracteres separee par (',' ou '.' ou '-')"
# Dans une autre variable, vous devez rajouter le séparateur que vous avez utiliser
$inputSplit = Read-Host "Quel est votre separateur ? "
# On sépare, avec notre variable de séparateur, la chaine de caractère 
$splitString = $inputString.split("$inputSplit")
# On écrit sur le shell qu'on va afficher la liste de caractère
Write-Host "Voici votre chaine de caractere séparee :"
#Pour chaque $element dans la liste de variable séparé 
foreach ($element in $splitString)  
    {
    #On affiche chaque élément
    Write-Host $element
    }
    
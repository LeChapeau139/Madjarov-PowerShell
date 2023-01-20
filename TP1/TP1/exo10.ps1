# Importer le fichier CSV "users.csv"
$file_csv = Import-Csv -Path "users.csv" -Delimiter ";"

#Pour chaque utilisateur présent dans le fichier CSV
foreach ($users in $file_csv) {
    #On affecte à la variable "user", l'utilisateur présent dans la colonne Nom
    $user = $users.Nom
    #On affecte à la variable "grope", l'utilisateur présent dans la colonne Groupe
    $groupe = $users.Groupe
    #On vérifie si le groupe existe déjà ou non pour ne pas le recréer
    $final_groupe = Get-LocalGroup -Name $groupe
    if (!$final_groupe) {
        # Si le groune n'existe pas, alors on le crée
        New-LocalGroup -Name $groupe -Description "Group for $($groupe) students"
    }

    #On créer un nouvel utilisateur avec le nom du fichier CVS
    New-LocalUser -Name $user -AccountNeverExpires -Password (ConvertTo-SecureString $users.Identifiant -AsPlainText -Force)

    #Puis on ajoute à cette utilisateur son groupe correspondant
    Add-LocalGroupMember -Group $groupe -Member $user -Verbose
}

# On exporte le fichier CSV avec les nouveau groupes nouvellement crée dans "new_user.csv"
$file_csv | Select-Object Nom, Groupe | Export-Csv -Path "new_user.csv" -Delimiter ";" -NoTypeInformation

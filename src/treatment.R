
library("dplyr")

######################################################## Chargement des données

data = read.csv2("data/obscop.csv")

# Suppression des colonnes dupliquées (Sélection des colonnes en français)
data = select(data, c("Tri", "Année", "Périmètre.spatial", "Filtre",
                      "Population", "Thématique", "Question",
                      "Détails.de.la.question", "Réponse", "Valeur", "Unité",
                      "Echantillon"))

####################################### Sélection des données filtrées par pays

data_countries = data |> filter(Filtre == "Pays")
data_countries = select(data_countries, -c("Périmètre.spatial", "Filtre"))

france = data_countries |> filter(Population == "France")
china = data_countries |> filter(Population == "Chine")
united_states = data_countries |> filter(Population == "Etats-Unis")

france = select(france, -c("Population"))
china = select(china, -c("Population"))
united_states = select(united_states, -c("Population"))


################################################# Séparation des questionnaires

france_A = france |> filter(Thématique == "PARTIE A : PRÉOCCUPATIONS DES POPULATIONS")
france_B = france |> filter(Thématique == "PARTIE B: CONNAISSANCE ET PERCEPTION DU RÉCHAUFFEMENT CLIMATIQUE")  
france_C = france |> filter(Thématique == "PARTIE C : MOBILISATION DES DIFFERENTS ACTEURS")
france_D = france |> filter(Thématique == "PARTIE D : LA PRISE EN COMPTE DU RECHAUFFEMENT CLIMATIQUE AU QUOTIDIEN")

france_A = select(france_A, -c("Thématique"))
france_B = select(france_B, -c("Thématique"))
france_C = select(france_C, -c("Thématique"))
france_D = select(france_D, -c("Thématique"))

china_A = china |> filter(Thématique == "PARTIE A : PRÉOCCUPATIONS DES POPULATIONS")
china_B = china |> filter(Thématique == "PARTIE B: CONNAISSANCE ET PERCEPTION DU RÉCHAUFFEMENT CLIMATIQUE")  
china_C = china |> filter(Thématique == "PARTIE C : MOBILISATION DES DIFFERENTS ACTEURS")
china_D = china |> filter(Thématique == "PARTIE D : LA PRISE EN COMPTE DU RECHAUFFEMENT CLIMATIQUE AU QUOTIDIEN")

china_A = select(china_A, -c("Thématique"))
china_B = select(china_B, -c("Thématique"))
china_C = select(china_C, -c("Thématique"))
china_D = select(china_D, -c("Thématique"))

united_states_A = united_states |> filter(Thématique == "PARTIE A : PRÉOCCUPATIONS DES POPULATIONS")
united_states_B = united_states |> filter(Thématique == "PARTIE B: CONNAISSANCE ET PERCEPTION DU RÉCHAUFFEMENT CLIMATIQUE")  
united_states_C = united_states |> filter(Thématique == "PARTIE C : MOBILISATION DES DIFFERENTS ACTEURS")
united_states_D = united_states |> filter(Thématique == "PARTIE D : LA PRISE EN COMPTE DU RECHAUFFEMENT CLIMATIQUE AU QUOTIDIEN")

united_states_A = select(united_states_A, -c("Thématique"))
united_states_B = select(united_states_B, -c("Thématique"))
united_states_C = select(united_states_C, -c("Thématique"))
united_states_D = select(united_states_D, -c("Thématique"))

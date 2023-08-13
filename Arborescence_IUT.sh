#!/bin/bash

# Chemin invalide #
function cheminInvalide()
{
	TERM=ansi whiptail --title "Dossier inexistant" --yesno "Le dossier \"$1\" n'existe pas.\n\nSouhaitez vous le créer ?" 10 35 && {
        mkdir -p "$1" && { creationArborescence "${1}" && arborescenceCreer; } || TERM=ansi whiptail --title "ERREUR" --infobox "Une erreur s'est produit lors de la création du dossier \"${1}\"" 10 50
    } || TERM=ansi whiptail --title "ANNULATION" --infobox "L'arborescence n'a pas été installé" 10 50
}


# Succès de la création de l'arborescence #
function arborescenceCreer()
{
    TERM=ansi whiptail --title "Arborescence créée" --infobox "L'arborescence à été créée avec succès" 10 50
}


# Chemin deja existant #
function cheminExisteDeja()
{
	TERM=ansi whiptail --title "Arborescence déjà existante" --yesno "Le dossier \"${1}/IUT\" existe déjà. Voullez vous le supprimez ainsi que toute les données qu'il contient ?" 10 50 && {
        # Inversion des boutons pour que le bouton "yes" soit à gauche et le bouton "no" à droite
        TERM=ansi whiptail --title "CONFIRMATION" --yesno "Êtes vous sûr de vouloir supprimer votre Arborescence IUT existante ?" --yes-button "no" --no-button "yes" 10 50 && {
            TERM=ansi whiptail --title "ANNULATION" --infobox "L'arborescence n'a pas été remplacé" 10 50
        } || {
            rm -rf "${1}/IUT" && creationArborescence "${1}" && arborescenceCreer;
            # TERM=ansi whiptail --title "SUPPRESSION" --infobox "L'arborescence à été supprimé avec succès" 10 50
        }
    } || TERM=ansi whiptail --title "ANNULATION" --infobox "L'arborescence n'a pas été remplacé" 10 50
}


# Création de l'arborescence #
function creationArborescence()
{
	# Arborescence générale #
    mkdir "$1/IUT" || return 1
    mkdir "$1/IUT/TP" || return 1
    mkdir "$1/IUT/TP/java" || return 1
    mkdir "$1/IUT/TP/java/paquetage_class" || return 1
    mkdir "$1/IUT/TP/java/paquetage_java" || return 1


    # Arborescence Semestre 1 #
    mkdir "$1/IUT/TP/s1" || return 1
    mkdir "$1/IUT/TP/s1/r1.01_init_dev" || return 1
    mkdir "$1/IUT/TP/s1/r1.01_init_dev/Cours" || return 1
    mkdir "$1/IUT/TP/s1/r1.01_init_dev/TP" || return 1
    mkdir "$1/IUT/TP/s1/r1.01_init_dev/TD" || return 1
    mkdir "$1/IUT/TP/s1/r1.02_intro_web" || return 1
    mkdir "$1/IUT/TP/s1/r1.03_intro_archi" || return 1
    mkdir "$1/IUT/TP/s1/r1.04_intro_syst" || return 1
    mkdir "$1/IUT/TP/s1/r1.05_intro_bd" || return 1
    mkdir "$1/IUT/TP/s1/r1.06_math_discretes" || return 1
    mkdir "$1/IUT/TP/s1/r1.07_outils_fondamentaux" || return 1
    mkdir "$1/IUT/TP/s1/r1.08_gpo" || return 1
    mkdir "$1/IUT/TP/s1/r1.09_eco" || return 1
    mkdir "$1/IUT/TP/s1/r1.10_anglais" || return 1
    mkdir "$1/IUT/TP/s1/r1.11_communication" || return 1
    mkdir "$1/IUT/TP/s1/r1.12_ppp" || return 1

    mkdir "$1/IUT/TP/s1/sae1.01_Implementation_dun_besoin_client" || return 1
    mkdir "$1/IUT/TP/s1/sae1.02_Comparaison_dapproches_algorithmiques" || return 1
    mkdir "$1/IUT/TP/s1/sae1.03_Installation_dun_poste_de_developpement" || return 1
    mkdir "$1/IUT/TP/s1/sae1.04_Creation_dune_base_de_donnees" || return 1
    mkdir "$1/IUT/TP/s1/sae1.05_Recueil_de_besoins" || return 1
    mkdir "$1/IUT/TP/s1/sae1.06_Decouverte_de_lenvironnement_économique_et_ecologique" || return 1


    # Arborescence Semestre 2 #
    mkdir "$1/IUT/TP/s2" || return 1
    mkdir "$1/IUT/TP/s2/r2.01_dev_objet" || return 1
    mkdir "$1/IUT/TP/s2/r2.01_dev_objet/Cours" || return 1
    mkdir "$1/IUT/TP/s2/r2.01_dev_objet/TP" || return 1
    mkdir "$1/IUT/TP/s2/r2.01_dev_objet/TD" || return 1
    mkdir "$1/IUT/TP/s2/r2.02_ihm" || return 1
    mkdir "$1/IUT/TP/s2/r2.03_qualite_dev" || return 1
    mkdir "$1/IUT/TP/s2/r2.04_reseau_bas_niveau" || return 1
    mkdir "$1/IUT/TP/s2/r2.05_services_reseaux" || return 1
    mkdir "$1/IUT/TP/s2/r2.06_bd" || return 1
    mkdir "$1/IUT/TP/s2/r2.07_graphes" || return 1
    mkdir "$1/IUT/TP/s2/r2.08_stat" || return 1
    mkdir "$1/IUT/TP/s2/r2.09_meth_numeriques" || return 1
    mkdir "$1/IUT/TP/s2/r2.10_gpo" || return 1
    mkdir "$1/IUT/TP/s2/r2.11_droit" || return 1
    mkdir "$1/IUT/TP/s2/r2.12_anglais" || return 1
    mkdir "$1/IUT/TP/s2/r2.13_communication" || return 1
    mkdir "$1/IUT/TP/s2/r2.14_ppp" || return 1

    mkdir "$1/IUT/TP/s2/Portfolio" || return 1

    mkdir "$1/IUT/TP/s2/sae2.01_Développement_dune_application" || return 1
    mkdir "$1/IUT/TP/s2/sae2.02_Exploration_algorithmique_dun_problème" || return 1
    mkdir "$1/IUT/TP/s2/sae2.03_Installation_de_services_réseau" || return 1
    mkdir "$1/IUT/TP/s2/sae2.04_Exploitation_dune_base_de_données" || return 1
    mkdir "$1/IUT/TP/s2/sae2.05_Gestion_dun_projet" || return 1
    mkdir "$1/IUT/TP/s2/sae2.06_Organisation_dun_travail_déquipe" || return 1


    # Arborescence Semestre 3 #
    mkdir "$1/IUT/TP/s3" || return 1
    mkdir "$1/IUT/TP/s3/r3.01_dev_web" || return 1
    mkdir "$1/IUT/TP/s3/r3.02_dev_eff" || return 1
    mkdir "$1/IUT/TP/s3/r3.03_analyse" || return 1
    mkdir "$1/IUT/TP/s3/r3.04_qualit_dev" || return 1
    mkdir "$1/IUT/TP/s3/r3.05_prog_syst" || return 1
    mkdir "$1/IUT/TP/s3/r3.06_reseaux" || return 1
    mkdir "$1/IUT/TP/s3/r3.07_bd" || return 1
    mkdir "$1/IUT/TP/s3/r3.08_proba" || return 1
    mkdir "$1/IUT/TP/s3/r3.09_crypto" || return 1
    mkdir "$1/IUT/TP/s3/r3.10_msi" || return 1
    mkdir "$1/IUT/TP/s3/r3.11_droits" || return 1
    mkdir "$1/IUT/TP/s3/r3.12_anglais" || return 1
    mkdir "$1/IUT/TP/s3/r3.13_communication" || return 1
    mkdir "$1/IUT/TP/s3/r3.14_PPP" || return 1
 
    mkdir "$1/IUT/TP/s3/p3.01_Portfolio" || return 1

    mkdir "$1/IUT/TP/s3/s3.01_dev_application" || return 1


    # Arborescence Semestre 4 #
    mkdir "$1/IUT/TP/s4" || return 1
    mkdir "$1/IUT/TP/s4/r4.01_architect_logicielle" || return 1
    mkdir "$1/IUT/TP/s4/r4.02_qual_dev" || return 1
    mkdir "$1/IUT/TP/s4/r4.03_bd" || return 1
    mkdir "$1/IUT/TP/s4/r4.04_meth_optimisation" || return 1
    mkdir "$1/IUT/TP/s4/r4.05_anglais" || return 1
    mkdir "$1/IUT/TP/s4/r4.06_communication" || return 1
    mkdir "$1/IUT/TP/s4/r4.07_ppp" || return 1
    mkdir "$1/IUT/TP/s4/r4.08_virtualisation" || return 1
    mkdir "$1/IUT/TP/s4/r4.09_msi" || return 1
    mkdir "$1/IUT/TP/s4/r4.10_compl_web" || return 1
    mkdir "$1/IUT/TP/s4/r4.11_dev_mobile" || return 1
    mkdir "$1/IUT/TP/s4/r4.12_automates" || return 1

    mkdir "$1/IUT/TP/s4/s4.01_dev_application" || return 1

    mkdir "$1/IUT/TP/s4/Stage" || return 1


    # Arborescence Semestre 5 #
    mkdir "$1/IUT/TP/s5" || return 1
    mkdir "$1/IUT/TP/s5/r5.01_management_equipe_informatique" || return 1
    mkdir "$1/IUT/TP/s5/r5.02_ppp" || return 1
    mkdir "$1/IUT/TP/s5/r5.03_communication" || return 1
    mkdir "$1/IUT/TP/s5/r5.04_qualite_algorithmique" || return 1
    mkdir "$1/IUT/TP/s5/r5.05_prog_avancee" || return 1
    mkdir "$1/IUT/TP/s5/r5.06_prog_multimedia" || return 1
    mkdir "$1/IUT/TP/s5/r5.07_automatisation_chaine_production" || return 1
    mkdir "$1/IUT/TP/s5/r5.08_qualit_dev" || return 1
    mkdir "$1/IUT/TP/s5/r5.09_virtualisation_avancee" || return 1
    mkdir "$1/IUT/TP/s5/r5.10_bd" || return 1
    mkdir "$1/IUT/TP/s5/r5.11_aide_decision" || return 1
    mkdir "$1/IUT/TP/s5/r5.12_modelisation" || return 1
    mkdir "$1/IUT/TP/s5/r5.13_economie" || return 1
    mkdir "$1/IUT/TP/s5/r5.14_anglais" || return 1

    mkdir "$1/IUT/TP/s5/s5.01_developpement_avance" || return 1


    # Arborescence Semestre 6 #
    mkdir "$1/IUT/TP/s6" || return 1
    mkdir "$1/IUT/TP/s6/r6.01_entrepreneuriat" || return 1
    mkdir "$1/IUT/TP/s6/r6.02_droit" || return 1
    mkdir "$1/IUT/TP/s6/r6.03_communication" || return 1
    mkdir "$1/IUT/TP/s6/r6.04_ppp" || return 1
    mkdir "$1/IUT/TP/s6/r6.05_dev_avance" || return 1
    mkdir "$1/IUT/TP/s6/r6.06_maintenance_applicative" || return 1

    mkdir "$1/IUT/TP/s6/s6.01_developpement_avance" || return 1

    mkdir "$1/IUT/TP/s6/Stage" || return 1

    return 0
}


# Main (Code executer) #
folder=$(TERM=ansi whiptail --inputbox "Veuillez entrer le chemin du répertoire d'instalation de l'arborescence de l'IUT.\n\n(un repertoire fils de '/home/$USER' sinon la permission ne sera pas accorder pour la création de l'arborescence)\n" 15 60 /home/$USER 3>&1 1>&2 2>&3) && {
    ls "${folder}" >/dev/null 2>&1 && { ls "${folder}/IUT" >/dev/null 2>&1 && cheminExisteDeja "${folder}" || { creationArborescence "${folder}" && arborescenceCreer; } } || cheminInvalide "${folder}"
} || {
    TERM=ansi whiptail --title "ANNULATION" --infobox "L'arborescence n'a pas été installé" 10 50
}

exit 0
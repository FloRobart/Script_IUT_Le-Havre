#!/bin/bash

function demandeChemin()
{
	rep=$(whiptail --inputbox "Veuillez entrer le chemin du répertoire d'instalation de l'arborescence de l'IUT (exemple : /home/$USER)" 10 50 /home/$USER 3>&1 1>&2 2>&3)

	
	verif=$?
	
	
	ls "$1" > /dev/null 2>&1
	
	
	if [ $verif -eq 0 ] && [ $? -eq 0 ] && [[ $rep != "" ]]
	then
		main $rep
	else
		if [ $verif -ne 0 ]
		then 
			exit 1
		fi
		demandeChemin
	fi
}


function cheminInvalide()
{
	whiptail --title "Chemin non existant" --yesno "Le dossier \"$echo $1\" n'existe pas.\n\nSouhaitez vous le créer ?" 10 35
	
	if [ $? -eq 0 ]
	then 
		main "$(echo $1)" creer
	else
		whiptail --title "ANNULATION" --infobox "L'arborescence n'a pas été installé" 10 50
	fi
}



function arborescenceCree()
{
	whiptail --infobox "Arborescence créée avec succès" 10 50
}


function arborescenceEchoue()
{
	whiptail --infobox "L'arborescence n'a pas pu être créée pour des raisons inconnu" 10 50
}


function cheminExisteDeja()
{
	whiptail --title "Arborescence déjà existante" --yesno "Le dossier \"IUT\" est déjà dans le dossier \"$echo $1\". Voullez vous le supprimez ?" 10 50
	
	if [ $? -eq 0 ]
	then 
		whiptail --title "CONFIRMATION" --yesno "Êtes vous sûr de vouloir supprimer votre Arborescence IUT existante ?" --yes-button "no" --no-button "yes" 10 50
		if [ $? -eq 1 ]
		then
			main "$(echo $1)" a	
		else
			whiptail --title "ANNULATION" --msgbox "Annulation de la création de l'arborescence, auncun dossier n'a été supprimé" 10 50
		fi
	else
		whiptail --title "ANNULATION" --msgbox "Annulation de la création de l'arbprescence, auncun dossier n'a été supprimé" 10 50
	fi	 
}

function creationArborescence()
{
	  ## Arborescence générale ##
    mkdir "$1"/IUT
    mkdir "$1"/IUT/TP
    mkdir "$1"/IUT/TP/java
    mkdir "$1"/IUT/TP/java/paquetage_class
    mkdir "$1"/IUT/TP/java/paquetage_java


    ## Arborescence Semestre 1 ##
    mkdir "$1"/IUT/TP/s1
    mkdir "$1"/IUT/TP/s1/r1_01_init_dev
    mkdir "$1"/IUT/TP/s1/r1_01_init_dev/Cours
    mkdir "$1"/IUT/TP/s1/r1_01_init_dev/TP
    mkdir "$1"/IUT/TP/s1/r1_01_init_dev/TD
    mkdir "$1"/IUT/TP/s1/r1_02_intro_web
    mkdir "$1"/IUT/TP/s1/r1_03_intro_archi
    mkdir "$1"/IUT/TP/s1/r1_04_intro_syst
    mkdir "$1"/IUT/TP/s1/r1_05_intro_bd
    mkdir "$1"/IUT/TP/s1/r1_06_math_discretes
    mkdir "$1"/IUT/TP/s1/r1_07_outils_fondamentaux
    mkdir "$1"/IUT/TP/s1/r1_08_gpo
    mkdir "$1"/IUT/TP/s1/r1_09_eco
    mkdir "$1"/IUT/TP/s1/r1_10_anglais
    mkdir "$1"/IUT/TP/s1/r1_11_communication
    mkdir "$1"/IUT/TP/s1/r1_12_ppp

    mkdir "$1"/IUT/TP/s1/p1_01_Portfolio

    mkdir "$1"/IUT/TP/s1/sae1_01_Implementation_d\'un_besoin_client
    mkdir "$1"/IUT/TP/s1/sae1_02_Comparaison_d\'approches_algorithmiques
    mkdir "$1"/IUT/TP/s1/sae1_03_Installation_d\'un_poste_de_developpement
    mkdir "$1"/IUT/TP/s1/sae1_04_Creation_d\'une_base_de_donnees
    mkdir "$1"/IUT/TP/s1/sae1_05_Recueil_du_besoins
    mkdir "$1"/IUT/TP/s1/sae1_06_Decouverte_de_l\'environnement_économique_et_ecologique


    ## Arborescence Semestre 2 ##
    mkdir "$1"/IUT/TP/s2
    mkdir "$1"/IUT/TP/s2/r2_01_dev_objet
    mkdir "$1"/IUT/TP/s2/r2_01_dev_objet/Cours
    mkdir "$1"/IUT/TP/s2/r2_01_dev_objet/TP
    mkdir "$1"/IUT/TP/s2/r2_01_dev_objet/TD
    mkdir "$1"/IUT/TP/s2/r2_02_ihm
    mkdir "$1"/IUT/TP/s2/r2_03_qualite_dev
    mkdir "$1"/IUT/TP/s2/r2_04_reseau_bas_niveau
    mkdir "$1"/IUT/TP/s2/r2_05_services_reseaux
    mkdir "$1"/IUT/TP/s2/r2_06_bado
    mkdir "$1"/IUT/TP/s2/r2_07_graphes
    mkdir "$1"/IUT/TP/s2/r2_08_statistiques
    mkdir "$1"/IUT/TP/s2/r2_09_methodes_numeriques
    mkdir "$1"/IUT/TP/s2/r2_10_gpo
    mkdir "$1"/IUT/TP/s2/r2_11_droit
    mkdir "$1"/IUT/TP/s2/r2_12_anglais
    mkdir "$1"/IUT/TP/s2/r2_13_communication
    mkdir "$1"/IUT/TP/s2/r2_14_ppp

    mkdir "$1"/IUT/TP/s2/p2_01_Portfolio

    mkdir "$1"/IUT/TP/s2/sae2_01_Développement_d\'une_application
    mkdir "$1"/IUT/TP/s2/sae2_02_Exploration_algorithmique_d\'un_problème
    mkdir "$1"/IUT/TP/s2/sae2_03_Installation_de_services_réseau
    mkdir "$1"/IUT/TP/s2/sae2_04_Exploitation_d\'une_base_de_données
    mkdir "$1"/IUT/TP/s2/sae2_05_Gestion_d\'un_projet
    mkdir "$1"/IUT/TP/s2/sae2_06_Organisation_d\'un_travail_d\'équipe


    ## Arborescence Semestre 3 ##
    mkdir "$1"/IUT/TP/s3
    mkdir "$1"/IUT/TP/s3/r3_01_dev_web
    mkdir "$1"/IUT/TP/s3/r3_02_dev_efficace
    mkdir "$1"/IUT/TP/s3/r3_03_analyse
    mkdir "$1"/IUT/TP/s3/r3_04_qualite_dev
    mkdir "$1"/IUT/TP/s3/r3_05_prog_syst
    mkdir "$1"/IUT/TP/s3/r3_06_reseaux
    mkdir "$1"/IUT/TP/s3/r3_07_sql
    mkdir "$1"/IUT/TP/s3/r3_08_proba
    mkdir "$1"/IUT/TP/s3/r3_09_crypto
    mkdir "$1"/IUT/TP/s3/r3_10_msi
    mkdir "$1"/IUT/TP/s3/r3_11_droits
    mkdir "$1"/IUT/TP/s3/r3_12_anglais
    mkdir "$1"/IUT/TP/s3/r3_13_communication
    mkdir "$1"/IUT/TP/s3/r3_14_PPP
 
    mkdir "$1"/IUT/TP/s3/p3_01_Portfolio

    mkdir "$1"/IUT/TP/s3/sae3_01_Développement_d\'une_application


    ## Arborescence Semestre 4 ##
    mkdir "$1"/IUT/TP/s4
    mkdir "$1"/IUT/TP/s4/r4.01_architect_logicielle
    mkdir "$1"/IUT/TP/s4/r4.02_qual_dev
    mkdir "$1"/IUT/TP/s4/r4.03_bd
    mkdir "$1"/IUT/TP/s4/r4.04_meth_optimisation
    mkdir "$1"/IUT/TP/s4/r4.05_anglais
    mkdir "$1"/IUT/TP/s4/r4.06_communication
    mkdir "$1"/IUT/TP/s4/r4.07_ppp
    mkdir "$1"/IUT/TP/s4/r4.08_virtualisation
    mkdir "$1"/IUT/TP/s4/r4.09_msi
    mkdir "$1"/IUT/TP/s4/r4.10_compl_web
    mkdir "$1"/IUT/TP/s4/r4.11_dev_modile
    mkdir "$1"/IUT/TP/s4/r4.12_automates

    mkdir "$1"/IUT/TP/s4/p4_01_Portfolio

    mkdir "$1"/IUT/TP/s4/s4.01_dev_application


    ## Arborescence Semestre 5 ##
    mkdir "$1"/IUT/TP/s5
    mkdir "$1"/IUT/TP/s5/r5.01_management_equipe_informatique
    mkdir "$1"/IUT/TP/s5/r5.02_ppp
    mkdir "$1"/IUT/TP/s5/r5.03_communication
    mkdir "$1"/IUT/TP/s5/r5.04_qualite_algorithmique
    mkdir "$1"/IUT/TP/s5/r5.05_prog_avancee
    mkdir "$1"/IUT/TP/s5/r5.06_prog_multimedia
    mkdir "$1"/IUT/TP/s5/r5.07_automatisation_chaine_production
    mkdir "$1"/IUT/TP/s5/r5.08_qualit_dev
    mkdir "$1"/IUT/TP/s5/r5.09_virtualisation_avancee
    mkdir "$1"/IUT/TP/s5/r5.10_bd
    mkdir "$1"/IUT/TP/s5/r5.11_aide_decision
    mkdir "$1"/IUT/TP/s5/r5.12_modelisation
    mkdir "$1"/IUT/TP/s5/r5.13_economie
    mkdir "$1"/IUT/TP/s5/r5.14_anglais

    mkdir "$1"/IUT/TP/s5/p4_01_Portfolio

    mkdir "$1"/IUT/TP/s5/s5.01_developpement_avance


    ## Arborescence Semestre 6 ##
    mkdir "$1"/IUT/TP/s6
    mkdir "$1"/IUT/TP/s6/r6.01_entrepreneuriat
    mkdir "$1"/IUT/TP/s6/r6.02_droit
    mkdir "$1"/IUT/TP/s6/r6.03_communication
    mkdir "$1"/IUT/TP/s6/r6.04_ppp
    mkdir "$1"/IUT/TP/s6/r6.05_dev_avance
    mkdir "$1"/IUT/TP/s6/r6.06_maintenance_applicative

    mkdir "$1"/IUT/TP/s6/s6.01_developpement_avance
}


function main()
{
    if [ $# -lt 1 ] 
    then
        demandeChemin
    else
        if [ -d "$1" ]
        then
        
            if [ -d "$1"/IUT ]
            then
                if [ $# -lt 2 ]
                then
                    cheminExisteDeja "$1"
                else
                    rm -fr "$1"/IUT
                    creationArborescence "$1" && arborescenceCree "L'ancienne Arborescence à été remplacer par la nouvelle avec succès" || arborescenceEchoue
                fi
            else
                creationArborescence "$1" && arborescenceCree "Arborescence créée avec succès dans le dossier $1" || arborescenceEchoue
            fi
        else
            if [ $# -lt 2 ]
            then
                cheminInvalide "$1"
            else
                mkdir "$1"
                creationArborescence "$1" && arborescenceCree "Arborescence créée avec succès dans le dossier $1" || arborescenceEchoue
            fi
        fi
    fi
}

main
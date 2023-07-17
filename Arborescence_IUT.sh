#!/bin/bash

function demandeChemin()
{
	folder=$(whiptail --inputbox "Veuillez entrer le chemin du répertoire d'instalation de l'arborescence de l'IUT (exemple : /home/$USER)" 10 50 /home/$USER 3>&1 1>&2 2>&3)

    ls "${folder}/IUT" >/dev/null 2>&1 && { cheminExisteDeja "$folder"; }
	#ls "$folder" >/dev/null 2>&1 && { creationArborescence && ArborescenceCreer; } || cheminInvalide "$folder"
}


function cheminInvalide()
{
	whiptail --title "Chemin non existant" --yesno "Le dossier \"$1\" n'existe pas.\n\nSouhaitez vous le créer ?" 10 35
	
	if [ $? -eq 0 ]
	then
		main "$1" creer
	else
		whiptail --title "ANNULATION" --infobox "L'arborescence n'a pas été installé" 10 50
	fi
}

function ArborescenceCreer()
{
    whiptail --title "Arborescence créée" --infobox "L'arborescence à été créée avec succès" 10 50
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
	ansiwhiptail --title "Arborescence déjà existante" --yesno "Le dossier \"${1}/IUT\" existe déjà. Voullez vous le supprimez ainsi que toute les données qu'il contient ?" 10 50 && {
        echo oui
    } || {
        echo non
    }
    ansiwhiptail --title "ANNULATION" --infobox "L'arborescence n'a pas été installé" 10 50
    #{
    #    whiptail --title "CONFIRMATION" --yesno "Êtes vous sûr de vouloir supprimer votre Arborescence IUT existante ?" --yes-button "no" --no-button "yes" 10 50 && {
    #        rm -rf "${1}/IUT" && {
    #            whiptail --title "SUPPRESSION" --infobox "L'arborescence à été supprimé avec succès" 10 50
    #            creationArborescence "$1" && arborescenceCree || arborescenceEchoue
    #        };
    #    } || {
    #        whiptail --title "ANNULATION" --infobox "L'arborescence n'a pas été installé" 10 50;
    #    };
    #} || { whiptail --title "ANNULATION" --infobox "L'arborescence n'a pas été installé" 10 50; }

    return 0
	
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
	# Arborescence générale #
    mkdir "$1"/IUT || return 1
    mkdir "$1"/IUT/TP || return 1
    mkdir "$1"/IUT/TP/java || return 1
    mkdir "$1"/IUT/TP/java/paquetage_class || return 1
    mkdir "$1"/IUT/TP/java/paquetage_java || return 1


    # Arborescence Semestre 1 #
    mkdir "$1"/IUT/TP/s1 || return 1
    mkdir "$1"/IUT/TP/s1/r1_01_init_dev || return 1
    mkdir "$1"/IUT/TP/s1/r1_01_init_dev/Cours || return 1
    mkdir "$1"/IUT/TP/s1/r1_01_init_dev/TP || return 1
    mkdir "$1"/IUT/TP/s1/r1_01_init_dev/TD || return 1
    mkdir "$1"/IUT/TP/s1/r1_02_intro_web || return 1
    mkdir "$1"/IUT/TP/s1/r1_03_intro_archi || return 1
    mkdir "$1"/IUT/TP/s1/r1_04_intro_syst || return 1
    mkdir "$1"/IUT/TP/s1/r1_05_intro_bd || return 1
    mkdir "$1"/IUT/TP/s1/r1_06_math_discretes || return 1
    mkdir "$1"/IUT/TP/s1/r1_07_outils_fondamentaux || return 1
    mkdir "$1"/IUT/TP/s1/r1_08_gpo || return 1
    mkdir "$1"/IUT/TP/s1/r1_09_eco || return 1
    mkdir "$1"/IUT/TP/s1/r1_10_anglais || return 1
    mkdir "$1"/IUT/TP/s1/r1_11_communication || return 1
    mkdir "$1"/IUT/TP/s1/r1_12_ppp || return 1

    mkdir "$1"/IUT/TP/s1/p1_01_Portfolio

    mkdir "$1"/IUT/TP/s1/sae1_01_Implementation_d\'un_besoin_client || return 1
    mkdir "$1"/IUT/TP/s1/sae1_02_Comparaison_d\'approches_algorithmiques || return 1
    mkdir "$1"/IUT/TP/s1/sae1_03_Installation_d\'un_poste_de_developpement || return 1
    mkdir "$1"/IUT/TP/s1/sae1_04_Creation_d\'une_base_de_donnees || return 1
    mkdir "$1"/IUT/TP/s1/sae1_05_Recueil_du_besoins || return 1
    mkdir "$1"/IUT/TP/s1/sae1_06_Decouverte_de_l\'environnement_économique_et_ecologique || return 1


    # Arborescence Semestre 2 #
    mkdir "$1"/IUT/TP/s2 || return 1
    mkdir "$1"/IUT/TP/s2/r2_01_dev_objet || return 1
    mkdir "$1"/IUT/TP/s2/r2_01_dev_objet/Cours || return 1
    mkdir "$1"/IUT/TP/s2/r2_01_dev_objet/TP || return 1
    mkdir "$1"/IUT/TP/s2/r2_01_dev_objet/TD || return 1
    mkdir "$1"/IUT/TP/s2/r2_02_ihm || return 1
    mkdir "$1"/IUT/TP/s2/r2_03_qualite_dev || return 1
    mkdir "$1"/IUT/TP/s2/r2_04_reseau_bas_niveau || return 1
    mkdir "$1"/IUT/TP/s2/r2_05_services_reseaux || return 1
    mkdir "$1"/IUT/TP/s2/r2_06_bado || return 1
    mkdir "$1"/IUT/TP/s2/r2_07_graphes || return 1
    mkdir "$1"/IUT/TP/s2/r2_08_statistiques || return 1
    mkdir "$1"/IUT/TP/s2/r2_09_methodes_numeriques || return 1
    mkdir "$1"/IUT/TP/s2/r2_10_gpo || return 1
    mkdir "$1"/IUT/TP/s2/r2_11_droit || return 1
    mkdir "$1"/IUT/TP/s2/r2_12_anglais || return 1
    mkdir "$1"/IUT/TP/s2/r2_13_communication || return 1
    mkdir "$1"/IUT/TP/s2/r2_14_ppp || return 1

    mkdir "$1"/IUT/TP/s2/p2_01_Portfolio || return 1

    mkdir "$1"/IUT/TP/s2/sae2_01_Développement_d\'une_application || return 1
    mkdir "$1"/IUT/TP/s2/sae2_02_Exploration_algorithmique_d\'un_problème || return 1
    mkdir "$1"/IUT/TP/s2/sae2_03_Installation_de_services_réseau || return 1
    mkdir "$1"/IUT/TP/s2/sae2_04_Exploitation_d\'une_base_de_données || return 1
    mkdir "$1"/IUT/TP/s2/sae2_05_Gestion_d\'un_projet || return 1
    mkdir "$1"/IUT/TP/s2/sae2_06_Organisation_d\'un_travail_d\'équipe || return 1


    # Arborescence Semestre 3 #
    mkdir "$1"/IUT/TP/s3 || return 1
    mkdir "$1"/IUT/TP/s3/r3_01_dev_web || return 1
    mkdir "$1"/IUT/TP/s3/r3_02_dev_efficace || return 1
    mkdir "$1"/IUT/TP/s3/r3_03_analyse || return 1
    mkdir "$1"/IUT/TP/s3/r3_04_qualite_dev || return 1
    mkdir "$1"/IUT/TP/s3/r3_05_prog_syst || return 1
    mkdir "$1"/IUT/TP/s3/r3_06_reseaux || return 1
    mkdir "$1"/IUT/TP/s3/r3_07_sql || return 1
    mkdir "$1"/IUT/TP/s3/r3_08_proba || return 1
    mkdir "$1"/IUT/TP/s3/r3_09_crypto || return 1
    mkdir "$1"/IUT/TP/s3/r3_10_msi || return 1
    mkdir "$1"/IUT/TP/s3/r3_11_droits || return 1
    mkdir "$1"/IUT/TP/s3/r3_12_anglais || return 1
    mkdir "$1"/IUT/TP/s3/r3_13_communication || return 1
    mkdir "$1"/IUT/TP/s3/r3_14_PPP || return 1
 
    mkdir "$1"/IUT/TP/s3/p3_01_Portfolio || return 1

    mkdir "$1"/IUT/TP/s3/sae3_01_Développement_d\'une_application || return 1


    # Arborescence Semestre 4 #
    mkdir "$1"/IUT/TP/s4 || return 1
    mkdir "$1"/IUT/TP/s4/r4.01_architect_logicielle || return 1
    mkdir "$1"/IUT/TP/s4/r4.02_qual_dev || return 1
    mkdir "$1"/IUT/TP/s4/r4.03_bd || return 1
    mkdir "$1"/IUT/TP/s4/r4.04_meth_optimisation || return 1
    mkdir "$1"/IUT/TP/s4/r4.05_anglais || return 1
    mkdir "$1"/IUT/TP/s4/r4.06_communication || return 1
    mkdir "$1"/IUT/TP/s4/r4.07_ppp || return 1
    mkdir "$1"/IUT/TP/s4/r4.08_virtualisation || return 1
    mkdir "$1"/IUT/TP/s4/r4.09_msi || return 1
    mkdir "$1"/IUT/TP/s4/r4.10_compl_web || return 1
    mkdir "$1"/IUT/TP/s4/r4.11_dev_modile || return 1
    mkdir "$1"/IUT/TP/s4/r4.12_automates || return 1

    mkdir "$1"/IUT/TP/s4/p4_01_Portfolio || return 1

    mkdir "$1"/IUT/TP/s4/s4.01_dev_application || return 1


    # Arborescence Semestre 5 #
    mkdir "$1"/IUT/TP/s5 || return 1
    mkdir "$1"/IUT/TP/s5/r5.01_management_equipe_informatique || return 1
    mkdir "$1"/IUT/TP/s5/r5.02_ppp || return 1
    mkdir "$1"/IUT/TP/s5/r5.03_communication || return 1
    mkdir "$1"/IUT/TP/s5/r5.04_qualite_algorithmique || return 1
    mkdir "$1"/IUT/TP/s5/r5.05_prog_avancee || return 1
    mkdir "$1"/IUT/TP/s5/r5.06_prog_multimedia || return 1
    mkdir "$1"/IUT/TP/s5/r5.07_automatisation_chaine_production || return 1
    mkdir "$1"/IUT/TP/s5/r5.08_qualit_dev || return 1
    mkdir "$1"/IUT/TP/s5/r5.09_virtualisation_avancee || return 1
    mkdir "$1"/IUT/TP/s5/r5.10_bd || return 1
    mkdir "$1"/IUT/TP/s5/r5.11_aide_decision || return 1
    mkdir "$1"/IUT/TP/s5/r5.12_modelisation || return 1
    mkdir "$1"/IUT/TP/s5/r5.13_economie || return 1
    mkdir "$1"/IUT/TP/s5/r5.14_anglais || return 1

    mkdir "$1"/IUT/TP/s5/p4_01_Portfolio || return 1

    mkdir "$1"/IUT/TP/s5/s5.01_developpement_avance || return 1


    # Arborescence Semestre 6 #
    mkdir "$1"/IUT/TP/s6 || return 1
    mkdir "$1"/IUT/TP/s6/r6.01_entrepreneuriat || return 1
    mkdir "$1"/IUT/TP/s6/r6.02_droit || return 1
    mkdir "$1"/IUT/TP/s6/r6.03_communication || return 1
    mkdir "$1"/IUT/TP/s6/r6.04_ppp || return 1
    mkdir "$1"/IUT/TP/s6/r6.05_dev_avance || return 1
    mkdir "$1"/IUT/TP/s6/r6.06_maintenance_applicative || return 1

    mkdir "$1"/IUT/TP/s6/s6.01_developpement_avance || return 1

    return 0
}


function main()
{
    demandeChemin
}

main
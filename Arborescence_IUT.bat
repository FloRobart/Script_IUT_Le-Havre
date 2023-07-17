@echo off

::------::
:: Main ::
::------::
IF "%~1"=="" (
    call :demandeChemin
) else (
    IF EXIST "%~1" (
        IF EXIST "%~1\IUT" (
            IF "%~2"=="" (
                call :cheminAlreadyExist "%~1"
            ) ELSE (
                rmdir /q /s "%~1\IUT"
                call :creation_arborescence "%~1" && call :ArborescenceCreer "L'ancienne Arborescence a ete remplacer par la nouvelle avec succes" || ( call :ArborescenceFailed & goto :eof )
            )
        ) ELSE (
            call :ArborescenceCreer "%~1"
            call :creation_arborescence "%~1" && call :ArborescenceCreer "! Arborescence creee avec succes dans le dossier ""%~f1""" || ( call :ArborescenceFailed & goto :eof )
        )
    ) ELSE (
        IF "%~2"=="" (
            call :cheminInvalide "%~1"
        ) ELSE (
            mkdir "%~1"
            call :creation_arborescence "%~1" && call :ArborescenceCreer "Arborescence creee avec succes dans le dossier ""%~f1""" || ( call :ArborescenceFailed & goto :eof )
        )
        
    )
)

call :suppressionFichierTemp
:: Met fin au programme ::
goto :eof



:: Demande du chamin ::
:demandeChemin
    echo chemin = inputbox ^("Le chemin absolu est le chemin complet de votre dossier en partant de la racine de votre disque dur (racine = uneLettreMajuscule:, generalement ""C:"")" ^& vbCRLF ^& vbCRLF ^& vbCRLF ^& "Veuillez entrer le chemin absolu du repertoire d'installation de l'arborescence de l'IUT :", "Installation arborescence", "C:"^)> demande_chemin.vbs
    echo prog = "Arborescence_IUT.bat """ ^& chemin ^& """">> demande_chemin.vbs
    echo IF chemin^<^>"" THEN>> demande_chemin.vbs
    echo     WScript.CreateObject ^("Wscript.shell"^).Run^(prog^), ^0>> demande_chemin.vbs
    echo END IF>> demande_chemin.vbs

    call demande_chemin.vbs
goto :eof


:: Message quand le dossier d'installation N'EXISTE PAS ::
:cheminInvalide
    echo chemin = "%~1"> cheminNonValable.vbs
    echo creer = msgbox("Le dossier ""%~f1"" n'existe pas. Voulez-vous le creer ?", vbYesNo+vbExclamation, "Creation du dossier %~1")>> cheminNonValable.vbs
    echo IF creer = vbYes THEN>> cheminNonValable.vbs
    echo     prog = "Arborescence_IUT.bat """ ^& chemin ^& """ ""creer" ^& """">> cheminNonValable.vbs
    echo     WScript.CreateObject ^("Wscript.shell"^).Run^(prog^), ^0>> cheminNonValable.vbs
    echo ELSE>> cheminNonValable.vbs
    echo     msgbox "L'arborescence n'a pas ete installer", vbOkOnly+vbInformation, "Annulation">> cheminNonValable.vbs
    echo END IF>> cheminNonValable.vbs

    call cheminNonValable.vbs
goto :eof


:: Message quand le dossier d'installation EXISTE et que l'arborescence a ete creer avec succes ::
:ArborescenceCreer
    echo msgbox %1, vbOkOnly+vbInformation, "Arborescence creee"> arborescenceCreer.vbs

    call arborescenceCreer.vbs
goto :eof


:: Message en cas d'erreur inconnu ::
:ArborescenceFailed
    echo msgbox "L'arborescence n'a pas pu être creee pour des raison incunnu", vbOkOnly+vbCritical, "Arborescence Failed"> arborescenceFailed.vbs

    call arborescenceFailed.vbs
goto :eof


:: Message si un dossier IUT existe deja dans le repertoire d'installation qu'a choisie l'utilisateur ::
:cheminAlreadyExist
    echo chemin = "%~1">>cheminAlreadyExist.vbs
    echo remplacer = msgbox("Le dossier ""IUT"" existe deja dans le dossier ""%~f1"" Voulez-vous le remplacer ?", vbYesNo+vbExclamation, "IUT existe deja")>>cheminAlreadyExist.vbs
    echo IF remplacer = vbYes THEN>>cheminAlreadyExist.vbs
    echo     remplacer = msgbox("Êtes-vous sûr de vouloir supprimer toute les donnees du dossier ""IUT"" et de tout les sous dossiers de ""IUT""", vbYesNo+vbCritical+vbDefaultButton2, "Confirmation de la suppression")>>cheminAlreadyExist.vbs
    echo     IF remplacer = vbYes THEN>>cheminAlreadyExist.vbs
    echo         prog = "Arborescence_IUT.bat """ ^& chemin ^& """ ""remplacer" ^& """">>cheminAlreadyExist.vbs
    echo         WScript.CreateObject ^("Wscript.shell"^).Run^(prog^), ^0>>cheminAlreadyExist.vbs
    echo     ELSE>>cheminAlreadyExist.vbs
    echo         msgbox "Annulation de l'installation de l'arborescence, aucun dossier n'a ete supprimer.", vbOkOnly+vbInformation, "Annulation">>cheminAlreadyExist.vbs
    echo     END IF>>cheminAlreadyExist.vbs
    echo END IF>>cheminAlreadyExist.vbs

    call cheminAlreadyExist.vbs
goto :eof


:: Suppression de tout les fichiers temporaire qui peuvent être creee pendant l'execution du script ::
:suppressionFichierTemp
    IF EXIST "demande_chemin.vbs"        del /q /f "demande_chemin.vbs"
    IF EXIST "cheminNonValable.vbs"      del /q /f "cheminNonValable.vbs"
    IF EXIST "arborescenceCreer.vbs"     del /q /f "arborescenceCreer.vbs"
    IF EXIST "arborescenceFailed.vbs"    del /q /f "arborescenceFailed.vbs"
    IF EXIST "cheminAlreadyExist.vbs"    del /q /f "cheminAlreadyExist.vbs"
goto :eof




:: Creee le script qui vas creee l'arboressence l'arborescence ::
:creation_arborescence
    :: Arborescence generale ::
    mkdir "%~1\IUT"
    mkdir "%~1\IUT\TP"
    mkdir "%~1\IUT\TP\java"
    mkdir "%~1\IUT\TP\java\paquetage_class"
    mkdir "%~1\IUT\TP\java\paquetage_java"


    :: Arborescence Semestre 1 ::
    mkdir "%~1\IUT\TP\s1"
    mkdir "%~1\IUT\TP\s1\r1_01_init_dev"
    mkdir "%~1\IUT\TP\s1\r1_01_init_dev\Cours"
    mkdir "%~1\IUT\TP\s1\r1_01_init_dev\TP"
    mkdir "%~1\IUT\TP\s1\r1_01_init_dev\TD"
    mkdir "%~1\IUT\TP\s1\r1_02_intro_web"
    mkdir "%~1\IUT\TP\s1\r1_03_intro_archi"
    mkdir "%~1\IUT\TP\s1\r1_04_intro_syst"
    mkdir "%~1\IUT\TP\s1\r1_05_intro_bd"
    mkdir "%~1\IUT\TP\s1\r1_06_math_discretes"
    mkdir "%~1\IUT\TP\s1\r1_07_outils_fondamentaux"
    mkdir "%~1\IUT\TP\s1\r1_08_gpo"
    mkdir "%~1\IUT\TP\s1\r1_09_eco"
    mkdir "%~1\IUT\TP\s1\r1_10_anglais"
    mkdir "%~1\IUT\TP\s1\r1_11_communication"
    mkdir "%~1\IUT\TP\s1\r1_12_ppp"

    mkdir "%~1\IUT\TP\s1\p1_01_Portfolio"

    mkdir "%~1\IUT\TP\s1\sae1_01_Implementation_dun_besoin_client"
    mkdir "%~1\IUT\TP\s1\sae1_02_Comparaison_dapproches_algorithmiques"
    mkdir "%~1\IUT\TP\s1\sae1_03_Installation_dun_poste_de_developpement"
    mkdir "%~1\IUT\TP\s1\sae1_04_Creation_dune_base_de_donnees"
    mkdir "%~1\IUT\TP\s1\sae1_05_Recueil_du_besoins"
    mkdir "%~1\IUT\TP\s1\sae1_06_Decouverte_de_lenvironnement_economique_et_ecologique"


    :: Arborescence Semestre 2 ::
    mkdir "%~1\IUT\TP\s2"
    mkdir "%~1\IUT\TP\s2\r2_01_dev_objet"
    mkdir "%~1\IUT\TP\s2\r2_01_dev_objet\Cours"
    mkdir "%~1\IUT\TP\s2\r2_01_dev_objet\TP"
    mkdir "%~1\IUT\TP\s2\r2_01_dev_objet\TD"
    mkdir "%~1\IUT\TP\s2\r2_02_ihm"
    mkdir "%~1\IUT\TP\s2\r2_03_qualite_dev"
    mkdir "%~1\IUT\TP\s2\r2_04_reseau_bas_niveau"
    mkdir "%~1\IUT\TP\s2\r2_05_services_reseaux"
    mkdir "%~1\IUT\TP\s2\r2_06_bado"
    mkdir "%~1\IUT\TP\s2\r2_07_graphes"
    mkdir "%~1\IUT\TP\s2\r2_08_statistiques"
    mkdir "%~1\IUT\TP\s2\r2_09_methodes_numeriques"
    mkdir "%~1\IUT\TP\s2\r2_10_gpo"
    mkdir "%~1\IUT\TP\s2\r2_11_droit"
    mkdir "%~1\IUT\TP\s2\r2_12_anglais"
    mkdir "%~1\IUT\TP\s2\r2_13_communication"
    mkdir "%~1\IUT\TP\s2\r2_14_ppp"

    mkdir "%~1\IUT\TP\s2\p2_01_Portfolio"

    mkdir "%~1\IUT\TP\s2\sae2_01_Developpement_d'une_application"
    mkdir "%~1\IUT\TP\s2\sae2_02_Exploration_algorithmique_d'un_probleme"
    mkdir "%~1\IUT\TP\s2\sae2_03_Installation_de_services_reseau"
    mkdir "%~1\IUT\TP\s2\sae2_04_Exploitation_d'une_base_de_donnees"
    mkdir "%~1\IUT\TP\s2\sae2_05_Gestion_d'un_projet"
    mkdir "%~1\IUT\TP\s2\sae2_06_Organisation_d'un_travail_d'equipe"


    :: Arborescence Semestre 3 ::
    mkdir "%~1\IUT\TP\s3"
    mkdir "%~1\IUT\TP\s3\r3_01_dev_web"
    mkdir "%~1\IUT\TP\s3\r3_02_dev_efficace"
    mkdir "%~1\IUT\TP\s3\r3_03_analyse"
    mkdir "%~1\IUT\TP\s3\r3_04_qualite_dev"
    mkdir "%~1\IUT\TP\s3\r3_05_prog_syst"
    mkdir "%~1\IUT\TP\s3\r3_06_reseaux"
    mkdir "%~1\IUT\TP\s3\r3_07_sql"
    mkdir "%~1\IUT\TP\s3\r3_08_proba"
    mkdir "%~1\IUT\TP\s3\r3_09_crypto"
    mkdir "%~1\IUT\TP\s3\r3_10_msi"
    mkdir "%~1\IUT\TP\s3\r3_11_droits"
    mkdir "%~1\IUT\TP\s3\r3_12_anglais"
    mkdir "%~1\IUT\TP\s3\r3_13_communication"
    mkdir "%~1\IUT\TP\s3\r3_14_PPP"

    mkdir "%~1\IUT\TP\s3\p3_01_Portfolio"

    mkdir "%~1\IUT\TP\s3\sae3_01_Developpement_d'une_application"


    :: Arborescence Semestre 4 ::
    mkdir "%~1\IUT\TP\s4"
    mkdir "%~1\IUT\TP\s4\r4.01_architect_logicielle"
    mkdir "%~1\IUT\TP\s4\r4.02_qual_dev"
    mkdir "%~1\IUT\TP\s4\r4.03_bd"
    mkdir "%~1\IUT\TP\s4\r4.04_meth_optimisation"
    mkdir "%~1\IUT\TP\s4\r4.05_anglais"
    mkdir "%~1\IUT\TP\s4\r4.06_communication"
    mkdir "%~1\IUT\TP\s4\r4.07_ppp"
    mkdir "%~1\IUT\TP\s4\r4.08_virtualisation"
    mkdir "%~1\IUT\TP\s4\r4.09_msi"
    mkdir "%~1\IUT\TP\s4\r4.10_compl_web"
    mkdir "%~1\IUT\TP\s4\r4.11_dev_modile"
    mkdir "%~1\IUT\TP\s4\r4.12_automates"

    mkdir "%~1\IUT\TP\s4\p4_01_Portfolio"

    mkdir "%~1\IUT\TP\s4\s4.01_dev_application"


    :: Arborescence Semestre 5 ::
    mkdir "%~1\IUT\TP\s5"
    mkdir "%~1\IUT\TP\s5\r5.01_management_equipe_informatique"
    mkdir "%~1\IUT\TP\s5\r5.02_ppp"
    mkdir "%~1\IUT\TP\s5\r5.03_communication"
    mkdir "%~1\IUT\TP\s5\r5.04_qualite_algorithmique"
    mkdir "%~1\IUT\TP\s5\r5.05_prog_avancee"
    mkdir "%~1\IUT\TP\s5\r5.06_prog_multimedia"
    mkdir "%~1\IUT\TP\s5\r5.07_automatisation_chaine_production"
    mkdir "%~1\IUT\TP\s5\r5.08_qualit_dev"
    mkdir "%~1\IUT\TP\s5\r5.09_virtualisation_avancee"
    mkdir "%~1\IUT\TP\s5\r5.10_bd"
    mkdir "%~1\IUT\TP\s5\r5.11_aide_decision"
    mkdir "%~1\IUT\TP\s5\r5.12_modelisation"
    mkdir "%~1\IUT\TP\s5\r5.13_economie"
    mkdir "%~1\IUT\TP\s5\r5.14_anglais"

    mkdir "%~1\IUT\TP\s5\p4_01_Portfolio"

    mkdir "%~1\IUT\TP\s5\s5.01_developpement_avance"


    :: Arborescence Semestre 6 ::
    mkdir "%~1\IUT\TP\s6"
    mkdir "%~1\IUT\TP\s6\r6.01_entrepreneuriat"
    mkdir "%~1\IUT\TP\s6\r6.02_droit"
    mkdir "%~1\IUT\TP\s6\r6.03_communication"
    mkdir "%~1\IUT\TP\s6\r6.04_ppp"
    mkdir "%~1\IUT\TP\s6\r6.05_dev_avance"
    mkdir "%~1\IUT\TP\s6\r6.06_maintenance_applicative"

    mkdir "%~1\IUT\TP\s6\s6.01_developpement_avance"
goto :eof
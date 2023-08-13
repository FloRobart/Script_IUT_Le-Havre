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
            setlocal EnableDelayedExpansion
                set "folder=%~1"
                call :creation_arborescence "%~1" && call :ArborescenceCreer "Arborescence creee avec succes dans le dossier ""!folder!""" || ( call :ArborescenceFailed & goto :eof )
            endlocal
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
    :: Arborescence générale ::
    mkdir "%~1/IUT"
    mkdir "%~1/IUT/TP"
    mkdir "%~1/IUT/TP/java"
    mkdir "%~1/IUT/TP/java/paquetage_class"
    mkdir "%~1/IUT/TP/java/paquetage_java"


    :: Arborescence Semestre 1 ::
    mkdir "%~1/IUT/TP/s1"
    mkdir "%~1/IUT/TP/s1/r1.01_init_dev"
    mkdir "%~1/IUT/TP/s1/r1.01_init_dev/Cours"
    mkdir "%~1/IUT/TP/s1/r1.01_init_dev/TP"
    mkdir "%~1/IUT/TP/s1/r1.01_init_dev/TD"
    mkdir "%~1/IUT/TP/s1/r1.02_intro_web"
    mkdir "%~1/IUT/TP/s1/r1.03_intro_archi"
    mkdir "%~1/IUT/TP/s1/r1.04_intro_syst"
    mkdir "%~1/IUT/TP/s1/r1.05_intro_bd"
    mkdir "%~1/IUT/TP/s1/r1.06_math_discretes"
    mkdir "%~1/IUT/TP/s1/r1.07_outils_fondamentaux"
    mkdir "%~1/IUT/TP/s1/r1.08_gpo"
    mkdir "%~1/IUT/TP/s1/r1.09_eco"
    mkdir "%~1/IUT/TP/s1/r1.10_anglais"
    mkdir "%~1/IUT/TP/s1/r1.11_communication"
    mkdir "%~1/IUT/TP/s1/r1.12_ppp"

    mkdir "%~1/IUT/TP/s1/sae1.01_Implementation_dun_besoin_client"
    mkdir "%~1/IUT/TP/s1/sae1.02_Comparaison_dapproches_algorithmiques"
    mkdir "%~1/IUT/TP/s1/sae1.03_Installation_dun_poste_de_developpement"
    mkdir "%~1/IUT/TP/s1/sae1.04_Creation_dune_base_de_donnees"
    mkdir "%~1/IUT/TP/s1/sae1.05_Recueil_de_besoins"
    mkdir "%~1/IUT/TP/s1/sae1.06_Decouverte_de_lenvironnement_économique_et_ecologique"


    :: Arborescence Semestre 2 ::
    mkdir "%~1/IUT/TP/s2"
    mkdir "%~1/IUT/TP/s2/r2.01_dev_objet"
    mkdir "%~1/IUT/TP/s2/r2.01_dev_objet/Cours"
    mkdir "%~1/IUT/TP/s2/r2.01_dev_objet/TP"
    mkdir "%~1/IUT/TP/s2/r2.01_dev_objet/TD"
    mkdir "%~1/IUT/TP/s2/r2.02_ihm"
    mkdir "%~1/IUT/TP/s2/r2.03_qualite_dev"
    mkdir "%~1/IUT/TP/s2/r2.04_reseau_bas_niveau"
    mkdir "%~1/IUT/TP/s2/r2.05_services_reseaux"
    mkdir "%~1/IUT/TP/s2/r2.06_bd"
    mkdir "%~1/IUT/TP/s2/r2.07_graphes"
    mkdir "%~1/IUT/TP/s2/r2.08_stat"
    mkdir "%~1/IUT/TP/s2/r2.09_meth_numeriques"
    mkdir "%~1/IUT/TP/s2/r2.10_gpo"
    mkdir "%~1/IUT/TP/s2/r2.11_droit"
    mkdir "%~1/IUT/TP/s2/r2.12_anglais"
    mkdir "%~1/IUT/TP/s2/r2.13_communication"
    mkdir "%~1/IUT/TP/s2/r2.14_ppp"

    mkdir "%~1/IUT/TP/s2/Portfolio"

    mkdir "%~1/IUT/TP/s2/sae2.01_Développement_dune_application"
    mkdir "%~1/IUT/TP/s2/sae2.02_Exploration_algorithmique_dun_problème"
    mkdir "%~1/IUT/TP/s2/sae2.03_Installation_de_services_réseau"
    mkdir "%~1/IUT/TP/s2/sae2.04_Exploitation_dune_base_de_données"
    mkdir "%~1/IUT/TP/s2/sae2.05_Gestion_dun_projet"
    mkdir "%~1/IUT/TP/s2/sae2.06_Organisation_dun_travail_déquipe"


    :: Arborescence Semestre 3 ::
    mkdir "%~1/IUT/TP/s3"
    mkdir "%~1/IUT/TP/s3/r3.01_dev_web"
    mkdir "%~1/IUT/TP/s3/r3.02_dev_eff"
    mkdir "%~1/IUT/TP/s3/r3.03_analyse"
    mkdir "%~1/IUT/TP/s3/r3.04_qualit_dev"
    mkdir "%~1/IUT/TP/s3/r3.05_prog_syst"
    mkdir "%~1/IUT/TP/s3/r3.06_reseaux"
    mkdir "%~1/IUT/TP/s3/r3.07_bd"
    mkdir "%~1/IUT/TP/s3/r3.08_proba"
    mkdir "%~1/IUT/TP/s3/r3.09_crypto"
    mkdir "%~1/IUT/TP/s3/r3.10_msi"
    mkdir "%~1/IUT/TP/s3/r3.11_droits"
    mkdir "%~1/IUT/TP/s3/r3.12_anglais"
    mkdir "%~1/IUT/TP/s3/r3.13_communication"
    mkdir "%~1/IUT/TP/s3/r3.14_PPP"
 
    mkdir "%~1/IUT/TP/s3/p3.01_Portfolio"

    mkdir "%~1/IUT/TP/s3/s3.01_dev_application"


    :: Arborescence Semestre 4 ::
    mkdir "%~1/IUT/TP/s4"
    mkdir "%~1/IUT/TP/s4/r4.01_architect_logicielle"
    mkdir "%~1/IUT/TP/s4/r4.02_qual_dev"
    mkdir "%~1/IUT/TP/s4/r4.03_bd"
    mkdir "%~1/IUT/TP/s4/r4.04_meth_optimisation"
    mkdir "%~1/IUT/TP/s4/r4.05_anglais"
    mkdir "%~1/IUT/TP/s4/r4.06_communication"
    mkdir "%~1/IUT/TP/s4/r4.07_ppp"
    mkdir "%~1/IUT/TP/s4/r4.08_virtualisation"
    mkdir "%~1/IUT/TP/s4/r4.09_msi"
    mkdir "%~1/IUT/TP/s4/r4.10_compl_web"
    mkdir "%~1/IUT/TP/s4/r4.11_dev_mobile"
    mkdir "%~1/IUT/TP/s4/r4.12_automates"

    mkdir "%~1/IUT/TP/s4/s4.01_dev_application"

    mkdir "%~1/IUT/TP/s4/Stage"


    :: Arborescence Semestre 5 ::
    mkdir "%~1/IUT/TP/s5"
    mkdir "%~1/IUT/TP/s5/r5.01_management_equipe_informatique"
    mkdir "%~1/IUT/TP/s5/r5.02_ppp"
    mkdir "%~1/IUT/TP/s5/r5.03_communication"
    mkdir "%~1/IUT/TP/s5/r5.04_qualite_algorithmique"
    mkdir "%~1/IUT/TP/s5/r5.05_prog_avancee"
    mkdir "%~1/IUT/TP/s5/r5.06_prog_multimedia"
    mkdir "%~1/IUT/TP/s5/r5.07_automatisation_chaine_production"
    mkdir "%~1/IUT/TP/s5/r5.08_qualit_dev"
    mkdir "%~1/IUT/TP/s5/r5.09_virtualisation_avancee"
    mkdir "%~1/IUT/TP/s5/r5.10_bd"
    mkdir "%~1/IUT/TP/s5/r5.11_aide_decision"
    mkdir "%~1/IUT/TP/s5/r5.12_modelisation"
    mkdir "%~1/IUT/TP/s5/r5.13_economie"
    mkdir "%~1/IUT/TP/s5/r5.14_anglais"

    mkdir "%~1/IUT/TP/s5/s5.01_developpement_avance"


    :: Arborescence Semestre 6 ::
    mkdir "%~1/IUT/TP/s6"
    mkdir "%~1/IUT/TP/s6/r6.01_entrepreneuriat"
    mkdir "%~1/IUT/TP/s6/r6.02_droit"
    mkdir "%~1/IUT/TP/s6/r6.03_communication"
    mkdir "%~1/IUT/TP/s6/r6.04_ppp"
    mkdir "%~1/IUT/TP/s6/r6.05_dev_avance"
    mkdir "%~1/IUT/TP/s6/r6.06_maintenance_applicative"

    mkdir "%~1/IUT/TP/s6/s6.01_developpement_avance"

    mkdir "%~1/IUT/TP/s6/Stage"
goto :eof
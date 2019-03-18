#! /bin/tcsh -f

tar -czf /valhall1/Backups/cvs.tar.gz cvs
cp -r CourseMaterials /valhall1/Backups/CourseMaterials
cp -r Experiments /valhall1/Backups/Experiments
cp -r Reaction /valhall1/Backups/Reaction
cp -r react /valhall1/Backups/react
cp -r papers /valhall1/Backups/papers
cp -r reactionCD /valhall1/Backups/reactionCD


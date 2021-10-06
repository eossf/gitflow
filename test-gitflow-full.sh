# creation d'un repo
git init

# premier fichier
touch firstfile.txt
git add .
git commit -m "initial"

# create develop branch
git branch develop

# nouvelle branch feature 
git branch feature/DSO-100-Ajout-du-sensitive-data
git checkout feature/DSO-100-Ajout-du-sensitive-data
touch sensitive-data.txt
git add .
git commit -m "fin dev sensitive data"

# merge DSO-100 > develop
git checkout develop
git merge --no-ff feature/DSO-100-Ajout-du-sensitive-data

# branch release v 1.0.0
git branch release/1.0.0
git checkout release/1.0.0
echo "release 1.0.0" > README.md
git add .
git commit -m "release 1.0.0"

# merge release > develop
git checkout develop
git merge --no-ff release/1.0.0

# merge develop > master
git checkout master
git merge --no-ff develop

# master part en CICD
git tag 1.0.0

# bug urgent ---------------------------------------------
git branch hotfix/1.0.0.1
git checkout hotfix/1.0.0.1
touch fix-bug.txt
git add .
git commit -m "fix the scariest bug found in the history"

# merge sur master
git checkout master
git merge --no-ff hotfix/1.0.0.1

# tag , pour la CICD
git tag 1.0.0.1

# applique en dev le hotfix -------------------------------
git checkout develop
git merge --no-ff hotfix/1.0.0.1

# -- nouvelle branche feature
git checkout develop
git branch feature/DSO-101-GPScoord
git checkout feature/DSO-101-GPScoord
touch GPScoord.txt
git add .
git commit -m "ajout GPS coordonnees"

# merge DSO-101 > develop
git checkout develop
git merge --no-ff feature/DSO-101-GPScoord

# branch release v 1.2.0
git branch release/1.2.0
git checkout release/1.2.0
echo "release 1.2.0" >> README.md
git add .
git commit -m "release 1.2.0"

# merge release > develop
git checkout develop
git merge --no-ff release/1.2.0

# merge develop > master
git checkout master
git merge --no-ff develop

# master part en CICD
git tag 1.2.0
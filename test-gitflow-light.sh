# creation d'un repo
git init

# premier fichier
touch firstfile.txt
git add .
git commit -m"initial"

# create release only
git branch release/1.0.0

# nouvelle branch feature 
git branch feature/DSO-100-Ajout-du-sensitive-data
git checkout feature/DSO-100-Ajout-du-sensitive-data
touch sensitive-data.txt
git add .
git commit -m "fin dev sensitive data"

# merge DSO-100 > release
git checkout release/1.0.0
git merge --no-ff feature/DSO-100-Ajout-du-sensitive-data

# branch release v 1.0.0
echo "release 1.0.0" > README.md
git add .
git commit -m "release 1.0.0"

# merge release > master
git checkout master
git merge --no-ff release/1.0.0

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

# -- nouvelle release
git checkout master
git branch release/1.2.0

# -- nouvelle branche feature
git branch feature/DSO-101-GPScoord
git checkout feature/DSO-101-GPScoord
touch GPScoord.txt
git add .
git commit -m "ajout GPS coordonnees"

# merge DSO-101 > release
git checkout release/1.2.0
git merge --no-ff feature/DSO-101-GPScoord
echo "release 1.2.0" >> README.md
git add .
git commit -m "release 2.0.0"

# tag , pour la CICD
git checkout master
git merge --no-ff release/1.2.0
git tag 1.2.0
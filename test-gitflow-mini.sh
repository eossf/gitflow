# creation d'un repo
git init

# premier fichier
touch firstfile.txt
git add .
git commit -m"initial"

# create develop only
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

# release v 1.0.0
echo "release 1.0.0" > README.md
git add .
git commit -m "release 1.0.0"

# merge release > master
git checkout master
git merge --no-ff develop

# master part en CICD
git tag 1.0.0

#!/bin/bash
echo "Enter git repo (e.g. mulesoft/analytics-api-services) and press [ENTER]:"
read name
echo "Git repo -> " $name

repoName="git@github.com:$name.git"
git clone $repoName
directory=$(echo $name | cut -d'/' -f 2)  
cd $directory
pwd
existing_branch=$(git branch)
existing_branch="${existing_branch#* }"
new_branch="raml-1.0"
git checkout -B $new_branch
raml_files="$(find . -name '*.raml')"
array=(${raml_files//.raml/})
for element in "${array[@]}"
do
    echo "raml file path : $element.raml"
    mv $element.raml old.raml
    ../oas-raml-converter/lib/bin/converter.js --from RAML --to RAML old.raml > $element.raml
    rm old.raml 
    git add $element.raml
done

git commit -m "raml 1.0" --quiet
git push origin $new_branch --quiet
sleep 5 
pullr -n -t "RAML 1.0 migration" -d "Please review the PR to see changes from RAML 0.8 to 1.0" -i $existing_branch -f $new_branch --plaintext 

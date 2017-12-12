# RAMLing

## Libraries used :

1) https://github.com/mulesoft/oas-raml-converter 
checked known issues in Github project, 

<code> git clone git@github.com:mulesoft/oas-raml-converter.git ; </code>
<code> cd oas-raml-converter ; npm install ; npm run build </code>

test run the converter against a raml file following the README.md

2) https://www.npmjs.com/package/pullr allows you to make pull requests from command line (optional)

<code>npm install -g pullr </code>

3) Once you download above 2 libraries, run 

<code>sh ramling.sh </code> 
and provide your git repo name.


## Link to RAML standards
https://github.com/raml-org/raml-spec/tree/master/versions
review major changes from 0.8 to 1.0 when converting your RAML using tool - especially with “schemas”, “securedBy”, “types”, “!include” ask Uri or in #raml channel. ;) 

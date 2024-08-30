#!/bin/bash
# Faz backup do arquivo existente
mv ../files.txt ../files.txt_$(date +"%Y%m%d_%H%M%S") 

# Gera o novo arquivo files.txt
find . -mindepth 2 -maxdepth 2 -type f ! -path '*/.git/*' -print0 | 
xargs -0 -I {} sh -c 'echo -e "\n# {} início =============================\n"; cat {}; echo -e "\n# {} fim =============================\n";' >> ../files.txt

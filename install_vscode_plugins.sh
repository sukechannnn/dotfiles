cat ./vscode-packages.txt | while read line
do
 code --install-extension $line
done


[[
Title: The Ultimate Vim Cookbook
author: Jules RANDOLPH
description: The default PyKwiki startup page.
tags: [linux,shell]
]]

# THE ULTIMATE VIM COOKBOOK

## File handling

:r file : read in file and insert to current cursor position   
:w : save  
:w file : save to file  
:w! file : ovewrite file  
:x or :wq : exit and write out modified file  
:q : quit  
:q! : quit aborting modifications  

## Movements

h : left  
j : bottom  
k : top  
l : right  

$ : end of line  
e : end of word  
w : begining of word  
% : corresponding bracket (,[,{ with },],)  

## Operators

d : delete  
dd : delete line  
dXe : delete X words til end of last word  
D : delete the rest of current line  
r : replace one char  
R : replace until ESC hit  
c : change (+mouvement, permet de supprimer puis éditer dans un même temps)  
i : insert  
I : insert at begening of line  
a : append  
A : append to end of line  
o : start a new line below and insert text until ESC hit  
O : start a new line above and insert text until ESC hit  
x : delete current char  
v : lance le mode visuel (sélection)  
y : copie la sélection courrante  
yy : yank (copy) current line into buffer  
Nyy: yank (copy) the N next lines into buffer, including current  
p : paste yank content  

## Jokers

u : annuler la dernière opération  
U : annuler toutes les modification sur la ligne courante  
:sh command : open an external command shell. When exiting, will fall back to current vi session  
:! command : execute command from current vi and outputs results. Press ENTER to fall back to vi session  
CTRL+D : while typing a command, show autocomplete  
:help command : show help for command  
:0 or 1G : move to begening of file  
:$ or G : move to EOF  
:n or nG : move to line n  
^l : refresh and center screen  
:set option : set option. Usefull options ("ic":ignorecase,"is":increcherche,"hls":highlightsearch)  

## Substitution

:s/old/new/g : remplace old par new sur toute la ligne  
:s/old/new : remplace la première occurence de old par new   
:%s/old/new/g : remplace old par new dans tout le fichier  
:%s/old/new/gc : remplace old par new dans tout le fichier et demande confirmation pour chaque match  
:3,5s/old/new/g : remplace old par new depuis la ligne 3 jusqu'à la ligne 5  

## Recherches

/ pattern : recherche le pattern vers l'avant  
? pattern : recherche le pattern vers l'arrière  
n : move to next occurence of found pattern  
N ; move to previous occurrence of found pattern  

## VIM

Pour activer les fonctionnalités avancées de vim, : 'vim ~/.vimrc' puis ':r $VIMRUNTIME/vimrc_example.vim'


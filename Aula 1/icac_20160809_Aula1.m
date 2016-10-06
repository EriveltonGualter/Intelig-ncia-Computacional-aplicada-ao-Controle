clear all, close all, clc
%% autor: ERIVELTON GUALTER DOS SANTOS

%% Aula 01 - ICAC - Exercício 1

net1 = newp([-3 3; -3 3; -3 3], 3);

net1.layers{1}.transferFcn = 'tansig';
net1.IW{1,1} = [-.5 1 .5; .5 1 -.5; 1 1 1];
a1 = sim (net1, [1;2;3])


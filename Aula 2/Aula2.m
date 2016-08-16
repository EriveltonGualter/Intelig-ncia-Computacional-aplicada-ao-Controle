% Aula 2 

clc, clear all, close all

% Example
% net = newp([-2 2; -2 2], 1);    % 2 entradas , 1 saída
% p = [2 1 -1 -1; 2 -2 2 1]; % Entrada
% t = [1 1 0 0];  % Saída desejável
% sim(net, p)
% net = train(net, p, t);
% sim(net, p)

net = newp([-2 2; -2 2; -2 2; -2 2; -2 2], 4);

% Entradas 5x1
Beethoven   = [1; 1; 1; -1; -1];
Homero      = [1; -1; 1; -1; 1];
Picasso     = [1; 1; -1; -1; 1];

% Saídas 4x1
Music       = [1; 1; -1; -1];
Literaure   = [1; -1; 1; -1];
Painting    = [1; -1; -1; 1];

p = {Beethoven Homero Picasso};
t = {Music Literaure Painting};

net.layers{1}.transferFcn = 'hardlims';

s1 = sim(net, p)
net = train(net, p, t);
s2 = sim(net, p)

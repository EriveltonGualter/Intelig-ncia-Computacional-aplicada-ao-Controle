clear
clc
close all

sim('GenerareData.slx');            % Open Simulink "Generate Data"
save                                % Save file

net = feedforwardnet(6);           % Classification algorithm 
%load('matlab.mat')                 % Load created data
load('treinamento_moodle.mat')      % Load Data from Moodle

net = train(net,teta',torque');     % Train network

gensim(net,-1)                      % Generate block

out = sim(net,teta');               % Recall 

% Plot 
plot(out(1,:),'x')
hold on
plot(torque(:,1),'ro')

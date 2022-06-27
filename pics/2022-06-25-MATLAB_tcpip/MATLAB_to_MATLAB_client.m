clear; close all; clc;

client = tcpclient('192.168.35.233',5000,'Timeout',20);
pause(1)
rawData = readline(client);
disp(rawData);

%%
pause(1)
writeline(client, "Hi Back!")
clear; close all; clc;

% Server
[~,hostname] = system('hostname');
hostname = string(strtrim(hostname));
address = resolvehost(hostname,"address");

server = tcpserver(address,5000,"ConnectionChangedFcn",@connectionFcn);
configureCallback(server,"terminator",@readDataFcn);

function connectionFcn(src, ~)
if src.Connected
    disp("Client connection accepted by server.")
    writeline(src, "Hi, MATLAB!");
end
end

function readDataFcn(src, ~)
disp("Data was received from the client.")
src.UserData = read(src,src.NumBytesAvailable,"string");
disp(src.UserData);
end

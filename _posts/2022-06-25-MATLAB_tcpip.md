---
title: MATLAB의 tcp/ip 통신
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20220625
tags: MATLAB
---

본 내용에 대한 더 자세한 내용은 MathWorks 홈페이지를 참고하시기 바랍니다.

- [TCP/IP Interface](https://www.mathworks.com/help/instrument/tcp-ip-interface.html?s_tid=CRUX_lftnav)

# MATLAB 서버 / MATLAB 클라이언트

- [Communicate Between a TCP/IP Client and Server in MATLAB](https://www.mathworks.com/help/instrument/communicate-between-a-tcpip-client-and-server-in-matlab.html)

```MATLAB
% Server
[~,hostname] = system('hostname');
hostname = string(strtrim(hostname));
address = resolvehost(hostname,"address");

server = tcpserver(address,5000,"ConnectionChangedFcn",@connectionFcn)
configureCallback(server,"byte",7688,@readDataFcn);

function connectionFcn(src, ~)
if src.Connected
    disp("Client connection accepted by server.")
    data = membrane(1);
    write(src,data(:),"double");
end
end

function readDataFcn(src, ~)
disp("Data was received from the client.")
src.UserData = read(src,src.BytesAvailableFcnCount/8,"double");
reshapedServerData = reshape(src.UserData,31,31);
surf(reshapedServerData);
end

```

```MATLAB
% Client
client = tcpclient(server.ServerAddress,server.ServerPort,"Timeout",5) % 실제 IP 주소와 포트 번호를 입력하세요.
pause(1);
rawData = read(client,961,"double");
reshapedData = reshape(rawData,31,31);
surf(reshapedData);
```

# MATLAB 서버 / Python 클라이언트


```MATLAB
clear; close all; clc;

[~,hostname] = system('hostname');
hostname = string(strtrim(hostname));
address = resolvehost(hostname,"address");

server = tcpserver(address,5000,"ConnectionChangedFcn",@connectionFcn)

function connectionFcn(src, ~)
if src.Connected
    disp("Client connection accepted by server.")
%     data = read(src, 11, "string");
    write(src, "Hi Python", "string");
end
end
```

```Python
# -*- coding: utf-8 -*-

import socket

# 접속 정보 설정
SERVER_IP = '192.000.000.000' # 실제 아이피 주소는 가렸습니다.
SERVER_PORT = 5000
SIZE = 16
SERVER_ADDR = (SERVER_IP, SERVER_PORT)

# 클라이언트 소켓 설정
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client_socket:
    client_socket.connect(SERVER_ADDR)  # 서버에 접속
    client_socket.send('hi'.encode())  # 서버에 메시지 전송
    msg = client_socket.recv(SIZE)  # 서버로부터 응답받은 메시지 반환
    print("resp from server : {}".format(msg))  # 서버로부터 응답받은 메시지 출력
```
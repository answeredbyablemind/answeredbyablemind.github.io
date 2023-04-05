clc,clear,cla
wobj = VideoWriter('test1.mp4');
wobj.Quality = 100;
wobj.FrameRate = 10;                  % frames per second (video speed)
open(wobj);                           % open file
t = linspace(0,2*pi);
[x,y] = pol2cart(t,1);                % simpe circle
plot(x,y)
axis equal
mkdir('test')
set(0,'defaultlinelinesmoothing')
for i = 1:1:length(x)-1
    line(x(i:i+1),y(i:i+1),'linew',2) % add line
    if ~exist('./test/','dir')
        mkdir([pwd,'/test/']);
    end
    fname = ['test\test' num2str(i)]; % full name of image
    print('-djpeg','-r200',fname)     % save image with '-r200' resolution
    I = imread([fname '.jpg']);       % read saved image
    frame = im2frame(I);              % convert image to frame
    writeVideo(wobj,frame);           % save frame into video
end
close(wobj);                          % close file
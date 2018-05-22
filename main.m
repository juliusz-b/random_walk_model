refreshRate = 50; %in Hz
timeStep = 1/refreshRate;
timeLimit = 120;
timeRange = 0:timeStep:timeLimit;

positionMatrix = zeros(1,length(timeRange).*2);

xStart = 0;
yStart = 0;
xEnd =  80;
yEnd = 80;

positionMatrix(1,1) = randi([xStart xEnd],1,1);
positionMatrix(1,2) = randi([yStart yEnd],1,1);

for i=3:2:2*length(timeRange)
    while (1)
        moveMatrix(1,1)=randi([-1 1],1,1);
        moveMatrix(1,2)=randi([-1 1],1,1);
        positionMatrix(1, i)=positionMatrix(1, i-2)+moveMatrix(1,1);
        positionMatrix(1, i+1)=positionMatrix(1, i-1)+moveMatrix(1,2);
            if ((positionMatrix(1, i)>=xStart) && (positionMatrix(1, i)<=xEnd) && (positionMatrix(1, i+1)>=yStart) && (positionMatrix(1, i+1)<=yEnd))
                break
            end
    end
end

x = positionMatrix(1,1:2:end);
y = positionMatrix(1,2:2:end);


figure();
plot(x,y), xlabel('x'), ylabel('y'), title('Wykres'), grid on;
set(gca,'XAxisLocation','top','YAxisLocation','left','ydir','reverse');
ylim([yStart yEnd]) 
xlim([xStart xEnd])
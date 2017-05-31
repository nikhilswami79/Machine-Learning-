
X = x
Y = y

x = X.'
t = Y.'

net = patternnet(50);

size(x)
size(t)

view(net)
[net,tr] = train(net,x,t);
nntraintool
plotperform(tr)
testX = x(:,tr.testInd);
testT = t(:,tr.testInd);

testY = net(testX);
testIndices = vec2ind(testY)
plotconfusion(testT,testY)
[c,cm] = confusion(testT,testY)

fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);

plotroc(testT,testY)
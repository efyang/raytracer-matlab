im = 1000;
image = zeros(im);
for ii = 0:im - 1
    image = image + diag((im - ii) * ones(im - ii, 1),ii) + diag((im - ii) * ones(im - ii, 1), -ii);
end
    
nextframe = image;
h = imagesc(image);

while 1
    nextframe(:, :) = rem(nextframe(:, :) + 1, im);
    set(h, 'Cdata', nextframe);
    drawnow;
    pause(1/60);
end
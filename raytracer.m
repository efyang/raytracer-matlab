v = Viewport();
s = Scene();
s.add_object(AABB([2 1 0]', [4 3 6]', [0 0 0]));
%hold on
tic
image = s.render(v);
toc

%plotcube([4 3 6] - [2 1 0], [2 1 0], 1, [1 1 1]); 
v = Viewport();
s = Scene();
s.add_object(AABB([2 1 0]', [4 1 6]', [0 0 0]));

tic
image = s.render(v);
toc
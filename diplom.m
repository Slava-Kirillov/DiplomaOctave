clear;

format shortG;
cd /home/kirillov/CLionProjects/DiplomaMSU/resource/data/

norm_vectors = load('normal_vectors.dat');
tau1_vectors = load('tau1_vectors.dat');
tau2_vectors = load('tau2_vectors.dat');
points = load('collocation_points.dat');
sphere = load('sphere_.dat');

hold on;

for i=1:1250
  p = [sphere(i,1:3); sphere(i,4:6);sphere(i,7:9);sphere(i,10:12)];
  plot3(p(:,1), p(:,2), p(:,3), 'k')
end

plot3(points(:,1),points(:,2),points(:,3), '.k')

for i=1:length(points)
  for j=1:3;
    n(1,j) = points(i,j);
    n(2,j) = norm_vectors(i,j) + points(i,j);
    
    t1(1,j) = points(i,j);
    t1(2,j) = tau1_vectors(i,j) + points(i,j);
    t2(1,j) = points(i,j);
    t2(2,j) = tau2_vectors(i,j) + points(i,j);
  end
 
 if i == 650
    plot3(n(:,1),n(:,2),n(:,3), 'b')
    plot3(t1(2,1),t1(2,2),t1(2,3), 'og')
    plot3(t1(:,1),t1(:,2),t1(:,3), 'b')
    plot3(t2(:,1),t2(:,2),t2(:,3), 'b')
 end
    %{
    plot3(t1(2,1),t1(2,2),t1(2,3), 'og')
    plot3(t1(:,1),t1(:,2),t1(:,3), 'b')
    plot3(t2(:,1),t2(:,2),t2(:,3), 'b')
    plot3(n(:,1),n(:,2),n(:,3), 'b')
    %}


end

grid on;
hold off;

%}
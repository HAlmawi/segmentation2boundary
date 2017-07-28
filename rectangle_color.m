function [ rec ] = rectangle_color(R,G,B)
    rec = ones([512 218 3]);
    rec(:,:,1) = rec(:,:,1) .* double(R);
    rec(:,:,2) = rec(:,:,2) .* double(G);
    rec(:,:,3) = rec(:,:,3) .* double(B);
end


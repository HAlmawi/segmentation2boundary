function change_color(folder_name,prev_color,new_color)
    images = dir(strcat(folder_name,'/*.png'));
    for i=1:size(images,1)
        im = imread(strcat(folder_name,'/',images(i).name));
        temp = ones([size(im,1) size(im,2)]);
        mask = ones([size(im,1) size(im,2)]);
        for j=1:3
            mask(:,:) = mask(:,:) .* (im(:,:,j) == (temp(:,:) * double(prev_color(j))));
        end
        [x,y] = find(mask(:,:)==1);
        for n=1:size(x,1)
            im(x(n),y(n),1) = double(new_color(1));
            im(x(n),y(n),2) = double(new_color(2));
            im(x(n),y(n),3) = double(new_color(3));
        end
        imwrite(im,strcat(folder_name,'/',images(i).name));
    end
end


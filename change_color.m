function change_color(folder_name,prev_color,new_color)
    images = dir(folder_name,'/*.png');
    for i=1:size(images,1)
        im = imread(strcat(folder_name,'/',images(i).name));
        for x=1:size(im,1)
            for y=1:size(im,2)
                if(squeeze(im(x,y,:))==squeeze(prev_color(:)))
                    im(x,y,1) = new_color(1);
                    im(x,y,2) = new_color(2);
                    im(x,y,3) = new_color(3);
                end
            end
        end
        imwrite(im,strcat(folder_name,'/',images(i).name));
    end
end


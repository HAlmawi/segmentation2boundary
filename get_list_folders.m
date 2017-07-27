function [ list_folders ] = get_list_folders(path)
    folders = dir(path);
    folders = folders(3:end);
    list_folders = cell([1 size(folders,1)]);
    for i=1:size(folders,1)
        list_folders{i} = folders(i).name;
    end
end


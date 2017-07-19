function f = cluser(neighbour,id,data)
% input:
% neighbour: type: int, min interval to cluster;
% id: type: 1*n matrix, data to be clustered;
% data: according data.
% 
% output:
% f: clustered id

if nargin == 3
    flag = 1;
    set = id(1);
    while flag+1 <= length(id)
        if id(flag+1)-set < neighbour
            if data(id(flag)) >= data(id(flag+1))
                set = id(flag);
                id(flag + 1) = [];
            else
                set = id(flag + 1);
                id(flag) = [];
            end
        else
            set = id(flag + 1);
            flag = flag + 1;
        end
    end
else
    flag = 1;
    set = id(1);
    while flag+1 <= length(id)
        if abs(id(flag+1)-set) < neighbour
            set = id(flag);
            id(flag + 1) = [];
        else
            set = id(flag + 1);
            flag = flag + 1;
        end
    end
end
f = id;
end





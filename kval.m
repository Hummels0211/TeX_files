function k_1 = kval(tRange)
    for i = 1:1:length(tRange)
        if (tRange(i) >  0) && (tRange(i) < (tRange(end)*0.2))
            k_1 = 60000;
        else
            k_1 = 200;
        end
    end
end
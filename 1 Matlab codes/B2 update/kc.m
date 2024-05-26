function kc = kc(data)

tar_data = data;
data_len = length(tar_data);
for i = 1:1:data_len
    if(tar_data(i)>=0)
        tar_data_coarse(i) = 1;
    else
        tar_data_coarse(i) = 0;
    end
end
KC_mark     = zeros(data_len,1);
% 第一个元素直接记1
KC_mark(1)  = 1;
% 总模式数量，初始化置1
KC_cn       = 1;

% 已出现信号的长度
S_len       = 1;
% 未被记录的数据段开始位置
Q_start     = 2;
% 未被记录的数据段结束位置
Q_end       = 2;

for i = 2:1:data_len - 1
    S_data = tar_data_coarse(1:S_len);% 获取已记录模式的数据
    Q_data = tar_data_coarse(Q_start:i);% 获取未记录模式的数据
    
	% 如果新数据长度比已经记录的数据还长，则直接认定为新模式
    if(length(Q_data)>length(S_data))
        KC_mark(i)  = 1; 			% 标记新模式点
        S_len       = i; 			% 更新S末端位置
        Q_start     = i + 1; 		% 更新Q初始位置
        KC_cn       = KC_cn + 1; 	% 增加复杂度总量计数
        continue;
    end
    
	% 搜索匹配
    j_max = length(S_data) - length(Q_data) + 1;
    match_len = length(Q_data); % 如果计数匹配为Q_data长度则为已存在此模式
    match_count = 0;
    find_none_flag = 1; % 找不到Q模式
    for j = 1:1:j_max
        S_data_match = S_data(j:j+match_len-1);
        Q_data_match = Q_data;
        match_count = 0;
        for k = 1:1:match_len
            if(S_data_match(k)==Q_data_match(k))
                match_count = match_count + 1;
            end
        end 
        
        %finded
        if(match_count == match_len)
            find_none_flag = 0;
            break;
        end
    end
    
    if(find_none_flag ==1)
        KC_mark(i)  = 1;
        S_len       = i;
        Q_start     = i + 1;
        KC_cn       = KC_cn + 1;
        continue;
    end
end
kc=KC_cn / (data_len / log2(data_len));
end




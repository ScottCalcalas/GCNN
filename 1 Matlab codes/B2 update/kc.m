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
% ��һ��Ԫ��ֱ�Ӽ�1
KC_mark(1)  = 1;
% ��ģʽ��������ʼ����1
KC_cn       = 1;

% �ѳ����źŵĳ���
S_len       = 1;
% δ����¼�����ݶο�ʼλ��
Q_start     = 2;
% δ����¼�����ݶν���λ��
Q_end       = 2;

for i = 2:1:data_len - 1
    S_data = tar_data_coarse(1:S_len);% ��ȡ�Ѽ�¼ģʽ������
    Q_data = tar_data_coarse(Q_start:i);% ��ȡδ��¼ģʽ������
    
	% ��������ݳ��ȱ��Ѿ���¼�����ݻ�������ֱ���϶�Ϊ��ģʽ
    if(length(Q_data)>length(S_data))
        KC_mark(i)  = 1; 			% �����ģʽ��
        S_len       = i; 			% ����Sĩ��λ��
        Q_start     = i + 1; 		% ����Q��ʼλ��
        KC_cn       = KC_cn + 1; 	% ���Ӹ��Ӷ���������
        continue;
    end
    
	% ����ƥ��
    j_max = length(S_data) - length(Q_data) + 1;
    match_len = length(Q_data); % �������ƥ��ΪQ_data������Ϊ�Ѵ��ڴ�ģʽ
    match_count = 0;
    find_none_flag = 1; % �Ҳ���Qģʽ
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




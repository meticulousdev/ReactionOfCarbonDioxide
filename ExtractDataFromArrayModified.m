function ExtractDataFromArrayModified(srcArr, sIdx, eIdx, fileName)
% �ʱ�ȭ
% srcArr : �ҽ� ���
% srcRowLen : ���� ����� �� ����
% srcColLen : ���� ����� �� ����
% desArr : ���Ӱ� ������� ����� ����� ����
% j : ����� �������� ���� Ȯ��

[srcRowLen, srcColLen] = size(srcArr);
desArr = zeros((eIdx - sIdx), srcColLen);  
cmpArr = sIdx : 1 : eIdx;
j = 1;

% ó��
% �ð� ������ ������ ������ ����
for i = 1 :  srcRowLen
   
    if (srcArr(i, 1) ==  cmpArr(j))
        for k = 1 : srcColLen
            desArr(j, k) = srcArr(i, k);
        end % for k
        j = j + 1;
        
        if j > (eIdx - sIdx)
            break;
        end
    end % if

end % for i

% ���
% �ʿ��� �̸����� �Էµ� �����͸� ����
save(fileName, 'srcArr', 'desArr');
end % function desArr = ExtractDataFromArray(srcArr, desRowLen, desColLen)
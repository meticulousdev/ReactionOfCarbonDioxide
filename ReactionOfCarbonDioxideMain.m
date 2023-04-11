function ReactionOfCarbonDioxideMain(fileName, sheet, sIdx, eIdx)
% fileName(String) : �ҷ��� excel ������ �̸�
% sheet(String) : �ҷ����� excel ���Ͽ��� �����Ͱ� �ִ� sheet �̸�
% sIdx(Int) : �ҷ��� �������� ������ �ð�
% eIdx(Int) : �ҷ��� �������� �� �ð�
% 
% Ex
% fileName = 'CarbonDioxide';
% sheet = 'sheet2';
% sIdx = 0;
% eIdx = 455;

tic;
% fileNameExtension : ���� Ȯ����
% xlsFileName : excel ���� �̸�
% matFileName : matlab ���� �̸�

% Read Excel Data
fileNameExtension = '.xlsx';
xlsFileName = strcat(fileName, fileNameExtension);
srcArr = xlsread(xlsFileName, sheet);

% Save Extracted Data And Load Data
fileNameExtension = '.mat';
matFileName = strcat(fileName, fileNameExtension);
ExtractDataFromArrayModified(srcArr, sIdx, eIdx, matFileName);

% Solve Lsqcurvefit And ODE
ReactionOfCarbonDioxide(matFileName);
toc;
end
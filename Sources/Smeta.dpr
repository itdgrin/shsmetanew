program Smeta;

{$SETPEFlAGS $0001}

uses
  Forms,
  Windows,
  ShellAPI,
  Dialogs,
  System.SysUtils,
  System.IOUtils,
  DataModule in 'DataModule.pas' {DM: TDataModule},
  Main in 'Main.pas' {FormMain},
  TariffsMechanism in 'TariffsMechanism.pas' {FormTariffsMechanism},
  TariffsDump in 'TariffsDump.pas' {FormTariffsDump},
  TariffsIndex in 'TariffsIndex.pas' {FormTariffsIndex},
  About in 'About.pas' {fAbout},
  CalculationEstimate in 'CalculationEstimate.pas' {FormCalculationEstimate},
  ConnectDatabase in 'ConnectDatabase.pas' {FormConnectDatabase},
  CardObject in 'CardObject.pas' {fCardObject},
  ProgramSettings in 'ProgramSettings.pas' {FormProgramSettings},
  Waiting in 'Waiting.pas' {FormWaiting},
  KC6 in 'KC6.pas' {fKC6},
  ActC6 in 'ActC6.pas' {FormActC6},
  WorkSchedule in 'WorkSchedule.pas' {FormWorkSchedule},
  HelpC3 in 'HelpC3.pas' {FormHelpC3},
  Requisites in 'Requisites.pas' {FormRequisites},
  HelpC5 in 'HelpC5.pas' {FormHelpC5},
  CatalogSSR in 'CatalogSSR.pas' {FormCatalogSSR},
  OXRandOPR in 'OXRandOPR.pas' {FormOXRandOPR},
  SignatureSSR in 'SignatureSSR.pas' {FormSignatureSSR},
  SummaryCalculationSettings in 'SummaryCalculationSettings.pas' {FormSummaryCalculationSettings},
  DataTransfer in 'DataTransfer.pas' {FormDataTransfer},
  CalculationSettings in 'CalculationSettings.pas' {FormCalculationSettings},
  BasicData in 'BasicData.pas' {FormBasicData},
  CardEstimate in 'CardEstimate.pas' {fCardEstimate},
  ObjectsAndEstimates in 'ObjectsAndEstimates.pas' {fObjectsAndEstimates},
  Transportation in 'Transportation.pas' {FormTransportation},
  SaveEstimate in 'SaveEstimate.pas' {FormSaveEstimate},
  OwnData in 'OwnData.pas' {FormOwnData},
  fFrameProgressBar in 'fFrameProgressBar.pas' {FrameProgressBar: TFrame},
  DrawingTables in 'DrawingTables.pas',
  fFrameSmeta in 'fFrameSmeta.pas' {SmetaFrame: TFrame},
  fFrameStatusBar in 'fFrameStatusBar.pas' {FrameStatusBar: TFrame},
  fFrameOXROPR in 'fFrameOXROPR.pas' {FrameOXROPR: TFrame},
  fFramePriceDumps in 'fFramePriceDumps.pas' {FramePriceDumps: TFrame},
  fFramePriceTransportations in 'fFramePriceTransportations.pas' {FramePriceTransportations: TFrame},
  fFrameRates in 'fFrameRates.pas' {FrameRates: TFrame},
  fFrameSSR in 'fFrameSSR.pas' {FrameSSR: TFrame},
  TariffsTransportanion in 'TariffsTransportanion.pas' {FormTariffsTransportation},
  ReferenceData in 'ReferenceData.pas' {FormReferenceData},
  PricesOwnData in 'PricesOwnData.pas' {FormPricesOwnData},
  PricesReferenceData in 'PricesReferenceData.pas' {FormPricesReferenceData},
  AdditionData in 'AdditionData.pas' {FormAdditionData},
  CardMaterial in 'CardMaterial.pas' {FormCardMaterial},
  CardOrganization in 'CardOrganization.pas' {fCardOrganization},
  fTypesActs in 'fTypesActs.pas' {FrameTypesActs: TFrame},
  fIndexesChangeCost in 'fIndexesChangeCost.pas' {FrameIndexesChangeCost: TFrame},
  PartsEstimates in 'PartsEstimates.pas' {fPartsEstimates},
  TypesActs in 'TypesActs.pas' {FormTypesActs},
  IndexesChangeCost in 'IndexesChangeCost.pas' {FormIndexesChangeCost},
  CategoriesObjects in 'CategoriesObjects.pas' {fCategoriesObjects},
  CardTypesActs in 'CardTypesActs.pas' {FormCardTypesActs},
  CardIndexesChangeCost in 'CardIndexesChangeCost.pas' {FormCardIndexesChangeCost},
  CardAct in 'CardAct.pas' {fCardAct},
  Tools in 'Tools.pas',
  KC6Journal in 'KC6Journal.pas' {fKC6Journal},
  CalculationEstimateSummaryCalculations in 'CalculationEstimateSummaryCalculations.pas' {frCalculationEstimateSummaryCalculations: TFrame},
  CalculationEstimateSSR in 'CalculationEstimateSSR.pas' {frCalculationEstimateSSR: TFrame},
  CalcResourceFact in 'CalcResourceFact.pas' {fCalcResourceFact},
  CalculationDump in 'CalculationDump.pas' {FormCalculationDump},
  CalcTravel in 'CalcTravel.pas' {fCalcTravel},
  UniDict in 'UniDict.pas' {fUniDict},
  UpdateModule in 'UpdateModule.pas',
  TravelList in 'TravelList.pas' {fTravelList},
  fUpdate in 'fUpdate.pas' {UpdateForm},
  EditExpression in 'EditExpression.pas' {fEditExpression},
  dmReportU in 'dmReportU.pas' {dmReportF: TDataModule},
  Coef in 'Coef.pas' {fCoefficients},
  ArhivModule in 'ArhivModule.pas',
  GlobsAndConst in 'GlobsAndConst.pas',
  WinterPrice in 'WinterPrice.pas' {fWinterPrice},
  ReplacementMatAndMech in 'ReplacementMatAndMech.pas' {frmReplacement},
  TariffDict in 'TariffDict.pas' {fTariffDict},
  OXROPRSetup in 'OXROPRSetup.pas' {fOXROPRSetup},
  ImportExportModule in 'ImportExportModule.pas',
  CalcTravelWork in 'CalcTravelWork.pas' {fCalcTravelWork},
  fFrameSpr in 'fFrameSpr.pas' {SprFrame: TFrame},
  fFrameMaterial in 'fFrameMaterial.pas' {SprMaterial: TFrame},
  OrganizationsEx in 'OrganizationsEx.pas' {fOrganizationsEx},
  fFrameMechanizm in 'fFrameMechanizm.pas' {SprMechanizm: TFrame},
  fFrameEquipment in 'fFrameEquipment.pas' {SprEquipment: TFrame},
  TreeEstimate in 'TreeEstimate.pas' {fTreeEstimate},
  SuppAgreement in 'SuppAgreement.pas' {fSuppAgreement},
  CalcWorkerDepartment in 'CalcWorkerDepartment.pas' {fCalcWorkerDepartment},
  fFrameCalculator in 'fFrameCalculator.pas' {Calculator: TFrame},
  NormativDirectory in 'NormativDirectory.pas' {fNormativDirectory},
  CardObjectContractorServices in 'CardObjectContractorServices.pas' {fCardObjectContractorServices},
  ForecastCostIndex in 'ForecastCostIndex.pas' {fForecastCostIndex},
  FileStorage in 'FileStorage.pas' {fFileStorage},
  ForemanList in 'ForemanList.pas' {fForemanList},
  OXROPR in 'OXROPR.pas' {fOXROPR},
  SSR in 'SSR.pas' {fSSR},
  SprController in 'SprController.pas',
  CalcResource in 'CalcResource.pas' {fCalcResource},
  CalcResourceFactDiff in 'CalcResourceFactDiff.pas' {fCalcResourceFactDiff},
  CategoryList in 'CategoryList.pas' {fCategoryList},
  ArhivRestore in 'ArhivRestore.pas' {frmArhRestore},
  NormativDictHelp in 'NormativDictHelp.pas' {fNormativDictHelp},
  BuildZone in 'BuildZone.pas' {fBuildZone},
  HelpKfSt in 'HelpKfSt.pas' {fHelpKfSt},
  LogIn in 'LogIn.pas' {fLogIn},
  Users in 'Users.pas' {fUsers},
  RoundSetup in 'RoundSetup.pas' {fRoundSetup},
  InstructionHelp in 'InstructionHelp.pas' {fInstructionHelp},
  TypeWorkList in 'TypeWorkList.pas' {fTypeWorkList},
  SectionEstimateList in 'SectionEstimateList.pas' {fSectionEstimateList},
  SprSelection in 'SprSelection.pas' {fSprSelection},
  TranspPersSelect in 'TranspPersSelect.pas' {fTrPersSelect},
  CopyToOwnDialog in 'CopyToOwnDialog.pas' {fCopyToOwnDialog},
  SelectDialog in 'SelectDialog.pas' {fSelectDialog},
  ManualSprItem in 'ManualSprItem.pas' {ManSprCardForm},
  ManualPriceSelect in 'ManualPriceSelect.pas' {fmManPriceSelect},
  DebugTables in 'DebugTables.pas' {fDebugTables},
  fFrameLoading in 'fFrameLoading.pas' {FrameLoading: TFrame},
  UserAccess in 'UserAccess.pas' {fUserAccess};

{$R *.res}
var MHandle: THandle;
    PrmStr: string;
begin
  // Любая уникальная строка которая будет только в нашем приложении
  MHandle := CreateMutex(nil, True, '5q7b3g1p0b5n3x6v9e6s');

  // Проверяем не запущено ли приложение
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    MessageBox(0, 'Одна копия программы уже открыта.' + sLineBreak + sLineBreak +
      'Запуск нескольких копий программы невозможен.', 'Расчёт сметы', MB_ICONWARNING + mb_OK + mb_TaskModal);
    Exit;
  end;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SMR - HPP 2012';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TfCardObject, fCardObject);
  Application.CreateForm(TFormWaiting, FormWaiting);
  Application.CreateForm(TFormRequisites, FormRequisites);
  Application.CreateForm(TFormSignatureSSR, FormSignatureSSR);
  Application.CreateForm(TFormSummaryCalculationSettings, FormSummaryCalculationSettings);
  Application.CreateForm(TFormCalculationSettings, FormCalculationSettings);
  Application.CreateForm(TFormBasicData, FormBasicData);
  Application.CreateForm(TfCardEstimate, fCardEstimate);
  Application.CreateForm(TFormSaveEstimate, FormSaveEstimate);
  Application.CreateForm(TFormCardMaterial, FormCardMaterial);
  Application.CreateForm(TFormTypesActs, FormTypesActs);
  Application.CreateForm(TFormCardTypesActs, FormCardTypesActs);
  Application.CreateForm(TFormCardIndexesChangeCost, FormCardIndexesChangeCost);
  Application.CreateForm(TFormIndexesChangeCost, FormIndexesChangeCost);
  Application.CreateForm(TfKC6, fKC6);
  Application.CreateForm(TdmReportF, dmReportF);
  Application.CreateForm(TfCoefficients, fCoefficients);
  Application.Run;

  //Запуск Updater для завершения обновления приложения
  if (G_STARTUPDATER in [1,2]) then
  begin
    //Формируем строку параметров
    PrmStr := ' ';
    case G_STARTUPDATER of
      1: PrmStr := PrmStr + C_UPD_UPDATE + ' ';
      2: PrmStr := PrmStr + C_UPD_RESTOR + ' ';
    end;
    PrmStr := PrmStr + C_UPD_PATH + '="' + G_UPDPATH + '" '; //Путь
    if G_NEWAPPVERS > 0 then  //Версия после обновления
      PrmStr := PrmStr + C_UPD_VERS + '=' + IntToStr(G_NEWAPPVERS) + ' ';
    if G_STARTAPP then //Запуск приложения после того как апдейтер отработает
      PrmStr := PrmStr + C_UPD_START + ' ';
    PrmStr := PrmStr + C_UPD_APP + '="' + ExtractFileName(Application.ExeName) + '" ';

    ShellExecute(0,'open',
      PChar(ExtractFilePath(Application.ExeName) + C_UPDATERNAME),
      PChar(PrmStr), nil ,SW_HIDE);
  end;

  ReleaseMutex(MHandle);
  CloseHandle(MHandle);
end.

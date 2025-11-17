import 'package:fin_uslugi/core/constants/constants.dart';
import 'package:fin_uslugi/features/programms/data/models/product_item_model.dart';
import 'package:intl/intl.dart';

List<String> getValues(ProductItemModel productItemModel) {
  return [
    'до ${NumberFormat('#,##0').format(productItemModel.params.maxSum).replaceAll(',', ' ')} ₽',
    'от ${productItemModel.params.minRate}% годовых',
    'от ${productItemModel.params.minPsk}%',
    (dictPurposesTranslate(productItemModel.params.dictPurposes)),
    'от ${productItemModel.params.minRate.toInt()} мес.',
    'до ${productItemModel.params.minTime} дня',
  ];
}

List<String> getValuesSecondBar(ProductItemModel productItemModel) {
  return [
    'от ${productItemModel.params.debtorAge} года',
    docRequiremets(productItemModel.params.docRequirements),
    'Паспорт, СНИЛС, Заверенная копия трудовой книжки или трудовой договор',
  ];
}

String docRequiremets(List<String> docRequirements) {
  String translatedDocuments = '';

  for (var element in docRequirements) {
    if (translatedDocuments.isNotEmpty) translatedDocuments += ' ';
    var documentString = documents[int.parse(element)];
    documentString != null ? translatedDocuments += '$documentString,' : null;
  }
  var indexLastComma = translatedDocuments.lastIndexOf(',') == -1
      ? translatedDocuments.length
      : translatedDocuments.lastIndexOf(',');
  return translatedDocuments.substring(0, indexLastComma);
}

String dictPurposesTranslate(List<String> dictPurposes) {
  String translatedPurpose = '';
  for (var element in dictPurposes) {
    if (translatedPurpose.isNotEmpty) translatedPurpose += ' ';
    if (element == 'newFlat') {
      translatedPurpose += 'Квартира в новостройке,';
    }
    if (element == 'refinancing') {
      translatedPurpose += 'Рефинансирование';
    }
    if (element == 'secondaryFlat') {
      translatedPurpose += 'Вторичное жилье,';
    }
    if (element == 'secondaryFlat') {
      translatedPurpose += 'Вторая квартира,';
    }
    if (element == 'townhouse') {
      translatedPurpose += 'Таунхаус,';
    }
    if (element == 'countryHouse') {
      translatedPurpose += 'Загородный дом/участок,';
    }
    if (element == 'constructionHouse') {
      translatedPurpose += 'Строительство дома,';
    }
    if (element == 'garage') {
      translatedPurpose += 'Покупка гаража,';
    }
  }
  var indexLastComma = translatedPurpose.lastIndexOf(',') == -1
      ? translatedPurpose.length
      : translatedPurpose.lastIndexOf(',');
  return translatedPurpose.substring(0, indexLastComma);
}

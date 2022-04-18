// <copyright file="INavigationService.dart" company="AcerPro Bilişim Teknolojileri A.Ş.">
//     Copyright (c)
// </copyright>

abstract class INavigationService {
  Future<void> navigateToPage({String? path, Object? data});
  Future<void> navigateToPageClear({String? path, Object? data});
}

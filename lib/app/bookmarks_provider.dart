import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/pagination.dart';

class BookmarksProvider extends ChangeNotifier {
  BookmarksProvider({@required this.client}) : assert(client != null);

  final GraphQLClient client;

  final _bookmarksQuery = BookmarksQuery();
  final _removeBookmarkMutation = RemoveBookmarkMutation();
  final _addBookmarkMutation = AddBookmarkMutation();

  PaginatedBookmarkResponseMixin _bookmarks;
  PaginatedBookmarkResponseMixin get bookmarks => _bookmarks;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasException = false;
  bool get hasException => _hasException;

  OperationException _exception;
  OperationException get exception => _exception;

  QueryResult _result;
  QueryResult get result => _result;

  QueryOptions _options;

  Future<void> getBookmarks() async {
    _isLoading = true;
    notifyListeners();

    _options = QueryOptions(document: _bookmarksQuery.document, fetchPolicy: FetchPolicy.cacheAndNetwork);

    _result = await client.query(_options);

    if (_result.hasException) {
      _exception = _result.exception;
      _hasException = true;
      _isLoading = false;
      notifyListeners();
    }

    _bookmarks = _bookmarksQuery.parse(_result.data).bookmarks;
    _hasException = false;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMore() async {
    final options = FetchMoreOptions(
      document: _bookmarksQuery.document,
      updateQuery: (oldData, newData) => updatePaginatedResponse(oldData, newData, "bookmarks"),
      variables: {"skip": bookmarks.items.length},
    );

    final result = await client.fetchMore(options, originalOptions: _options, previousResult: _result);
    if (result.hasException) {
      return;
    }

    _bookmarks = _bookmarksQuery.parse(result.data).bookmarks;
    notifyListeners();
  }

  Future<void> addBookmark(String productId) async {
    await client.mutate(MutationOptions(document: _addBookmarkMutation.document, variables: {"productId": productId}));
    await getBookmarks();
  }

  Future<void> removeBookmark(String productId) async {
    await client.mutate(MutationOptions(document: _removeBookmarkMutation.document, variables: {"productId": productId}));
    await getBookmarks();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/common/utils/pagination.dart';
import 'package:hassah_book_flutter/graphql/add_bookmark.query.graphql.dart';
import 'package:hassah_book_flutter/graphql/bookmark.fragment.graphql.dart';
import 'package:hassah_book_flutter/graphql/bookmarks.query.graphql.dart';
import 'package:hassah_book_flutter/graphql/remove_bookmark.query.graphql.dart';

class BookmarksProvider extends ChangeNotifier {
  BookmarksProvider({required this.client});

  final GraphQLClient client;

  Fragment$PaginatedBookmarkResponse? _bookmarks;
  Fragment$PaginatedBookmarkResponse? get bookmarks => _bookmarks;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasException = false;
  bool get hasException => _hasException;

  OperationException? _exception;
  OperationException? get exception => _exception;

  QueryResult<Query$Bookmarks>? _result;
  QueryResult<Query$Bookmarks>? get result => _result;

  late Options$Query$Bookmarks _options;

  Future<void> getBookmarks() async {
    _isLoading = true;
    notifyListeners();

    _options = Options$Query$Bookmarks(
      fetchPolicy: FetchPolicy.noCache,
    );

    _result = await client.query$Bookmarks(_options);

    if (_result!.hasException) {
      _exception = _result!.exception;
      _hasException = true;
      _isLoading = false;
      notifyListeners();
      return;
    }

    _bookmarks = result!.parsedData!.bookmarks;
    _hasException = false;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMore() async {
    final options = FetchMoreOptions$Query$Bookmarks(
      updateQuery: (oldData, newData) =>
          updatePaginatedResponse(oldData!, newData!, "bookmarks"),
      variables: Variables$Query$Bookmarks(skip: bookmarks!.items.length),
    );

    final result = await client.fetchMore(
      options,
      originalOptions: _options,
      previousResult: _result!,
    );
    if (result.hasException) {
      return;
    }

    _bookmarks = result.parsedData!.bookmarks;
    notifyListeners();
  }

  Future<void> addBookmark(String productId) async {
    await client.mutate$AddBookmark(
      Options$Mutation$AddBookmark(
        variables: Variables$Mutation$AddBookmark(productId: productId),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );
    await getBookmarks();
  }

  Future<void> removeBookmark(String productId) async {
    await client.mutate$RemoveBookmark(
      Options$Mutation$RemoveBookmark(
        variables: Variables$Mutation$RemoveBookmark(productId: productId),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );
    await getBookmarks();
  }
}

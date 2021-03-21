import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/common/auth/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<GraphQLClient> clientFor({
  @required String uri,
  String subscriptionUri,
}) {
  final httpLink = HttpLink(uri, httpClient: AuthClient());

  final authLink = AuthLink(
    getToken: () async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('admin_access_token');
      return token != null ? 'Bearer $token' : '';
    },
  );

  Link link = authLink.concat(httpLink);

  if (subscriptionUri != null) {
    final WebSocketLink websocketLink = WebSocketLink(
      subscriptionUri,
      config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: Duration(seconds: 30),
      ),
    );

    link = link.concat(websocketLink);
  }

  return ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    ),
  );
}

class DashboardGraphQLProvider extends StatelessWidget {
  DashboardGraphQLProvider({
    @required this.child,
    @required String uri,
    String subscriptionUri,
    GraphQLCache cache,
  }) : client = clientFor(uri: uri, subscriptionUri: subscriptionUri);

  final Widget child;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/common/auth/auth.dart';

ValueNotifier<GraphQLClient> clientFor(
    {required String uri, String? subscriptionUri}) {
  final authLink = AuthLink(
    getToken: () {
      final token = Auth.getToken(TokenType.Access);
      return token != null ? "Bearer $token" : "";
    },
  );

  Link link = authLink.concat(HttpLink(uri, httpClient: AuthClient()));
  if (subscriptionUri != null) {
    final WebSocketLink websocketLink = WebSocketLink(
      subscriptionUri,
      config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: const Duration(seconds: 30),
      ),
    );

    link = link.concat(websocketLink);
  }

  return ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
    ),
  );
}

/// Wraps the root application with the `graphql_flutter` client.
/// We use the cache for all state management.
class HassahGraphQLProvider extends StatelessWidget {
  HassahGraphQLProvider(
      {this.child, this.builder, required String uri, String? subscriptionUri})
      : assert(
            (child == null && builder != null) ||
                (child != null && builder == null),
            "child or builder must be provided"),
        client = clientFor(uri: uri, subscriptionUri: subscriptionUri);

  final Widget? child;
  final Widget Function(BuildContext, GraphQLClient client)? builder;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: child ?? builder!(context, client.value),
    );
  }
}

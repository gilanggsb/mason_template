// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../../features/features.dart';
// import 'route_observer.dart';

// GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// BuildContext? globalContext = navigatorKey.currentContext;

// class MyRouterDelegate {
//   MyRouterDelegate._();

//   static final instance = MyRouterDelegate._();

//   // GoRouter configuration
//   final routerConfig = GoRouter(
//     debugLogDiagnostics: true,
//     navigatorKey: navigatorKey,
//     observers: [RouterObserver()],
//     initialLocation: '/',
//     routes: [
//       GoRoute(
//         path: RouteName.splash.pathName,
//         name: RouteName.splash.name,
//         builder: (context, state) => const SplashScreen(),
//       ),
//       GoRoute(
//         path: RouteName.jalaMedia.pathName,
//         name: RouteName.jalaMedia.name,
//         builder: (context, state) => const JalaMediaScreen(),
//       ),
//       GoRoute(
//         path: RouteName.webviewBlog.pathName,
//         name: RouteName.webviewBlog.name,
//         builder: (context, state) => WebviewBlogScreen(
//           webviewParams: state.extra as WebviewParamsScreen,
//         ),
//       ),
//       GoRoute(
//         path: RouteName.shrimpPrices.pathName,
//         name: RouteName.shrimpPrices.name,
//         builder: (context, state) => const ShrimpPricesScreen(),
//         routes: [
//           GoRoute(
//             path: RouteName.detailShrimpPrices.pathName,
//             name: RouteName.detailShrimpPrices.name,
//             builder: (context, state) => DetailShrimpPricesScreen(
//               detailShrimpPricesParams: state.extra as DetailShrimpPricesParams,
//             ),
//           ),
//         ],
//       ),
//     ],
//   );

//   void showSnackbar(String text, {Widget? child}) {
//     ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
//       SnackBar(
//         content: child ??
//             DefaultText(
//               text,
//               color: AppColors.white,
//             ),
//       ),
//     );
//   }
// }
